import 'package:get/get.dart';
import 'package:my_secure_app/presentation/AccoundDetailListScreen/account_detail_list_screen.dart';
import 'package:my_secure_app/presentation/AccoundDetailListScreen/binding/account_detail_list_screen_binding.dart';
import 'package:my_secure_app/presentation/BankDetailScreen/binding/bank_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/BankDetailScreen/bank_detail_screen.dart';
import 'package:my_secure_app/presentation/BankListScreen/bank_list_screen.dart';
import 'package:my_secure_app/presentation/BankListScreen/binding/bank_list_screen_binding.dart';
import 'package:my_secure_app/presentation/CardDetailListScreen/binding/card_detail_list_screen_binding.dart';
import 'package:my_secure_app/presentation/CardDetailListScreen/card_detail_list_screen.dart';
import 'package:my_secure_app/presentation/CardDetailScreen/binding/card_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/CardDetailScreen/card_detail_screen.dart';
import 'package:my_secure_app/presentation/CardListScreen/binding/card_list_screen_binding.dart';
import 'package:my_secure_app/presentation/CardListScreen/card_list_screen.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/binding/enter_personal_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/enter_personal_detail_screen.dart';
import 'package:my_secure_app/presentation/LoginEmailScreen/binding/login_email_screen_binding.dart';
import 'package:my_secure_app/presentation/LoginEmailScreen/login_email_screen.dart';
import 'package:my_secure_app/presentation/PersonalDetails/binding/personal_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/PersonalDetails/personal_detail_screen.dart';
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
  static String loginEmailScreen = '/login_email_screen';
  static String creatPasswordScreen = '/create_password_screen';
  static String enterPersonalDetailScreen = '/enter_personal_detail_screen';
  static String personalDetailScreen = '/personal_detail_screen';
  static String bankListScreen = '/bank_list_screen';
  static String cardDetailScreen = '/card_detail_screen';
  static String accountDetailListScreen = '/account__detail_list_screen';
  static String cardDetailListScreen = '/card_detail_list_screen';
  static String cardListScreen = '/card_list_screen';
  static String bankDetailScreen = '/bank_detail_screen';


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
      name: loginEmailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => LoginEmilScreen(),
      bindings: [
        LoginEmailScreenBinding(),
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

    GetPage(
      name: enterPersonalDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => EnterPersonalDetailScreen(),
      bindings: [
        EnterPersonalScreenBinding(),
      ],
    ),

    GetPage(
      name: personalDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => PersonalDetailScreen(),
      bindings: [
        PersonalScreenBinding(),
      ],
    ),

    GetPage(
      name: bankListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => BankListScreen(),
      bindings: [
        BankListScreenBinding(),
      ],
    ),

    GetPage(
      name: cardDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => CardDetailScreen(),
      bindings: [
        CardScreenBinding(),
      ],
    ),

    GetPage(
      name: accountDetailListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => AccountDetailListScreen(),
      bindings: [
        AccountDetailListScreenBinding(),
      ],
    ),

    GetPage(
      name: cardDetailListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => CardDetailListScreen(),
      bindings: [
        CardDetailListScreenBinding(),
      ],
    ),

    GetPage(
      name: cardListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => CardListScreen(),
      bindings: [
        CardListScreenBinding(),
      ],
    ),

    GetPage(
      name: bankDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => BankDetailScreen(),
      bindings: [
        BankDeetailScreenBinding(),
      ],
    ),
  ];
}
