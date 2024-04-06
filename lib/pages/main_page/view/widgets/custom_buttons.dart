part of '../file_upload_page.dart';

class CustomButtons extends StatelessWidget {
  final Color buttonColor;
  final String buttonName;
  final Color titleColor;
  final VoidCallback onTap;
  const CustomButtons({
    super.key,
    required this.buttonColor,
    required this.titleColor,
    required this.buttonName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
      onPressed: onTap,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            elevation: MaterialStateProperty.all(6.0),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              Size(
                size * 0.4,
                size * 0.14,
              ),
            ),
            maximumSize: MaterialStateProperty.all(
              Size(
                size * 0.42,
                size * 0.15,
              ),
            ),
          ),
      child: Text(
        buttonName,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: titleColor,
              fontSize: size * 0.05,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
