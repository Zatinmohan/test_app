import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/routes/clients/go_router_client.dart';
import 'package:test_app/routes/repository/route_repo.dart';

/// ********************************************************************
/// This act as a provider class that make sure that our UI and Service (Library/Client)
/// are not tightly coupled with each other.
/// Here Go_Router is not tightly coupled with the UI
/// We can change the Navigation Service whenever we want to without changing the base code
/// ********************************************************************
const String _logName = "Router Provider";

class RouterProvider<T> {
  final RouteRepo<T> _routeService;

  RouterProvider({required RouteRepo<T> repo}) : _routeService = repo {
    log("Router Provider Init", name: _logName);
    _routeService.initialRoutes();
  }

  T get router => _routeService.router;

  RouteRepo<T> get routerService => _routeService;
}

final routerProvider = Provider<RouterProvider<GoRouter>>(
  (ref) {
    return RouterProvider(
      repo: GoRouterClient(
        navigatorKey: GlobalKey<NavigatorState>(),
      ),
    );
  },
);
