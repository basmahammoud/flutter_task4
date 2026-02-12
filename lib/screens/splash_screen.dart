import 'package:flutter/material.dart';
import 'package:flutter_task4/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // تأخير لمدة 15 ثانية ثم الانتقال
    Future.delayed(const Duration(seconds:2), () {
      // هنا اختر الشاشة التي تريد الانتقال إليها
      // على سبيل المثال، الذهاب إلى LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
