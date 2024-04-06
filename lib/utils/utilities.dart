import 'package:flutter/material.dart';

/// ********************************************************************
/// Used for performing common tasks such as show snackbars, Converting date time,
/// format strings, reduce boilerplates
/// ********************************************************************

class Utilities {
  static void showSnackbar({
    String? message,
    required BuildContext context,
    int? durationInMillSecconds,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message ?? ""),
      duration: Duration(milliseconds: durationInMillSecconds ?? 4000),
    ));
  }
}
