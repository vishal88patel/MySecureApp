import 'package:get/get.dart';
import '../presentation/LoginScreen/binding/login_screen_binding.dart';
import '../presentation/LoginScreen/login_screen.dart';
import '../presentation/SplashScreen/binding/splash_screen_binding.dart';
import '../presentation/SplashScreen/splash_screen.dart';
import '../presentation/WebViewPage/binding/webview_binding.dart';
import '../presentation/WebViewPage/webview_screen.dart';


class AppRoutes {
  /// Splash Screen
  static String splashScreen = '/splash_screen';
  static String loginScreen = '/login_screen';
  static String loginEmailScreen = '/login_email_screen';
  static String creatPasswordScreen = '/create_password_screen';
  static String enterPasswordScreen = '/enter_password_screen';
  static String enterLegalNameScreen = '/enter_legal_name_screen';
  static String enterAddressScreen = '/enter_address_screen';
  static String enterPersonalDetailScreen = '/enter_personal_detail_screen';
  static String forgetPassScreen = '/forget_pass_screen';
  static String personalDetailScreen = '/personal_detail_screen';
  static String bankListScreen = '/bank_list_screen';
  static String myLinkedBankListScreen = '/my_linked_bank_list_screen';
  static String selectBankListScreen = '/select_bank_list_screen';
  static String myBankAccountListScreen = '/my_bank_account_list_screen';
  static String cardDetailScreen = '/card_detail_screen';
  static String cardLoaderScreen = '/card_loading_screen';
  static String accountDetailListScreen = '/account__detail_list_screen';
  static String cardDetailListScreen = '/card_detail_list_screen';
  static String cardListScreen = '/card_list_screen';
  static String bankDetailScreen = '/bank_detail_screen';
  static String amountNumPadScreen = '/amount_num_pad_screen';
  static String cashOutAmountNumPadScreen = '/cash_out_amount_num_pad_screen';
  static String progressScreen = '/progress_screen';
  static String successScreen = '/success_screen';
  static String pinScreen = '/pin_screen';
  static String approvedScreen = '/approved_screen';
  static String bankProceedScreen = '/bank_procees_screen';
  static String addBankProceedScreen = '/add_bank_procees_screen';
  static String dashBoardScreen = '/dashboard_screen';
  static String loanCalculatorScreen = '/loan_calculator_screen';
  static String loanInfoScreen = '/loan_info_screen';
  static String loanFnameScreen = '/loan_fname_screen';
  static String loanLnameScreen = '/loan_lname_screen';
  static String loanEmailScreen = '/loan_email_screen';
  static String loanDobScreen = '/loan_dob_screen';
  static String loanSsnScreen = '/loan_ssn_screen';
  static String loanAddressScreen = '/loan_address_screen';


  static String homeScreen = '/home_screen';
  static String profileScreen = '/profile_screen';
  static String userPersonalScreen = '/userPersonal_screen';
  static String privacyPolicyScreen = '/privacyPolicyScreen_screen';
  static String supportScreen = '/support_screen';
  static String notificationScreen = '/notification_screen';
  static String faqScreen = '/faq_screen';
  static String moreHelpScreen = '/moreHelp_screen';
  static String loanStepScreen = '/loan_step_screen';
  static String cardProfileDetailScreen = '/card_profile_detail_screen';
  static String transactionScreen = '/transaction_screen';
  static String uploadDocument1= '/upload_document1';
  static String uploadDocument2= '/upload_document2';
  static String linkBankListScreen= '/link_bank_list_screen';
  static String webviewPage = '/webView_page';
  static String collectDetailScreen = '/collect_detail_screen';
  static String qrCodeScreen = '/qr_code_screen';
  static String loan_approved = '/loan_approved_screen';
  static String enterSnnDetailScreen = '/enter_Snn_detail_screen';
  static String purpouseAccountScreen = '/purpouse_account_screen';
  static String kvcPhoneNumber = '/kvc_phone_number';
  static String kycEmail = '/kvc_email';
  static String kvcOtpNumber = '/kvc_otp_number';
  static String kycInfoScreen = '/kyc_info_screen';
  static String kycLoadingScreen = '/kyc_loading_screen';
  static String cameraScreen = '/camera_screen';
  static String enterSecureTagScreen = '/enter_secure_tag_screen';
  static String otpVerifySuccessfullyScreen = '/otp_verify_successfully_screen';


  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    ),

    GetPage(
      name: loginScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoginScreen(),
      bindings: [
        LoginScreenBinding(),
      ],
    ),



    GetPage(
      name: webviewPage,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => WebviewScreen(),
      bindings: [
        WbviewScreenBinding(),
      ],
    ),



  ];
}
