import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart';

void goOrReplace(BuildContext context, String route, {Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},}) => goOrReplaceByRouter(GoRouter.of(context), route, pathParameters: pathParameters,
  queryParameters: queryParameters);

void goOrReplaceByRouter(GoRouter router, String route, {Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},}) {
  final loc = router.location();
  //debugPrint(loc);

  if(/*GoRouterState.of(context).uri.toString()*/loc != router.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters)) {
    router.go(router.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters));
  } else {
    //context.pop();
    //router.push(loc);
    router.pushReplacement(loc);
    //context.push(context.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters));
    //context.replace(/*GoRouterState.of(context).uri.toString()*/ loc);//GoRouter.of(context).location());//context.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters));
  }
}

extension GoRouterExtension on GoRouter {
  String location() {
    if(routerDelegate.currentConfiguration.matches.isEmpty) return '';
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }
}