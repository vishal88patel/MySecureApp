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
import '../presentation/PersonalDetails/Purpouse_opening_account_screen.dart';
import '../presentation/PersonalDetails/binding/personal_detail_screen_binding.dart';
import '../presentation/PersonalDetails/personal_detail_screen.dart';
import '../presentation/ScanScreen/binding/scan_screen_binding.dart';
import '../presentation/ScanScreen/scan_password_screen.dart';
import '../presentation/ScanScreen/scan_screen.dart';
import '../presentation/ScanScreen/scan_summary_screen.dart';
import '../presentation/SplashScreen/binding/splash_screen_binding.dart';
import '../presentation/SplashScreen/splash_screen.dart';
import '../presentation/WebViewPage/binding/webview_binding.dart';
import '../presentation/WebViewPage/webview_screen.dart';


class AppRoutes {

  static String splashScreen = '/splash_screen';
  static String loginScreen = '/login_screen';
  static String webviewPage = '/webView_page';
  static String onBoardingScreen = '/onBoarding_screen';
  static String dashBoardScreen = '/dashboard_page';
  static String homeScreen = '/home_screen';
  static String notificationScreen = '/notification_screen';
  static String authOptionScreen = '/auth_option_screen';
  static String enterPasswordScreen = '/enter_password_screen';
  static String creatPasswordScreen = '/creat_password_screen';
  static String enterLegalNameScreen = '/enter_legal_name_screen';
  static String enterSecureTagScreen = '/enter_secureTag_screen';
  static String enterAddressScreen = '/enter_address_screen';
  static String enterPersonalDetailScreen = '/enter_personal_detail_screen';
  static String enterSnnDetailScreen = '/enter_snn_detail_screen';
  static String personalDetailScreen = '/personal_detail_screen';
  static String purpouseAccountScreen = '/purpouse_account_screen';
  static String scanScreen = '/scan_screen';
  static String scanSummaryScreen = '/scan_summary_screen';
  static String scanPasswordScreen = '/scan_password_screen';

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
      name: notificationScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => NotificationScreen(),
      bindings: [
        NotificationScreenBinding(),
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
