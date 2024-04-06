import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/gen/assets.gen.dart';
import 'package:test_app/routes/constants/routes_name.dart';
import 'package:test_app/utils/color_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _pushToNextScreen();
      },
    );
    super.initState();
  }

  void _pushToNextScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        context.pushReplacementNamed(RoutesName.LOGIN_SCREEN);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorConstants.kPrimaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Assets.images.logo.image(width: size * 0.7),
      ),
    );
  }
}
