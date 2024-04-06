import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/gen/assets.gen.dart';
import 'package:test_app/pages/login_page/constants/text_field_styles.dart';
import 'package:test_app/routes/constants/routes_name.dart';
import 'package:test_app/utils/color_constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

part '../view/widgets/login_info_widget.dart';
part 'widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Assets.images.loginImageLogo.image(width: size),
            ),
            const SizedBox(height: 16.0),
            const Flexible(
              flex: 2,
              child: LoginTextFieldWidget(),
            ),
            const SizedBox(height: 24.0),
            const Expanded(
              child: LoginInfoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
