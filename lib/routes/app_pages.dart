import 'package:get/get.dart';
import 'package:paymentdemoapp/auth_view/login_screen.dart';
import '../auth_view/createaccount_screen.dart';
import '../auth_view/otp_screen.dart';
import '../auth_view/password_screen.dart';
import '../auth_view/splah_screen.dart';
import '../dashboard_view/dashboard_screen.dart';
import '../dashboard_view/history_screen.dart';
import 'app_rotes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.passwordScreen, page: () => const PasswordScreen()),
    GetPage(name: AppRoutes.signupView, page: () => const SignupView()),
    GetPage(name: AppRoutes.dashboardView, page: () => const DashboardView()),
    GetPage(name: AppRoutes.historyView, page: () => const HistoryView()),
    GetPage(
      name: AppRoutes.otpVerifyScreen,
      page: () => const OtpVerifyScreen(mode: "null", email: ''),
    ),
  ];
}
