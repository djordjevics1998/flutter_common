import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void goOrReplace(BuildContext context, String route, {Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},}) {
  final loc = GoRouter.of(context).location();
  if(/*GoRouterState.of(context).uri.toString()*/loc != context.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters)) {
    context.go(context.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters));
  } else {
    context.replace(/*GoRouterState.of(context).uri.toString()*/ loc);//GoRouter.of(context).location());//context.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters));
  }
}

extension GoRouterExtension on GoRouter {
  String location() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }
}