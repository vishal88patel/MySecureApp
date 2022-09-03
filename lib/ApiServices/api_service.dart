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

  Future<dynamic> callSIgnIN(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.SIGN_UP,
      body,
      headers: headers,
      contentType: contentType,
    );
    print("UUUUUUUUUUUUUUU" +
        response.status.code.toString() +
        "---------" +
        response.status.toString());
    if (response.status.hasError) {
      print(response.status.code.toString() + response.toString());

      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> callLogIn(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.LOG_IN,
      body,
      headers: headers,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> callDailyHoroscope(FormData body) async {
    await initApiService();
    final response = await post(
      ApiEndPoints.DAILY_HOROSCOPE,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  /// old api function for astrologer list for call and chat page
  // Future<dynamic> allAstrologerList(FormData body) async {
  //   await initApiService();
  //   final response = await post(
  //     ApiEndPoints.ALL_ASTROLOGER_LIST,
  //     body,
  //     headers: headersWithToken,
  //     contentType: contentType,
  //   );
  //   if (response.status.hasError) {
  //     return Future.error(response.statusText!);
  //   } else {
  //     return response.body;
  //   }
  // }

  Future<dynamic> callHomePage() async {
    await initApiService();
    final response = await get(
      ApiEndPoints.GET_HOMEPAGE + DateTime.now().toString(),
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> verifyOtp(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.VERIFY_OTP,
      body,
      headers: headers,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> resendOTP(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.RESEND_OTP,
      body,
      headers: headers,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> callSocialLogin(FormData body) async {
    await initApiService();
    final response = await post(
      ApiEndPoints.SOCIAL_LOGIN,
      body,
      headers: headers,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> forceUpdate(FormData body) async {
    final response = await post(
      ApiEndPoints.FORCE_UPDATE,
      body,
      headers: {"Accept": "application/json"},
      contentType: contentType,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> astroProfileList(FormData body) async {
    await initApiService();
    final response = await post(
      ApiEndPoints.ASTRO_PROFILE_LIST,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> fetchAstrologerDetails(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.GET_ASTROLOGER_INFO,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }


  Future<dynamic> callProductSubCategoryListingApi(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.GET_ASTRO_SUBCATEGORY_PRODUCT_LIST,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> fetchUserEligibilityForCall(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.GET_ASTROLOGER_USER_CALL_LIMIT,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> fetchUserEligibilityForChat(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.GET_ASTROLOGER_USER_CHAT_LIMIT,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> getUserTransactions(FormData body) async {
    await initApiService();
    final response = await post(
      ApiEndPoints.GET_USER_TRANSACTIONS,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getAstroListFilterValues(FormData body) async {
    await initApiService();
    final response = await post(
      ApiEndPoints.GET_ASTRO_LIST_FILTER_VALUES,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getAllReviewList(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.ALL_REVIEW,
      body,
      headers: headers,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> fetchDetailfromProductId(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.CHECKOUT_PAGE_DETAILS,
      body,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer" + " " + "$authToken",
        "language":"hi",
      },
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> getCart() async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.CART_API,
      FormData({}),
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> createOrder(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.CREATE_ORDER,
      body,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer" + " " + "$authToken",
        "language":"hi",
      },
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> generateTokenForPaytm(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.GENERATE_PAYTM_TOKEN,
      body,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer" + " " + "$authToken",
        "language":"hi",
      },
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> updateCart(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.UPDATE_CART_API,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> deleteToCart(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.DELETE__TO_CART_API,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> productAddToCartApi(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.ADD_TO_CART_API,
      body,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer" + " " + "$authToken",
        "language":"hi",
      },
      contentType: contentType,
    );
    if (response.status.hasError) {
      UIUtils.hideProgressDialog();
      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

  Future<dynamic> getCountyList() async {
    await initApiService();
    final response = await get(
      "https://api.ganeshaspeaks.com/location/countrylist" ,
      headers: {
        "Accept": "application/json",
        "x-api-key": "wksIXCKW5anP3TawS56CvMUIZclkCpayrUbE6Y90"
      },
      contentType: contentType,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getAllAstrologerList() async {
    await initApiService();
    final response = await get(
      ApiEndPoints.GET_ALL_ASTROLOGER_LIST ,
      headers: headers,
      contentType: contentType,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> callAddShipingAddress(FormData body) async {
    UIUtils.showProgressDialog(isCancellable: false);
    await initApiService();
    final response = await post(
      ApiEndPoints.ADD_SHIPPING_ADDRESS,
      body,
      headers: headersWithToken,
      contentType: contentType,
    );
    if (response.status.hasError) {
      print(response.status.code.toString() + response.toString());

      return Future.error(response.statusText!);
    } else {
      UIUtils.hideProgressDialog();
      return response.body;
    }
  }

}
