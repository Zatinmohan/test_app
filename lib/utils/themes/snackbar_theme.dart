import 'package:flutter/material.dart';

class CustomSnackBarThemeData {
  final BuildContext _context;
  late final SnackBarThemeData _snackBarThemeData;

  CustomSnackBarThemeData(BuildContext context) : _context = context {
    _setThemeData();
  }

  SnackBarThemeData get snackBarThemeData => _snackBarThemeData;

  void _setThemeData() {
    _snackBarThemeData = SnackBarThemeData(
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.sizeOf(_context).width * 0.035,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
      elevation: 0.0,
    );
  }
}
