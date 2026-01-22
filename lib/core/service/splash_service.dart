// import '../utils/session_manager/session_controller.dart';
// import 'package:flutter/material.dart';
//
// class SplashService{
//   void isLogin() {
//     try {
//       SessionController().getUserFromPreference();
//
//       if (!context.mounted) return;
//
//       if (SessionController().isLogin ?? false) {
//         context.go(AppRouteNames.homeScreen);
//       } else {
//         context.go(AppRouteNames.loginScreen);
//       }
//     } catch (e) {
//       if (!context.mounted) return;
//       context.go(AppRouteNames.loginScreen);
//     }
//   }
//
// }