import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/ForgotPasswordScreen/binding/forgot_password_screen_binding.dart';
import 'package:secure_cash_app/presentation/ForgotPasswordScreen/forgot_create_password.dart';
import 'package:secure_cash_app/presentation/ForgotPasswordScreen/forgot_otp.dart';
import 'package:secure_cash_app/presentation/ForgotPasswordScreen/forgot_password_screen.dart';
import 'package:secure_cash_app/presentation/TransferScanScreen/binding/transfer_scan_screen_binding.dart';
import 'package:secure_cash_app/presentation/TransferScanScreen/transfer_scan_screen.dart';
import 'package:secure_cash_app/presentation/TransferScreen/binding/transfer_screen_binding.dart';
import 'package:secure_cash_app/presentation/TransferScreen/transfer_screen.dart';
import 'package:secure_cash_app/presentation/TransferToUserScreen/binding/transfer_to_user_screen_binding.dart';
import 'package:secure_cash_app/presentation/TransferToUserScreen/transfer_to_user_screen.dart';
import 'package:secure_cash_app/presentation/CashoutAmountScreen/binding/cashout_amount_scareen_binding.dart';
import 'package:secure_cash_app/presentation/TopUpCardListScreen/binding/topup_card_list_screen_binding.dart';
import '../presentation/AuthOptionScreen/auth_option_screen.dart';
import '../presentation/AuthOptionScreen/binding/auth_option_screen_binding.dart';
import '../presentation/CardListScreen/binding/card_list_screen_binding.dart';
import '../presentation/CardListScreen/card_list_screen.dart';
import '../presentation/CashoutAmountScreen/cashout_amount_screen.dart';
import '../presentation/CashoutBankListScreen/binding/cashout_bank_list_screen_binding.dart';
import '../presentation/CashoutBankListScreen/cashout_bank_list_screen.dart';
import '../presentation/CashoutCardAndBankScreen/binding/cashout_card_bank_screen_binding.dart';
import '../presentation/CashoutCardAndBankScreen/cashout_card_bank_screen.dart';
import '../presentation/CashoutCardListScreen/binding/cashout_card_list_screen_binding.dart';
import '../presentation/CashoutCardListScreen/cashout_card_list_screen.dart';
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
import '../presentation/FaqScreen/binding/faq_screen_binding.dart';
import '../presentation/FaqScreen/faq_screen.dart';
import '../presentation/HistoryScreen/binding/history_screen_binding.dart';
import '../presentation/HistoryScreen/history_screen.dart';
import '../presentation/HomeScreen/binding/home_screen_binding.dart';
import '../presentation/HomeScreen/home_screen.dart';
import '../presentation/KycModuleScreen/binding/kyc_screen_binding.dart';
import '../presentation/KycModuleScreen/kyc_email_screen.dart';
import '../presentation/KycModuleScreen/kyc_otp_screen.dart';
import '../presentation/KycModuleScreen/kyc_otp_success_screen.dart';
import '../presentation/KycModuleScreen/kyc_phone_screen.dart';
import '../presentation/KycSelectStep/binding/kyc_select_step_screen_binding.dart';
import '../presentation/KycSelectStep/kyc_select_step_screen.dart';
import '../presentation/KycStep1ModuleScreen/binding/kyc__selfie_loader_screen_binding.dart';
import '../presentation/KycStep1ModuleScreen/binding/kyc_loader_screen_binding.dart';
import '../presentation/KycStep1ModuleScreen/binding/kyc_step1_screen_binding.dart';
import '../presentation/KycStep1ModuleScreen/kyc__selfie_loading_screen.dart';
import '../presentation/KycStep1ModuleScreen/kyc_loading_screen.dart';
import '../presentation/KycStep1ModuleScreen/kyc_step1_data_screen.dart';
import '../presentation/KycSuccess2Screen/binding/kyc_success2_screen_binding.dart';
import '../presentation/KycSuccess2Screen/kyc_success2_screen.dart';
import '../presentation/KycSuccessScreen/binding/kyc_success_screen_binding.dart';
import '../presentation/KycSuccessScreen/kyc_success_screen.dart';
import '../presentation/LinkCardAddCardScreen/binding/link_card_add_card_screen_binding.dart';
import '../presentation/LinkCardAddCardScreen/link_card_add_card_screen.dart';
import '../presentation/LinkCardAndBank/binding/link_card_bank_screen_binding.dart';
import '../presentation/LinkCardAndBank/link_card_bank_screen.dart';
import '../presentation/LinkCardEditCardScreen/binding/link_card_edit_card_screen_binding.dart';
import '../presentation/LinkCardEditCardScreen/link_card_edit_card_screen.dart';
import '../presentation/LinkCardLoadingScreen/binding/link_card_loading_screen_binding.dart';
import '../presentation/LinkCardLoadingScreen/link_card_loading_screen.dart';
import '../presentation/LinkCardSuccessScreen/binding/link_card_success_screen_binding.dart';
import '../presentation/LinkCardSuccessScreen/link_card_success_screen.dart';
import '../presentation/LoanApprovedScreen/binding/loan_approved_screen_binding.dart';
import '../presentation/LoanApprovedScreen/loan_approved_screen.dart';
import '../presentation/LoanStepScreen/binding/loan_step_screen_binding.dart';
import '../presentation/LoanStepScreen/loan_step_screen.dart';
import '../presentation/LoginScreen/binding/login_screen_binding.dart';
import '../presentation/LoginScreen/login_screen.dart';
import '../presentation/MyBankAccountListScreen/binding/my_bank_account_list_screen_binding.dart';
import '../presentation/MyBankAccountListScreen/my_bank_account_list_screen.dart';
import '../presentation/MyLinkedBankListScreen/binding/my_linked_bank_list_screen_binding.dart';
import '../presentation/MyLinkedBankListScreen/my_linked_bank_list_screen.dart';
import '../presentation/NotificationScreen/binding/notification_screen_binding.dart';
import '../presentation/NotificationScreen/notification_screen.dart';
import '../presentation/OnBoardingScreen/onBoarding_screen.dart';
import '../presentation/PersonalDetails/Purpouse_opening_account_screen.dart';
import '../presentation/PersonalDetails/binding/personal_detail_screen_binding.dart';
import '../presentation/PersonalDetails/personal_detail_screen.dart';
import '../presentation/QrCodeScreen/binding/qrCode_screen_binding.dart';
import '../presentation/QrCodeScreen/qrCode_screen.dart';
import '../presentation/ScanScreen/binding/scan_screen_binding.dart';
import '../presentation/ScanScreen/scan_password_screen.dart';
import '../presentation/ScanScreen/scan_screen.dart';
import '../presentation/ScanScreen/scan_summary_screen.dart';
import '../presentation/OnBoardingScreen/binding/onboarding_screen_binding.dart';
import '../presentation/SelectLoanTypeScreen/binding/select_loan_type_screen_binding.dart';
import '../presentation/SelectLoanTypeScreen/controller/select_loan_type_screen_controller.dart';
import '../presentation/LoanCalculator/select_loan_type_screen.dart';
import '../presentation/SplashScreen/binding/splash_screen_binding.dart';
import '../presentation/SplashScreen/splash_screen.dart';
import '../presentation/SupportScreen/binding/support_screen_binding.dart';
import '../presentation/SupportScreen/support_screen.dart';
import '../presentation/TopMyCardScreen/binding/top_my_card_screen_binding.dart';
import '../presentation/TopMyCardScreen/top_my_card_screen.dart';
import '../presentation/TopUpCardListScreen/topup_card_list_screen.dart';
import '../presentation/TopupBankListScreen/binding/topup_bank_list_screen_binding.dart';
import '../presentation/TopupBankListScreen/topup_bank_list_screen.dart';
import '../presentation/WebViewPage/binding/webview_binding.dart';
import '../presentation/WebViewPage/webview_screen.dart';
import '../presentation/statistic/binding/statistic_screen_binding.dart';
import '../presentation/LoanCalculator/binding/loan_calculator_screen_binding.dart';
import '../presentation/statistic/statistic.dart';
import '../presentation/LoanCalculator/loan_fname_screen.dart';
import '../presentation/LoanCalculator/loan_lname_screen.dart';
import '../presentation/LoanCalculator/loan_dob_screen.dart';
import '../presentation/LoanCalculator/loan_email_screen.dart';
import '../presentation/LoanCalculator/loan_ssn_screen.dart';
import '../presentation/LoanCalculator/loan_address_screen.dart';
import '../presentation/LoanCalculator/apply_loaninfo_screen.dart';
import '../presentation/topAddCardConfirm/binding/top_add_card_confirm_screen_binding.dart';
import '../presentation/topAddCardConfirm/top_add_card_confirm_screen.dart';
import '../presentation/topAddCardFill/binding/top_add_card_fill_screen_binding.dart';
import '../presentation/topAddCardFill/top_add_card_fill_screen.dart';
import '../presentation/topSelectionMode/binding/top_selection_mode_screen_binding.dart';
import '../presentation/topSelectionMode/top_selection_mode_screen.dart';
import '../presentation/topWithCreditCard/binding/top_with_credit_card_binding.dart';
import '../presentation/topWithCreditCard/top_with_credit_card_screen.dart';
import '../presentation/topYourCreditCard/binding/top_add_card_fill_screen_binding.dart';
import '../presentation/topYourCreditCard/top_your_credit_card_screen.dart';





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
  static String accountDetailListScreen = '/account__detail_list_screen';
  static String cardDetailListScreen = '/card_detail_list_screen';
  static String cardListScreen = '/card_list_screen';
  static String cashoutCardBankScreen = '/cashout_card_bank_screen';
  static String cashoutCardListScreen = '/cashout_card_list_screen';
  static String cashoutBankListScreen = '/cashout_bank_list_screen';
  static String cashoutAmountScreen = '/cashout_amount_screen';
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
  static String historyScreen = '/history_screen';
  static String loanCalculatorScreen = '/loan_calculator_screen';
  static String loanInfoScreen = '/loan_info_screen';
  static String loanFnameScreen = '/loan_fname_screen';
  static String loanLnameScreen = '/loan_lname_screen';
  static String loanEmailScreen = '/loan_email_screen';
  static String loanDobScreen = '/loan_dob_screen';
  static String loanSsnScreen = '/loan_ssn_screen';
  static String loanAddressScreen = '/loan_address_screen';
  static String selectLoanTypeScreen = '/select_loan_type_screen';
  static String loanApplyInfoScreen = '/loan_apply_info_screen';
  static String linkCardBankScreen = '/link_card_bank_screen';


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
  static String enterSecureTagScreen = '/enter_secureTag_screen';
  static String enterSnnDetailScreen = '/enter_snn_detail_screen';
  static String purpouseAccountScreen = '/purpouse_account_screen';
  static String scanScreen = '/scan_screen';
  static String scanSummaryScreen = '/scan_summary_screen';
  static String scanPasswordScreen = '/scan_password_screen';
  static String collectDetailScreen = '/collect_detail_screen';
  static String qrCodeScreen = '/qr_code_screen';
  static String loan_approved = '/loan_approved_screen';
  static String kvcPhoneNumber = '/kvc_phone_number';
  static String kycEmail = '/kvc_email';
  static String kvcOtpNumber = '/kvc_otp_number';
  static String kycInfoScreen = '/kyc_info_screen';
  static String cameraScreen = '/camera_screen';
  static String otpVerifySuccessfullyScreen = '/otp_verify_successfully_screen';
  static String statisticScreen = '/statistic_screen';
  static String topSelectionModeScreen = '/top_selection_mode_screen';
  static String topupCardListScreen = '/top_up_card_list_screen';
  static String topupBankListScreen = '/top_up_bank_list_screen';
  static String topMyCardScreen = '/top_my_card_screen';
  static String topAddCard1Screen = '/top_add_card1_screen';

  static String topAddCardFillScreen = '/top_add_card_fill_screen';
  static String topYourCreditCardScreen = '/top_your_credit_card_screen';
  static String topWithCreditCardScreen = '/top_with_credit_card_screen';
  static String topAddCardConfirmScreen = '/top_add_card_confirm_screen';

  static String scanSuccessScreen = '/scan_success_screen';
  static String transferScreen = '/transfer_screen';
  static String transferScanScreen = '/transfer_scan_screen';
  static String transferToUserScreen = '/transfer_to_user_screen';
  static String forgotPasswordScreen = '/forgot_password_screen';
  static String forgotCreatePasswordScreen = '/forgot_create_password_screen';
  static String forgotOtpScreen = '/forgot_otp_screen';

  static String linkCardAddCardScreen = '/link_card_add_card_screen';
  static String linkCardLoadingScreen = '/link_card_loading_screen';
  static String linkCardEditCardScreen = '/link_card_edit_card_screen';
  static String linkCardSuccessScreen = '/link_card_success_screen';


  static String kycEmailScreen = '/kyc_email_screen';
  static String kycPhoneScreen = '/kyc_phone_screen';
  static String kycOtpScreen = '/kyc_otp_screen';
  static String kycOtpSuccessScreen = '/kyc_otp_success_screen';
  static String kycStep1DataScreen = '/kyc_step1_data_screen';
  static String kycLoadingScreen = '/kyc_loading_screen';
  static String kycselfieLoadingScreen = '/kyc_selfie_loading_screen';
  static String kycSelectStepScreen = '/kyc_select_step_screen';
  static String kycSuccessScreen = '/kyc_success_screen';
  static String kycSuccess2Screen = '/kyc_success2_screen';

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
      name: historyScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => HistoryScreen(),
      bindings: [
        HistoryScreenBinding(),
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
      name: qrCodeScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => QrCodeScreen(),
      bindings: [
        QrCodeScreenBinding(),
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
      name: loanStepScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanStepScreen(),
      bindings: [
        LoanStepScreenBinding(),
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

    GetPage(
      name: kycEmailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KycEmailScreen(),
      bindings: [
        KycScreenBinding(),
      ],
    ),

    GetPage(
      name: kycPhoneScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KycPhoneScreen(),
      bindings: [
        KycScreenBinding(),
      ],
    ),

    GetPage(
      name: kycOtpScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KycOtpScreen(),
      bindings: [
        KycScreenBinding(),
      ],
    ),

    GetPage(
      name: kycOtpSuccessScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KycOtpSuccessScreen(),
      bindings: [
        KycScreenBinding(),
      ],
    ),

    GetPage(
      name: kycStep1DataScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KycStep1Screen(),
      bindings: [
        KycStep1ScreenBinding(),
      ],
    ),

    GetPage(
      name: kycLoadingScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KYCLoadingScreen(),
      bindings: [
        KycLoaderScreenBinding(),
      ],
    ),

    GetPage(
      name: kycselfieLoadingScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KYCSelfieLoadingScreen(),
      bindings: [
        KycSelfieLoaderScreenBinding(),
      ],
    ),

    GetPage(
      name: kycSelectStepScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KycSelectStepScreen(),
      bindings: [
        KycSelectStepBinding(),
      ],
    ),

    GetPage(
      name: kycSuccessScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KycSuccessScreen(),
      bindings: [
        KycSuccessScreenBinding(),
      ],
    ),

    GetPage(
      name: kycSuccess2Screen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => KycSuccess2Screen(),
      bindings: [
        KycSuccess2ScreenBinding(),
      ],
    ),

    GetPage(
      name: topSelectionModeScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TopSelectionModeScreen(),
      bindings: [
        TopSelectionModeBinding(),
      ],
    ),

    GetPage(
      name: topupCardListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TopupCardListScreen(),
      bindings: [
        TopupCardListScreenBinding(),
      ],
    ),

    GetPage(
      name: topupBankListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TopupBankListScreen(),
      bindings: [
        TopupBankListScreenBinding(),
      ],
    ),

    GetPage(
      name: topMyCardScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TopMyCardScreen(),
      bindings: [
        TopMyCardScreenBinding(),
      ],
    ),

    GetPage(
      name: linkCardAddCardScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LinkCardAddCardScreen(),
      bindings: [
        LinkCardAddCardBinding(),
      ],
    ),

    GetPage(
      name: linkCardLoadingScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LinkCardLoadingScreen(),
      bindings: [
        LinkCardLoadingScreenBinding(),
      ],
    ),

    GetPage(
      name: linkCardEditCardScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LinkCardEditCardScreen(),
      bindings: [
        LinkCardEditCardBinding(),
      ],
    ),

    /*GetPage(
      name: cardLoaderScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CardLoadingScreen(),
      bindings: [
        CardLoaderScreenBinding(),
      ],
    ),*/

    GetPage(
      name: topAddCardFillScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TopAddCardFillScreen(),
      bindings: [
        TopAddCardFillBinding(),
      ],
    ),

    GetPage(
      name: topYourCreditCardScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TopYourCreditCardScreen(),
      bindings: [
        TopYourCreditCardBinding(),
      ],
    ),

    GetPage(
      name: topWithCreditCardScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TopWithCreditCardScreen(),
      bindings: [
        TTopWithCreditCardBinding(),
      ],
    ),

    GetPage(
      name: topAddCardConfirmScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TopAddCardConfirmScreen(),
      bindings: [
        TopAddCardConfirmBinding(),
      ],
    ),

    GetPage(
      name: loanFnameScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanFnameScreen(),
      bindings: [
        LoanCalculatorScreenBinding(),
      ],
    ),

    GetPage(
      name: loanLnameScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanLnameScreen(),
      bindings: [
        LoanCalculatorScreenBinding(),
      ],
    ),

    GetPage(
      name: loanEmailScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanEmailScreen(),
      bindings: [
        LoanCalculatorScreenBinding(),
      ],
    ),

    GetPage(
      name: loanDobScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanDobScreen(),
      bindings: [
        LoanCalculatorScreenBinding(),
      ],
    ),

    GetPage(
      name: loanSsnScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanSsnScreen(),
      bindings: [
        LoanCalculatorScreenBinding(),
      ],
    ),

    GetPage(
      name: loanAddressScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LoanAddressScreen(),
      bindings: [
        LoanCalculatorScreenBinding(),
      ],
    ),
 // GetPage(
 //      name: selectLoanTypeScreen,
 //      transition: Transition.rightToLeft,
 //      transitionDuration: Duration(milliseconds: 400),
 //      page: () => SelectLoanTypeScreen(),
 //      bindings: [
 //        SelectLoanTypeScreenBinding(),
 //      ],
 //    ),

    GetPage(
      name: loanApplyInfoScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ApplyLoanInfoScreen(),
      bindings: [
        LoanCalculatorScreenBinding(),
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

    GetPage(
      name: linkCardSuccessScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LinkCardSuccessScreen(),
      bindings: [
        LinkCardSuccessScreenBinding(),
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
      name: cardListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CardListScreen(),
      bindings: [
        CardListScreenBinding(),
      ],
    ),

    GetPage(
      name: cashoutCardBankScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CashoutCardBankScreen(),
      bindings: [
        CashoutCardBankBinding(),
      ],
    ),

    GetPage(
      name: cashoutCardListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CashoutCardListScreen(),
      bindings: [
        CashoutCardListScreenBinding(),
      ],
    ),

    GetPage(
      name: cashoutBankListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CashoutBankListScreen(),
      bindings: [
        CashoutBankListScreenBinding(),
      ],
    ),

    GetPage(
      name: cashoutAmountScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => CashoutAmountScreen(),
      bindings: [
        CashoutAmountBinding(),
      ],
    ),

    GetPage(
      name: linkCardBankScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => LinkCardBankScreen(),
      bindings: [
        LinkCardBankBinding(),
      ],
    ),

    GetPage(
      name: myBankAccountListScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => MyBankAccountListScreen(),
      bindings: [
        MyBankAccountListScreenBinding(),
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
      name: faqScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => FaqScreen(),
      bindings: [
        FaqScreenBinding(),
      ],
    ),

    GetPage(
      name: transferScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TransferScreen(),
      bindings: [
        TransferScreenBinding(),
      ],
    ),

    GetPage(
      name: transferScanScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TransferScanScreen(),
      bindings: [
        TransferScanScreenBinding(),
      ],
    ),

    GetPage(
      name: transferToUserScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => TransferToUserScreen(),
      bindings: [
        TransferToUserScreenBinding(),
      ],
    ),

    GetPage(
      name: forgotPasswordScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordScreenBinding(),
      ],
    ),

    GetPage(
      name: forgotOtpScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ForgotOtpScreen(),
      bindings: [
        ForgotPasswordScreenBinding(),
      ],
    ),

    GetPage(
      name: forgotCreatePasswordScreen,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
      page: () => ForgotCreatePasswordScreen(),
      bindings: [
        ForgotPasswordScreenBinding(),
      ],
    ),

  ];
}
