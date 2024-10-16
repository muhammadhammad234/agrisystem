// app_routes.dart
import 'package:agrisystem/view/auth_screen/forget_password_screen.dart';
import 'package:agrisystem/view/auth_screen/sign_in_screen.dart';
import 'package:agrisystem/view/auth_screen/sign_up_screen.dart';
import 'package:agrisystem/view/auth_screen/sync_data_screen.dart';
import 'package:agrisystem/view/home_screen/home_screen.dart';
import 'package:agrisystem/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String syncDataScreen = '/syncDataScreen';
  static const String homeScreen = '/homeScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case syncDataScreen:
        return MaterialPageRoute(builder: (_) => SyncDataScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
