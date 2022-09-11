import 'package:get/get.dart';
import 'package:my_secure_app/presentation/AccoundDetailListScreen/account_detail_list_screen.dart';
import 'package:my_secure_app/presentation/AccoundDetailListScreen/binding/account_detail_list_screen_binding.dart';
import 'package:my_secure_app/presentation/AmountNumPadScreen/binding/amount_num_pad_screen_binding.dart';
import 'package:my_secure_app/presentation/BankDetailScreen/binding/bank_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/BankDetailScreen/bank_detail_screen.dart';
import 'package:my_secure_app/presentation/BankListScreen/bank_list_screen.dart';
import 'package:my_secure_app/presentation/BankListScreen/binding/bank_list_screen_binding.dart';
import 'package:my_secure_app/presentation/BankProceedScreen/bank_proceed_screen.dart';
import 'package:my_secure_app/presentation/CardDetailListScreen/binding/card_detail_list_screen_binding.dart';
import 'package:my_secure_app/presentation/CardDetailListScreen/card_detail_list_screen.dart';
import 'package:my_secure_app/presentation/CardDetailScreen/binding/card_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/CardDetailScreen/card_detail_screen.dart';
import 'package:my_secure_app/presentation/CardListScreen/binding/card_list_screen_binding.dart';
import 'package:my_secure_app/presentation/CardListScreen/card_list_screen.dart';
import 'package:my_secure_app/presentation/DashboardScreen/binding/dashboard_screen_binding.dart';
import 'package:my_secure_app/presentation/DashboardScreen/dashboard_screen.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/binding/enter_personal_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/enter_personal_detail_screen.dart';
import 'package:my_secure_app/presentation/LoginEmailScreen/binding/login_email_screen_binding.dart';
import 'package:my_secure_app/presentation/LoginEmailScreen/login_email_screen.dart';
import 'package:my_secure_app/presentation/PersonalDetails/binding/personal_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/PersonalDetails/personal_detail_screen.dart';
import 'package:my_secure_app/presentation/PinScreen/binding/pin_screen_binding.dart';
import 'package:my_secure_app/presentation/PinScreen/pin_screen.dart';
import 'package:my_secure_app/presentation/ProgressScreen/progress_screen.dart';
import 'package:my_secure_app/presentation/SuccessScreen/binding/success_screen_binding.dart';
import 'package:my_secure_app/presentation/SuccessScreen/success_screen.dart';
import '../presentation/AmountNumPadScreen/amount_num_pad_screen.dart';
import '../presentation/ApprovedScreen/approved_screen.dart';
import '../presentation/ApprovedScreen/binding/approved_screen_binding.dart';
import '../presentation/BankProceedScreen/binding/bank_proceed_screen_binding.dart';
import '../presentation/CreatePasswordScreen/binding/create_password_screen_binding.dart';
import '../presentation/CreatePasswordScreen/create_password_screen.dart';
import '../presentation/LoginScreen/binding/login_screen_binding.dart';
import '../presentation/LoginScreen/login_screen.dart';
import '../presentation/ProgressScreen/binding/progress_screen_binding.dart';
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
  static String amountNumPadScreen = '/amount_num_pad_screen';
  static String progressScreen = '/progress_screen';
  static String successScreen = '/success_screen';
  static String pinScreen = '/pin_screen';
  static String approvedScreen = '/approved_screen';
  static String bankProceedScreen = '/bank_procees_screen';
  static String dashBoardScreen = '/dashboard_screen';


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
      name: dashBoardScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => DashBoardScreen(),
      bindings: [
        DashBoardScreenBinding(),
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

    GetPage(
      name: amountNumPadScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => AmountNumPadScreen(),
      bindings: [
        AmountNumPadScreenBinding(),
      ],
    ),

    GetPage(
      name: progressScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => ProgressScreen(),
      bindings: [
        ProgressScreenBinding(),
      ],
    ),

    GetPage(
      name: successScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => SuccessScreen(),
      bindings: [
        SuccessScreenBinding(),
      ],
    ),

    GetPage(
      name: pinScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => PinScreen(),
      bindings: [
        PinScreenBinding(),
      ],
    ),

    GetPage(
      name: approvedScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => ApprovedScreen(),
      bindings: [
        ApprovedScreenBinding(),
      ],
    ),

    GetPage(
      name: bankProceedScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      page: () => BankProceedScreen(),
      bindings: [
        BankProceedScreenBinding(),
      ],
    ),

  ];
}
