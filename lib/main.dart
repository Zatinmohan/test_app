import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/routes/route_provider.dart';
import 'package:test_app/utils/color_constants.dart';
import 'package:test_app/utils/themes/elevated_button_theme.dart';
import 'package:test_app/utils/themes/snackbar_theme.dart';
import 'package:test_app/utils/themes/text_field_theme.dart';
import 'package:test_app/utils/themes/text_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Using Riverpod for our State Management
  // Wraping it with Porvider Scope is mandantory
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// We are using ConsumerWidget that is provided by Riverod
// We can use Consumer Widget inside our Build method to achieve the same results.

// Custom Theme data is added for textfields, Snackbars and other Widgets that has been used through out the app
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Test App',
      theme: ThemeData(
        textTheme: CustomTextTheme(context).textTheme,
        scaffoldBackgroundColor: ColorConstants.kPrimaryBackgroundColor,
        inputDecorationTheme: CustomTextFieldTheme(context).themeData,
        elevatedButtonTheme:
            CustomElevatedButtonTheme(context).elevatedThemeData,
        snackBarTheme: CustomSnackBarThemeData(context).snackBarThemeData,
        useMaterial3: true,
      ),
      routerConfig: route.router,
    );
  }
}
