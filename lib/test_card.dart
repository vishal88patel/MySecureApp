import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/utils/ConstantsFiles/string_constants.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';

import 'ApiServices/api_service.dart';
import 'App Configurations/api_endpoints.dart';
import 'Custom Widgets/main_custom_background.dart';

class MySample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySampleState();
  }
}

class MySampleState extends State<MySample> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(0), vertical: getVerticalSize(0)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    CreditCardWidget(
                      glassmorphismConfig: Glassmorphism.defaultConfig(),
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      bankName: 'Bank Name',
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: Colors.red,
                      backgroundImage: "asset/card_image.png",
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                          cardType: CardType.mastercard,
                          cardImage: Image.asset(
                            'asset/master_card_back.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CreditCardForm(
                              formKey: formKey,
                              obscureCvv: true,
                              obscureNumber: true,
                              cardNumber: cardNumber,
                              cvvCode: cvvCode,
                              isHolderNameVisible: true,
                              isCardNumberVisible: true,
                              isExpiryDateVisible: true,
                              cardHolderName: cardHolderName,
                              expiryDate: expiryDate,
                              themeColor: Colors.blue,
                              textColor: Colors.white,
                              cardNumberDecoration: InputDecoration(
                                labelText: 'Number',
                                hintText: 'XXXX XXXX XXXX XXXX',
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                focusedBorder: border,
                                enabledBorder: border,
                              ),
                              expiryDateDecoration: InputDecoration(
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                focusedBorder: border,
                                enabledBorder: border,
                                labelText: 'Expired Date',
                                hintText: 'XX/XX',
                              ),
                              cvvCodeDecoration: InputDecoration(
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                focusedBorder: border,
                                enabledBorder: border,
                                labelText: 'CVV',
                                hintText: 'XXX',
                              ),
                              cardHolderDecoration: InputDecoration(
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                focusedBorder: border,
                                enabledBorder: border,
                                labelText: 'Card Holder',
                              ),
                              onCreditCardModelChange: onCreditCardModelChange,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                backgroundColor: const Color(0xff1b447b),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                child: const Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'halter',
                                    fontSize: 14,
                                    package: 'flutter_credit_card',
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  checkCardType(cardNumber);
                                  // callAddCardApi();
                                } else {
                                  print('invalid!');
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    ));
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Future<void> callAddCardApi(String type) async {
    ApiService()
        .callPostApi(
            body: await getRegisterBody(
              holder_name: cardHolderName,
              card_number: cardNumber,
              expire_year: expiryDate.split('/')[1],
              expire_month: expiryDate.split('/')[0],
              cvv: cvvCode,
              card_type: type,
            ),
            headerWithToken: true,
            url: ApiEndPoints.SAVE_CREDITCARD)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        Get.offAllNamed(AppRoutes.progressScreen,
            arguments: {"destinationRoute": AppRoutes.dashBoardScreen});
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getRegisterBody({
    required String holder_name,
    required String card_number,
    required String expire_year,
    required String expire_month,
    required String cvv,
    required String card_type,
  }) async {
    final form = FormData({
      "holder_name": holder_name,
      "card_number": card_number,
      "expire_year": expire_year,
      "expire_month": expire_month,
      "cvv": cvv,
      "card_type": card_type,
    });
    return form;
  }

  void checkCardType(String number) {
    var type = detectCCType(number);
    // assert(type == CreditCardType.visa);
    switch (type) {
      case CreditCardType.visa:
        callAddCardApi("visa");
        break;
      case CreditCardType.mastercard:
        callAddCardApi("visa");

        break;
      case CreditCardType.mastercard:
        callAddCardApi("mastercard");

        break;
      case CreditCardType.discover:
        callAddCardApi("discover");

        break;

      case CreditCardType.dinersclub:
        callAddCardApi("dinersclub");

        break;

      case CreditCardType.jcb:
        callAddCardApi("jcb");

        break;

      case CreditCardType.unionpay:
        callAddCardApi("unionpay");

        break;

      case CreditCardType.maestro:
        callAddCardApi("maestro");

        break;

      case CreditCardType.mir:
        callAddCardApi("mir");

        break;

      case CreditCardType.elo:
        callAddCardApi("elo");

        break;

      default:
        UIUtils.showSnakBar(
          headerText: StringConstants.ERROR,
          bodyText: "Please enter Valid card",
        );
        break;
    }
  }
}
