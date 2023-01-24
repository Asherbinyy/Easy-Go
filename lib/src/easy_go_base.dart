
import 'package:flutter/cupertino.dart';

import '../easy_go.dart';
import '../named_routes.dart';


class Go {
  Go._();
//<editor-fold desc="default">
  static final GlobalKey<NavigatorState> _navigatorKey =
  GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  static final GoBuilder _pageRouter = GoBuilder();

  // GoBuilder get pageRouter => _pageRouter;

//</editor-fold>

//<editor-fold desc="TO">
  static Future<T?> to<T extends Object?>(
      Widget page, {
        TransitionType? transition,
        AnimationOption? options,
      }) {
    return _navigatorKey.currentState!.push<T>(_pageRouter.build(
      page,
      transition: transition,
      options: options,
    ));
  }

//</editor-fold>

//<editor-fold desc="TO NAMED">
  static Future<T?> toNamed<T extends Object?>(
      NamedRoutes namedRoute, {
        Object? arguments,
      }) {
    return _navigatorKey.currentState!.pushNamed<T>(
      namedRoute.routeName,
      arguments: arguments,
    );
  }

//</editor-fold>

//<editor-fold desc="OFF">
  // push named with transition
  static Future<T?> off<T extends Object?, TO extends Object?>(
      Widget page, {
        TransitionType? transition,
        AnimationOption? options,
      }) {
    return _navigatorKey.currentState!.pushReplacement<T, TO>(_pageRouter.build(
      page,
      transition: transition,
      options: options,
    ));
  }

//</editor-fold>

//<editor-fold desc="OFF NAMED">
  // pushReplacement named
  static Future<T?> offNamed<T extends Object?, TO extends Object?>(
      NamedRoutes namedRoute, {
        Object? arguments,
        TO? result,
      }) {
    return _navigatorKey.currentState!.pushReplacementNamed<T, TO>(
      namedRoute.routeName,
      arguments: arguments,
      result: result,
    );
  }

//</editor-fold>

//<editor-fold desc="OFF ALL">
  // pushNamedAndRemoveUntil named with transition
  static Future<T?> offAll<T extends Object?, TO extends Object?>(
      Widget page, {
        TransitionType? transition,
        AnimationOption? options,
      }) {
    return _navigatorKey.currentState!.pushAndRemoveUntil<T>(
      _pageRouter.build(
        page,
        transition: transition,
        options: options,
      ),
          (route) => false,
    );
  }

//</editor-fold>

//<editor-fold desc="OFF ALL NAMED">
  // pushReplacement named with transition
  static Future<T?> offAllNamed<T extends Object?>(
      NamedRoutes namedRoute, {
        Object? arguments,
      }) {
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
      namedRoute.routeName,
          (route) => false,
      arguments: arguments,
    );
  }

//</editor-fold>

//<editor-fold desc="back">

// back
  static void back<T extends Object?>([T? result]) {
    if (canPop) {
      _navigatorKey.currentState!.pop(result);
    } else {
      _navigatorKey.currentState!.pop(result);
    }
  }

//</editor-fold>

//<editor-fold desc="pop">
  // can pop
  static bool get canPop => _navigatorKey.currentState!.canPop();
  // may pop
  static Future<bool> get mayPop => _navigatorKey.currentState!.maybePop();
//</editor-fold>
}
