import 'package:bloc_clean_coding/core/utils/session_manager/session_controller.dart';
import 'package:bloc_clean_coding/feature/route/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _startNavigationTimer();
  }

  Future<void> _startNavigationTimer() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    await _navigateToHome();
  }






  Future<void> _navigateToHome() async {
    try {
      await SessionController().getUserFromPreference();

      if (!mounted) return;

      if (SessionController().isLogin ?? false) {
        context.go(AppRouteNames.homeScreen);
      } else {
        context.go(AppRouteNames.loginScreen);
      }
    } catch (e) {
      if (!mounted) return;
      context.go(AppRouteNames.loginScreen);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Splash Screen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
