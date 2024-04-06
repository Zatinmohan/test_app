import 'package:flutter/material.dart';

abstract class RouteRepo<T> {
  void initialRoutes();
  T get router;
  GlobalKey<NavigatorState> get navigationKey;
}
