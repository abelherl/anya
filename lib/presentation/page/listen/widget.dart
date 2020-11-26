import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({
    this.child,
    this.colors
  });

  final Widget child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: colors,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);
  @override
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => null;

  @override
  bool get opaque => false;

  final Widget child;

  @override
  Curve get barrierCurve => Curves.easeOutQuart;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);
}
