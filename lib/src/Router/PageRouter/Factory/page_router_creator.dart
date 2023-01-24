import 'package:flutter/material.dart';

import '../../../../easy_go.dart';

abstract class PageRouterCreator {
   Route<T> create<T>(
    Widget page, {
    RouteSettings? settings,
    TransitionType? transition,
    AnimationOption? animationOptions,
  });
}
