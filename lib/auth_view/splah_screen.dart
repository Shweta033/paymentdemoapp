import 'package:flutter/material.dart';
import 'package:paymentdemoapp/auth_view/login_screen.dart';
import 'package:paymentdemoapp/utills/colors_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Image.asset("assets/images/Splashimg.png", fit: BoxFit.fill),
    );
  }
}
