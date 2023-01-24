import 'package:flutter/material.dart';
import '../../../../named_routes.dart';

mixin NamedRouterInjector {
  NamedRoutes routerName(RouteSettings settings) {
    return NamedRoutes.values.firstWhere((e) => e.routeName == settings.name);
  }
}
abstract class GoGenerator with NamedRouterInjector {

  Route<dynamic> goRoutes (RouteSettings settings);

  Route<dynamic> undefineRoute();
}



