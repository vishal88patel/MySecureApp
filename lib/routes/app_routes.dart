import 'package:get/get.dart';
import '../presentation/DashBoardScreen/binding/dashboard_screen_binding.dart';
import '../presentation/DashBoardScreen/dashboard_screen.dart';
import '../presentation/HomeScreen/binding/home_screen_binding.dart';
import '../presentation/HomeScreen/home_screen.dart';
import '../presentation/LoginScreen/binding/login_screen_binding.dart';
import '../presentation/LoginScreen/login_screen.dart';
import '../presentation/NotificationScreen/binding/notification_screen_binding.dart';
import '../presentation/NotificationScreen/notification_screen.dart';
import '../presentation/OnBoardingScreen/binding/onboarding_screen_binding.dart';
import '../presentation/OnBoardingScreen/onboarding_screen.dart';
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
      name: onBoardingScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => OnBoardingScreen(),
      bindings: [
        OnBoardingScreenBinding(),
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
      name: notificationScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => NotificationScreen(),
      bindings: [
        NotificationScreenBinding(),
      ],
    ),


  ];
}
