import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnBackPressed = bool Function(BuildContext context);

class BackwardsView extends StatelessWidget {
  final OnBackPressed? onBackPressed;
  final Widget child;

  const BackwardsView(
      {super.key, required this.onBackPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return kIsWeb || (!Platform.isAndroid && !Platform.isIOS) || onBackPressed == null
        ? child
        : (Platform.isAndroid
        ? _AndroidBackButton(onBackPressed: onBackPressed!, child: child)
        : GestureDetector(
        onHorizontalDragUpdate: (details) async {
          //set the sensitivity for your ios gesture anywhere between 10-50 is good

          int sensitivity = 35; // Integers().iosSwipeSensitivity;

          if (details.delta.dx > sensitivity) {
            // SWIPE FROM RIGHT DETECTION
            await onBackPressed!.call(context);
          }
        },
        child: child));
  }
}

class _AndroidBackButton extends StatefulWidget {
  final OnBackPressed onBackPressed;
  final Widget child;

  const _AndroidBackButton({required this.onBackPressed, required this.child});

  @override
  State<_AndroidBackButton> createState() => _AndroidBackButtonState();
}

class _AndroidBackButtonState extends State<_AndroidBackButton> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(interceptBackButton, context: context, ifNotYetIntercepted: true);
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    BackButtonInterceptor.remove(interceptBackButton);
    super.dispose();
  }

  // inverse logic from WillPopScope
  Future<bool> interceptBackButton(
      bool stopDefaultButtonEvent, RouteInfo routeInfo) async {
    final shouldNotPop = routeInfo.ifRouteChanged(context)
        ? true
        : await widget.onBackPressed(context);
    if(!shouldNotPop) {
      SystemNavigator.pop(animated: true);
    }
    return true;
  }
}
