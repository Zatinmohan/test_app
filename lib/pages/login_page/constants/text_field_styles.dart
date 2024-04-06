import 'package:flutter/material.dart';

/// ********************************************************************
/// Text Field Styles that are used on Password and Username Styling
/// ********************************************************************
class TextFieldStyles {
  static TextStyle getlabelTextStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: MediaQuery.sizeOf(context).width * 0.04,
    );
  }

  static OutlineInputBorder enabledTextFieldBorderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(width: 0.8),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  static OutlineInputBorder selectedTextFieldBorderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(width: 0.8),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  static TextStyle geterrorTextStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: MediaQuery.sizeOf(context).width * 0.03,
    );
  }
}
