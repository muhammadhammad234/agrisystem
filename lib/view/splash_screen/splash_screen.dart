import 'package:agrisystem/helper/shared_preferences_helper.dart';
import 'package:agrisystem/utils/app_images.dart';
import 'package:agrisystem/utils/app_routes.dart';
import 'package:agrisystem/utils/size_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  getLogin() async {
    isLogin = await SharedPreferencesHelper().getLoginStatus();
  }

  @override
  void initState() {
    getLogin();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(
          context,isLogin ? AppRoutes.homeScreen : AppRoutes.signInScreen, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.logo,
          height: getHeight(context) * .2,
          width: getWidth(context) * .8,
        ),
      ),
    );
  }
}
