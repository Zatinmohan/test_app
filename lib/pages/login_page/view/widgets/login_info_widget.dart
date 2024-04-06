part of '../login_page.dart';

class LoginInfoWidget extends StatelessWidget {
  const LoginInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    final fontSize = size * 0.04;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "For Assistance & Login Details Contact: ",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: fontSize,
              ),
        ),
        const SizedBox(height: 4.0),
        CustomTextStyle(
          fontSize: fontSize,
          titleText: "English, Kannada & Telugu: ",
          phoneNumber: "7406333800",
        ),
        const SizedBox(height: 4.0),
        CustomTextStyle(
          fontSize: fontSize,
          titleText: "English, Kannada & Hindi: ",
          phoneNumber: "7406333800",
        ),
        const Spacer(),
        Container(
          width: size,
          alignment: Alignment.bottomCenter,
          child: Text(
            "v1.7 © 2023, Codeland Infosolutions Pvt Ltd.",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: size * 0.038,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  final double fontSize;
  final String titleText;
  final String phoneNumber;
  const CustomTextStyle({
    super.key,
    required this.fontSize,
    required this.titleText,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: titleText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: fontSize,
                  )),
          TextSpan(
              text: phoneNumber,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorConstants.kPrimaryColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorConstants.kPrimaryColor,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final String url = "tel:+91$phoneNumber";
                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url);
                  }
                }),
        ],
      ),
    );
  }
}
