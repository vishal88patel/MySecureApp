import 'package:get/get.dart';
import '../presentation/AuthOptionScreen/auth_option_screen.dart';
import '../presentation/AuthOptionScreen/binding/auth_option_screen_binding.dart';
import '../presentation/CreatePasswordScreen/binding/create_password_screen_binding.dart';
import '../presentation/CreatePasswordScreen/create_password_screen.dart';
import '../presentation/DashBoardScreen/binding/dashboard_screen_binding.dart';
import '../presentation/DashBoardScreen/dashboard_screen.dart';
import '../presentation/EnterAddress/binding/enter_address_screen_binding.dart';
import '../presentation/EnterAddress/enter_address_screen.dart';
import '../presentation/EnterLegalNameDetails/binding/enter_legel_name_screen_binding.dart';
import '../presentation/EnterLegalNameDetails/enter_first_name_screen.dart';
import '../presentation/EnterLegalNameDetails/enter_secure_tag_screen.dart';
import '../presentation/EnterPasswordScreen/binding/enter_password_screen_binding.dart';
import '../presentation/EnterPasswordScreen/enter_password_screen.dart';
import '../presentation/EnterPersonalDetails/binding/enter_personal_detail_screen_binding.dart';
import '../presentation/EnterPersonalDetails/enter_personal_detail_screen.dart';
import '../presentation/EnterPersonalDetails/ssn_details.dart';
import '../presentation/HomeScreen/binding/home_screen_binding.dart';
import '../presentation/HomeScreen/home_screen.dart';
import '../presentation/LoginScreen/binding/login_screen_binding.dart';
import '../presentation/LoginScreen/login_screen.dart';
import '../presentation/NotificationScreen/binding/notification_screen_binding.dart';
import '../presentation/NotificationScreen/notification_screen.dart';
import '../presentation/OnBoardingScreen/onBoarding_screen.dart';
import '../presentation/PersonalDetails/Purpouse_opening_account_screen.dart';
import '../presentation/PersonalDetails/binding/personal_detail_screen_binding.dart';
import '../presentation/PersonalDetails/personal_detail_screen.dart';
import '../presentation/ScanScreen/binding/scan_screen_binding.dart';
import '../presentation/ScanScreen/scan_password_screen.dart';
import '../presentation/ScanScreen/scan_screen.dart';
import '../presentation/ScanScreen/scan_summary_screen.dart';
import '../presentation/OnBoardingScreen/binding/onboarding_screen_binding.dart';
import '../presentation/SplashScreen/binding/splash_screen_binding.dart';
import '../presentation/SplashScreen/splash_screen.dart';
import '../presentation/WebViewPage/binding/webview_binding.dart';
import '../presentation/WebViewPage/webview_screen.dart';
import '../presentation/statistic/binding/statistic_screen_binding.dart';
import '../presentation/statistic/statistic.dart';


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
  static String onBoardingScreen = '/onBoarding_screen';
  static String authOptionScreen = '/auth_option_screen';
  //static String enterPasswordScreen = '/enter_password_screen';
  //static String creatPasswordScreen = '/creat_password_screen';
  //static String enterLegalNameScreen = '/enter_legal_name_screen';
  static String enterSecureTagScreen = '/enter_secureTag_screen';
  //static String enterAddressScreen = '/enter_address_screen';
 // static String enterPersonalDetailScreen = '/enter_personal_detail_screen';
  static String enterSnnDetailScreen = '/enter_snn_detail_screen';
  //static String personalDetailScreen = '/personal_detail_screen';
  static String purpouseAccountScreen = '/purpouse_account_screen';
  static String scanScreen = '/scan_screen';
  static String scanSummaryScreen = '/scan_summary_screen';
  static String scanPasswordScreen = '/scan_password_screen';
  static String collectDetailScreen = '/collect_detail_screen';
  static String qrCodeScreen = '/qr_code_screen';
  static String loan_approved = '/loan_approved_screen';
 // static String enterSnnDetailScreen = '/enter_Snn_detail_screen';
//  static String purpouseAccountScreen = '/purpouse_account_screen';
  static String kvcPhoneNumber = '/kvc_phone_number';
  static String kycEmail = '/kvc_email';
  static String kvcOtpNumber = '/kvc_otp_number';
  static String kycInfoScreen = '/kyc_info_screen';
  static String kycLoadingScreen = '/kyc_loading_screen';
  static String cameraScreen = '/camera_screen';
 // static String enterSecureTagScreen = '/enter_secure_tag_screen';
  static String otpVerifySuccessfullyScreen = '/otp_verify_successfully_screen';
  static String statisticScreen = '/statistic_screen';



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
      name: dashBoardScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => DashBoardScreen(),
      bindings: [
        DashBoardScreenBinding(),
      ],
    ),

    GetPage(
      name: authOptionScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => AuthOptionScreen(),
      bindings: [
        AuthOptionScreenBinding(),
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
    GetPage(
      name: homeScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => HomeScreen(),
      bindings: [
        HomeScreenBinding(),
      ],
    ),

    GetPage(
      name: enterPasswordScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => EnterPasswordScreen(),
      bindings: [
        EnterPasswordScreenBinding(),
      ],
    ),

    GetPage(
      name: creatPasswordScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CreatePasswordScreen(),
      bindings: [
        CreatePasswordScreenBinding(),
      ],
    ),

    GetPage(
      name: enterLegalNameScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => EnterFirstNameDetailScreen(),
      bindings: [
        EnterLegalNameScreenBinding(),
      ],
    ),

    GetPage(
      name: enterSecureTagScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => EnterSecureTagScreen(),
      bindings: [
        EnterLegalNameScreenBinding(),
      ],
    ),

    GetPage(
      name: enterAddressScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => EnterAddressDetailScreen(),
      bindings: [
        EnterAddressScreenBinding(),
      ],
    ),

    GetPage(
      name: enterPersonalDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => EnterPersonalDetailScreen(),
      bindings: [
        EnterBirthDateBinding(),
      ],
    ),

    GetPage(
      name: enterSnnDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => EnterSNNDetailScreen(),
      bindings: [
        EnterBirthDateBinding(),
      ],
    ),

    GetPage(
      name: personalDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => PersonalDetailScreen(),
      bindings: [
        PersonalScreenBinding(),
      ],
    ),

    GetPage(
      name: purpouseAccountScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
        page: () => PurpouseAccountScreen(),
      bindings: [
        PersonalScreenBinding(),
      ],
    ),
    GetPage(
      name: onBoardingScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
        page: () => OnBoardingScreen(),
      bindings: [
        OnBoardingScreenBinding(),
      ],
    ),

    GetPage(
      name: notificationScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
        page: () => NotificationScreen(),
      bindings: [
        NotificationScreenBinding(),
      ],
    ),

    GetPage(
      name: statisticScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => StatisticScreen(),
      bindings: [
        StatisticScreenBinding(),
      ],
    ),

    GetPage(
      name: scanScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ScanScreen(),
      bindings: [
        ScanScreenBinding(),
      ],
    ),
    GetPage(
      name: scanSummaryScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ScanSummaryScreen(),
      bindings: [
        ScanScreenBinding(),
      ],
    ),

    GetPage(
      name: scanPasswordScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ScanPasswordScreen(),
      bindings: [
        ScanScreenBinding(),
      ],
    ),

  ];
}
