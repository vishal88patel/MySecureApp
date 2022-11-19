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
import 'package:my_secure_app/presentation/CardProfileDetailScreen/binding/card_profile_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/CardProfileDetailScreen/card_profile_detail_screen.dart';
import 'package:my_secure_app/presentation/CollectDetailScreen/binding/collect_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/CollectDetailScreen/collect_detail_screen.dart';
import 'package:my_secure_app/presentation/DashboardScreen/binding/dashboard_screen_binding.dart';
import 'package:my_secure_app/presentation/DashboardScreen/dashboard_screen.dart';
import 'package:my_secure_app/presentation/EnterAddress/enter_address_screen.dart';
import 'package:my_secure_app/presentation/EnterLegalNameDetails/enter_legel_name_screen.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/binding/enter_personal_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/controller/enter_personal_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/enter_personal_detail_screen.dart';
import 'package:my_secure_app/presentation/EnterPersonalDetails/ssn_details.dart';
import 'package:my_secure_app/presentation/ForgetPassScreen/binding/forget_pass_screen_binding.dart';
import 'package:my_secure_app/presentation/ForgetPassScreen/forget_pass_screen.dart';
import 'package:my_secure_app/presentation/LoanApprovedScreen/loan_approved_screen.dart';
import 'package:my_secure_app/presentation/LoanCalculator/binding/loan_calculator_screen_binding.dart';
import 'package:my_secure_app/presentation/FaqScreen/binding/faq_screen_binding.dart';
import 'package:my_secure_app/presentation/FaqScreen/faq_screen.dart';
import 'package:my_secure_app/presentation/LinkBankListScreen/binding/link_bank_list_screen_binding.dart';
import 'package:my_secure_app/presentation/LinkBankListScreen/link_bank_list_screen.dart';
import 'package:my_secure_app/presentation/LoanStepScreen/binding/loan_step_screen_binding.dart';
import 'package:my_secure_app/presentation/LoanStepScreen/loan_step_screen.dart';
import 'package:my_secure_app/presentation/LoginEmailScreen/binding/login_email_screen_binding.dart';
import 'package:my_secure_app/presentation/LoginEmailScreen/login_email_screen.dart';
import 'package:my_secure_app/presentation/MoreHelpScreen/binding/more_help_screen_binding.dart';
import 'package:my_secure_app/presentation/MoreHelpScreen/more_help_screen.dart';
import 'package:my_secure_app/presentation/PersonalDetails/Purpouse_opening_account_screen.dart';
import 'package:my_secure_app/presentation/PersonalDetails/binding/personal_detail_screen_binding.dart';
import 'package:my_secure_app/presentation/PersonalDetails/personal_detail_screen.dart';
import 'package:my_secure_app/presentation/PinScreen/binding/pin_screen_binding.dart';
import 'package:my_secure_app/presentation/PinScreen/pin_screen.dart';
import 'package:my_secure_app/presentation/ProgressScreen/progress_screen.dart';
import 'package:my_secure_app/presentation/QrCodeScreen/qrCode_screen.dart';
import 'package:my_secure_app/presentation/SuccessScreen/binding/success_screen_binding.dart';
import 'package:my_secure_app/presentation/SuccessScreen/success_screen.dart';
import '../presentation/AddBankProceedScreen/add_bank_proceed_screen.dart';
import '../presentation/AddBankProceedScreen/binding/add_bank_proceed_screen_binding.dart';
import '../presentation/AmountNumPadScreen/amount_num_pad_screen.dart';
import '../presentation/ApprovedScreen/approved_screen.dart';
import '../presentation/ApprovedScreen/binding/approved_screen_binding.dart';
import '../presentation/BankProceedScreen/binding/bank_proceed_screen_binding.dart';
import 'package:my_secure_app/presentation/PrivacyPolicyScreen/binding/privacy_policy_screen_binding.dart';
import 'package:my_secure_app/presentation/PrivacyPolicyScreen/privacy_policy_screen.dart';
import 'package:my_secure_app/presentation/ProfileScreen/binding/profile_screen_binding.dart';
import 'package:my_secure_app/presentation/ProfileScreen/profile_screen.dart';
import 'package:my_secure_app/presentation/SupportScreen/binding/support_screen_binding.dart';
import 'package:my_secure_app/presentation/SupportScreen/support_screen.dart';
import 'package:my_secure_app/presentation/TransactionScreen/binding/transaction_screen_binding.dart';
import 'package:my_secure_app/presentation/TransactionScreen/transaction_screen.dart';
import 'package:my_secure_app/presentation/UploadDocumentScreen/binding/uplod_document_screen_binding.dart';
import 'package:my_secure_app/presentation/UploadDocumentScreen/uplod_document_screen.dart';
import 'package:my_secure_app/presentation/UserPersonalScreen/binding/user_personal_screen_binding.dart';
import 'package:my_secure_app/presentation/UserPersonalScreen/user_personal_screen.dart';
import '../presentation/CreatePasswordScreen/binding/create_password_screen_binding.dart';
import '../presentation/CreatePasswordScreen/create_password_screen.dart';
import '../presentation/EnterAddress/binding/enter_address_screen_binding.dart';
import '../presentation/EnterLegalNameDetails/binding/enter_legel_name_screen_binding.dart';
import '../presentation/EnterLegalNameDetails/enter_first_name_screen.dart';
import '../presentation/EnterPasswordScreen/binding/enter_password_screen_binding.dart';
import '../presentation/EnterPasswordScreen/enter_password_screen.dart';
import '../presentation/HomeScreen/binding/home_screen_binding.dart';
import '../presentation/HomeScreen/home_screen.dart';
import '../presentation/LoanApprovedScreen/binding/loan_approved_screen_binding.dart';
import '../presentation/LoanCalculator/loan_calculator_screen.dart';
import '../presentation/LoginScreen/binding/login_screen_binding.dart';
import '../presentation/LoginScreen/login_screen.dart';
import '../presentation/MyLinkedBankListScreen/binding/my_linked_bank_list_screen_binding.dart';
import '../presentation/MyLinkedBankListScreen/my_linked_bank_list_screen.dart';
import '../presentation/NotificationScreen/binding/notification_screen_binding.dart';
import '../presentation/NotificationScreen/notification_screen.dart';
import '../presentation/ProgressScreen/binding/progress_screen_binding.dart';
import '../presentation/QrCodeScreen/binding/qrCode_screen_binding.dart';
import '../presentation/SplashScreen/binding/splash_screen_binding.dart';
import '../presentation/SplashScreen/splash_screen.dart';
import '../presentation/UploadDocumentScreen/uplod_document_screen1.dart';
import '../presentation/UploadDocumentScreen/uplod_document_screen2.dart';
import '../presentation/WebViewPage/binding/webview_binding.dart';
import '../presentation/WebViewPage/webview_screen.dart';
import '../test_card.dart';


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
  static String addBankProceedScreen = '/add_bank_procees_screen';
  static String dashBoardScreen = '/dashboard_screen';
  static String loanCalculatorScreen = '/loan_calculator_screen';

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
      name: loginEmailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoginEmilScreen(),
      bindings: [
        LoginEmailScreenBinding(),
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
      name: enterPasswordScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => EnterPasswordScreen(),
      bindings: [
        EnterPasswordScreenBinding(),
      ],
    ),

    GetPage(
      name: forgetPassScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ForgetPassScreen(),
      bindings: [
        ForgetPassScreenBinding(),
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
      name: dashBoardScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => DashBoardScreen(),
      bindings: [
        DashBoardScreenBinding(),
      ],
    ),

    GetPage(
      name: bankListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => BankListScreen(),
      bindings: [
        BankListScreenBinding(),
      ],
    ),
    GetPage(
      name: myLinkedBankListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => MyLinkedBankListScreen(),
      bindings: [
        MyLinkedBankListScreenBinding(),
      ],
    ),

    GetPage(
      name: cardDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CardDetailScreen(),
      bindings: [
        CardScreenBinding(),
      ],
    ),

    GetPage(
      name: accountDetailListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => AccountDetailListScreen(),
      bindings: [
        AccountDetailListScreenBinding(),
      ],
    ),

    GetPage(
      name: cardDetailListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CardDetailListScreen(),
      bindings: [
        CardDetailListScreenBinding(),
      ],
    ),

    GetPage(
      name: cardListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CardListScreen(),
      bindings: [
        CardListScreenBinding(),
      ],
    ),

    GetPage(
      name: bankDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => BankDetailScreen(),
      bindings: [
        BankDeetailScreenBinding(),
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
      name: linkBankListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LinkBankListScreen(),
      bindings: [
        LinkBankListScreenBinding(),
      ],
    ),

    GetPage(
      name: profileScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ProfileScreen(),
      bindings: [
        ProfileScreenBinding(),
      ],
    ),

    GetPage(
      name: userPersonalScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => UserPersonalScreen(),
      bindings: [
        UserPersonalScreenBinding(),
      ],
    ),
    GetPage(
      name: privacyPolicyScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => PrivacyPolicyScreen(),
      bindings: [
        PrivacyPolicyScreenBinding(),
      ],
    ),

    GetPage(
      name: supportScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => SupportScreen(),
      bindings: [
        SupportScreenBinding(),
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
      name: faqScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => FaqScreen(),
      bindings: [
        FaqScreenBinding(),
      ],
    ),

    GetPage(
      name: moreHelpScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => MoreHelpScreen(),
      bindings: [
        MoreHelpScreenBinding(),
      ],
    ),

    GetPage(
      name: loanStepScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanStepScreen(),
      bindings: [
        LoanStepScreenBinding(),
      ],
    ),

    GetPage(
      name: cardProfileDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CardProfileDetailScreen(),
      bindings: [
        CardProfileDetailScreenBinding(),
      ],
    ),

    GetPage(
      name: transactionScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TransactionScreen(),
      bindings: [
        TransactionScreenBinding(),
      ],
    ),

    GetPage(
      name: uploadDocument1,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => UploadDocumentScreen1(),
      bindings: [
        UploadDocumentScreenBinding(),
      ],
    ),

    GetPage(
      name: uploadDocument2,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => UploadDocumentScreen2(),
      bindings: [
        UploadDocumentScreenBinding(),
      ],
    ),

    GetPage(
      name: amountNumPadScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => AmountNumPadScreen(),
      bindings: [
        AmountNumPadScreenBinding(),
      ],
    ),

    GetPage(
      name: progressScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ProgressScreen(),
      bindings: [
        ProgressScreenBinding(),
      ],
    ),

    GetPage(
      name: successScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => SuccessScreen(),
      bindings: [
        SuccessScreenBinding(),
      ],
    ),

    GetPage(
      name: pinScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => PinScreen(),
      bindings: [
        PinScreenBinding(),
      ],
    ),

    GetPage(
      name: approvedScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ApprovedScreen(),
      bindings: [
        ApprovedScreenBinding(),
      ],
    ),

    GetPage(
      name: addBankProceedScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => AddBankProceedScreen(),
      bindings: [
        AddBankProceedScreenBinding(),
      ],
    ),

    GetPage(
      name: bankProceedScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => BankProceedScreen(),
      bindings: [
        BankProceedScreenBinding(),
      ],
    ),

    GetPage(
      name: loanCalculatorScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanCalculatorScreen(),
      bindings: [
        LoanCalculatorScreenBinding(),
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
      name: collectDetailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CollectDetailScreen(),
      bindings: [
        CollectDetailScreenBinding(),
      ],
    ),

    GetPage(
      name: qrCodeScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => QrCodeScreen(),
      bindings: [
        QrCodeScreenBinding(),
      ],
    ),
    GetPage(
      name: loan_approved,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanApprovedScreen(),
      bindings: [
        LoanApprovedScreenBinding(),
      ],
    ),

  ];
}
