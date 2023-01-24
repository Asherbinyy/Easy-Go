
import 'package:flutter/src/animation/animation.dart';
import 'package:flutter/src/animation/animations.dart';
import 'package:flutter/src/animation/tween.dart';

import '../../../../Constants/imports_constants.dart';
import '../../../../Helper/Interfaces/helper_imports.dart';
import '../Options/scale_animation_option.dart';

class ScaleAnimator extends Animator<double> with CurveBehaviour , TweenBehaviour<double> {
  final ScaleAnimationOptions options;

  ScaleAnimator(this.options);


  @override
  CurvedAnimation setCurveAnimation(Animation<double> animation) {
    return CurvedAnimation(
      parent: animation,
      curve: options.curve ?? RouterConstants.transitionCurve,
      reverseCurve:
      options.reverseCurve ?? RouterConstants.reverseTransitionCurve,
    );
  }

  @override
  Tween<double> setTween() {
     return  Tween<double>(
        begin: options.begin ,
        end: options.end  ,
      );
  }


  @override
  Animation<double> animator(Animation<double> animation) {
    return setTween().animate(setCurveAnimation(animation));
  }

}
