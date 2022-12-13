import 'package:get/get_connect/connect.dart';

import '../App Configurations/api_endpoints.dart';
import '../utils/ConstantsFiles/string_constants.dart';
import '../utils/HelperFiles/pref_utils.dart';
import '../utils/HelperFiles/ui_utils.dart';
import 'network_info.dart';

class ApiService extends GetConnect {
  var headers;
  var headersWithToken;
  var contentType;
  String authToken = '';

  Future<void> getToken() async {}

  Future<void> initApiService() async {
    await NetworkInfo.checkNetwork().whenComplete(() async {
      authToken = await PrefUtils.getString(StringConstants.AUTH_TOKEN);
      print("Auth Token from API service is :- $authToken");
      headers = {"Accept": "application/json"};
      headersWithToken = {
        "Accept": "application/json",
        "Authorization": "Bearer" + " " + "$authToken"
      };
      contentType = "multipart/form-data";
    });
  }



  Future<dynamic> callPostApi(
      {required FormData body,
      required url,
      bool showLoader = true,
      bool headerWithToken = true}) async {
    print("Auth Token from API service is :- $authToken");

    if (showLoader) {
      UIUtils.showProgressDialog(isCancellable: false);
    }
    await initApiService();
    final response = await post(
      url,
      body,
      headers: headerWithToken ? headersWithToken : headers,
      contentType: contentType,
    );
    if (response.status.hasError) {
      if (showLoader) {
        UIUtils.hideProgressDialog();
      }
      return response.body;
    } else {

      if (showLoader) {
        UIUtils.hideProgressDialog();
      }
      return response.body;
    }
  }



  Future<dynamic> callGetApi(
      {required FormData body,
      required url,
      bool showLoader = true,
      bool headerWithToken = true}) async {
    if (showLoader) {
      UIUtils.showProgressDialog(isCancellable: false);
    }
    await initApiService();
    final response = await get(
      url,
      headers: headerWithToken ? headersWithToken : headers,
      contentType: contentType,
    );
    if (response.status.hasError) {
      if (showLoader) {
        UIUtils.hideProgressDialog();
      }
      return response.body;
    } else {
      if (showLoader) {
        UIUtils.hideProgressDialog();
      }
      return response.body;
    }
  }


}
