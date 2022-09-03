import 'package:get/get.dart';
import '../presentation/CreatePasswordScreen/binding/create_password_screen_binding.dart';
import '../presentation/CreatePasswordScreen/create_password_screen.dart';
import '../presentation/LoginScreen/binding/login_screen_binding.dart';
import '../presentation/LoginScreen/login_screen.dart';
import '../presentation/SplashScreen/binding/splash_screen_binding.dart';
import '../presentation/SplashScreen/splash_screen.dart';


class AppRoutes {
  /// Splash Screen
  static String splashScreen = '/splash_screen';
  static String loginScreen = '/login_screen';
  static String creatPasswordScreen = '/create_password_screen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    ),

    GetPage(
      name: loginScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => LoginScreen(),
      bindings: [
        LoginScreenBinding(),
      ],
    ),

    GetPage(
      name: creatPasswordScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => CreatePasswordScreen(),
      bindings: [
        CreatePasswordScreenBinding(),
      ],
    ),
  ];
}
