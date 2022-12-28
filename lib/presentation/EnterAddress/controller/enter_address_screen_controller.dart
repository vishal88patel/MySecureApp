import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid_util.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../loader_screen.dart';

class EnterAddressScreenController extends GetxController {
  TextEditingController address01Controller = TextEditingController();
  TextEditingController address02Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  var stateList = [].obs;
  var placeList = [].obs;
  RxList placeListMain = [].obs;
  var selectedState = "Select State".obs;
  String? selectedStateFordropdown;
  var _sessionToken = "";
  String kGoogleApiKey = "AIzaSyBtUdi1qj1fT6Mh-maMGVmmCtlt9991RMg";

  var uuid = Uuid();

  var animConHeight = 0.00.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    address01Controller.addListener(() {
      _onChanged();
    });
    Future.delayed(Duration(milliseconds: 50), () {
      getStateList();
    });
    super.onInit();
  }

  _onChanged() {
    if (_sessionToken == null) {
      _sessionToken = uuid.v4();
    }
    getSuggestion(address01Controller.text);
  }


  void getSuggestion(String input) async {
    String kPLACES_API_KEY = kGoogleApiKey;
    String type = '(regions)';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      placeList.value = json.decode(response.body)['predictions'];
      print(placeList.value.length.toString());
      if (placeList.value.isNotEmpty) {
        animConHeight.value = 300;
      } else {
        animConHeight.value = 0.00;
      }
    } else {
      throw Exception('Failed to load predictions');
    }
  }


  @override
  void onClose() {
    super.onClose();
  }

  onTapOfNextButton() {
    if (address01Controller.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter first address",
          headerText: StringConstants.ERROR);
    } else if (cityController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter city", headerText: StringConstants.ERROR);
    } else if (selectedState.value.isEmpty ||selectedState.value =="Select State" ) {
      UIUtils.showSnakBar(
          bodyText: "Please enter state", headerText: StringConstants.ERROR);
    } else if (zipCodeController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter zipcode", headerText: StringConstants.ERROR);
    } else if (zipCodeController.text.length != 5) {
      UIUtils.showSnakBar(bodyText: "Please 5 digit zip code",
          headerText: StringConstants.ERROR);
    } else {
      // Get.toNamed(AppRoutes.enterPersonalDetailScreen);
      Get.to(() => LoaderScreen(AppRoutes.enterPersonalDetailScreen),
          transition: Transition.rightToLeft);
    }
  }

  Future<void> getStateList() async {
    ApiService()
        .callGetApi(
        body: FormData({}),
        headerWithToken: false,
        url: ApiEndPoints.GET_STATE)
        .then((value) {
      print(value);
      if (value['status']) {
        stateList.value = value['data'] ?? [];
        // selectedState.value=stateList.value[0];
        print(stateList);
        // loanModel.value = GetLoanTypeResponseModel.fromJson(value);
        // loanList.value = loanModel.value.data ?? [];
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  void setSelectedState(String string) {
    selectedState.value = string;
    selectedStateFordropdown = string;
    stateList.refresh();
  }

  Future<void> onTapOfAddressTile(value) async {
    address01Controller.text = value['terms'][0]['value'].toString() + " " + value['terms'][1]['value'].toString();
    cityController.text=value['terms'][2]['value'].toString();
    selectedState.value=value['terms'][3]['value'].toString();
    List<Location> locations = await locationFromAddress(value['description'].toString());
    print(locations.toString());
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locations[0].latitude, locations[0].longitude);
    Placemark place = placemarks[0];
    zipCodeController.text=place.postalCode.toString();
    animConHeight.value=0.00;

  }
}
