import 'package:get/get.dart';
import 'package:paymentdemoapp/auth_view/login_screen.dart';
import '../auth_view/createaccount_screen.dart';
import '../auth_view/otp_screen.dart';
import '../auth_view/password_screen.dart';
import '../auth_view/splah_screen.dart';
import '../dashboard_view/cards/addcard_screen.dart';
import '../dashboard_view/cards/cards_screen.dart';
import '../dashboard_view/cards/codesubmit_screen.dart';
import '../dashboard_view/cards/paymentcancel_screen.dart';
import '../dashboard_view/cards/paymentcode_screen.dart';
import '../dashboard_view/cards/paymentdone_screen.dart';
import '../dashboard_view/cards/paymentto_screen.dart';
import '../dashboard_view/dashboard_screen.dart';
import '../dashboard_view/history_screen.dart';
import '../dashboard_view/home_screen.dart';
import '../dashboard_view/moreModule/more_screen.dart';
import '../dashboard_view/cards/paybills_screen.dart';
import 'app_rotes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.passwordScreen, page: () => const PasswordScreen()),
    GetPage(name: AppRoutes.signupView, page: () => const SignupView()),
    GetPage(name: AppRoutes.dashboardView, page: () => const DashboardView()),
    GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.historyView, page: () => const HistoryView()),
    GetPage(name: AppRoutes.cardsScreen, page: () => const CardsScreen()),
    GetPage(name: AppRoutes.addCardScreen, page: () => const AddCardScreen()),
    GetPage(name: AppRoutes.moreScreen, page: () => const MoreScreen()),
    GetPage(name: AppRoutes.paymentToView, page: () => const PaymentToView()),
    GetPage(name: AppRoutes.codeSubmitView, page: () => const CodeSubmitView()),
    GetPage(name: AppRoutes.paymentCodeView, page: () => const PaymentCodeView()),
    GetPage(name: AppRoutes.paymentCancelView, page: () => const PaymentCancelView()),
    GetPage(
      name: AppRoutes.paymentDoneView,
      page: () =>
          const PaymentDoneView(billerName: '', amount: '', transactionNo: ''),
    ),
    GetPage(name: AppRoutes.payBillsScreen, page: () => const PayBillsScreen()),
    GetPage(
      name: AppRoutes.otpVerifyScreen,
      page: () => const OtpVerifyScreen(mode: "null", email: ''),
    ),
  ];
}
