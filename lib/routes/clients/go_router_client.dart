import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/pages/login_page/view/login_page.dart';
import 'package:test_app/pages/main_page/view/file_upload_page.dart';
import 'package:test_app/pages/splash_page/view/pages/splash_page.dart';
import 'package:test_app/routes/constants/routes_name.dart';
import 'package:test_app/routes/repository/route_repo.dart';

/// ********************************************************************
/// Here is the basic implementation of Go_Router and can be used through our [RouterProvider]
/// By this, we can implement other clients/libraries without changing the base code.
/// ********************************************************************

const String _logName = "Go Router Client";

class GoRouterClient implements RouteRepo<GoRouter> {
  late final GoRouter _router;
  late final GlobalKey<NavigatorState> _navigatorKey;

  GoRouterClient({
    required GlobalKey<NavigatorState> navigatorKey,
  }) : _navigatorKey = navigatorKey {
    log("Go Router Client Init", name: _logName);
  }
  @override
  void initialRoutes() {
    _router = GoRouter(
      initialLocation: RoutesName.ROOT,
      routes: <RouteBase>[
        GoRoute(
          name: RoutesName.ROOT,
          path: RoutesName.ROOT,
          builder: (context, state) {
            return const SplashPage();
          },
          routes: <RouteBase>[
            GoRoute(
              name: RoutesName.LOGIN_SCREEN,
              path: RoutesName.LOGIN_SCREEN,
              builder: (context, state) {
                return const LoginPage();
              },
              routes: <RouteBase>[
                GoRoute(
                  name: RoutesName.FILE_PAGE,
                  path: RoutesName.FILE_PAGE,
                  builder: (context, state) {
                    return const FileUploadPage();
                  },
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  GlobalKey<NavigatorState> get navigationKey => _navigatorKey;

  @override
  GoRouter get router => _router;
}
