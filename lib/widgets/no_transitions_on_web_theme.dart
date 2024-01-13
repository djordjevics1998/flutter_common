import 'package:flutter/material.dart';

class NoTransitionsOnWebTheme extends PageTransitionsTheme {
  const NoTransitionsOnWebTheme() : super();

  @override
  Widget buildTransitions<T>(route,
      context,
      animation,
      secondaryAnimation,
      child,) {
    return child; // disabled animation
    /*if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );*/
  }
}