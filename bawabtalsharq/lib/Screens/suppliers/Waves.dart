import 'dart:math' as math show sin, pi;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CurveWave extends Curve {
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return t;
    }
    return math.sin(t * math.pi);
  }
}
