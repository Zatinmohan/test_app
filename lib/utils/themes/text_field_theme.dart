import 'package:flutter/material.dart';
import 'package:test_app/utils/color_constants.dart';

class CustomTextFieldTheme {
  // ignore: unused_field
  final BuildContext _context;
  late InputDecorationTheme _themeData;

  CustomTextFieldTheme(BuildContext context) : _context = context {
    setThemeData();
  }

  void setThemeData() {
    _themeData = InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      hintStyle: const TextStyle(
        color: ColorConstants.kPrimaryTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  InputDecorationTheme get themeData => _themeData;
}
