import 'package:get/get.dart';
import 'package:paymentdemoapp/auth_view/login_screen.dart';
import '../auth_view/password_screen.dart';
import 'app_rotes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.passwordScreen, page: () => const PasswordScreen()),
  ];
}
