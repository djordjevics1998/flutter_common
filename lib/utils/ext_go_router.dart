import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void goOrReplace(BuildContext context, String route, {Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},}) => goOrReplaceByRouter(GoRouter.of(context), route, pathParameters: pathParameters,
  queryParameters: queryParameters);

void goOrReplaceByRouter(GoRouter router, String route, {Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},}) {
  final loc = router.location();
  //debugPrint(loc);
  //debugPrint(router.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters));
  //debugPrint('');

  if(/*GoRouterState.of(context).uri.toString()*/loc != router.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters)) {
    router.go(router.namedLocation(route, pathParameters: pathParameters, queryParameters: queryParameters));
  } else {
    //context.pop();
    //router.pushNamed(route, pathParameters: pathParameters, queryParameters: queryParameters);
    /*router.push(loc).then((v) {
      final ctx = router.routerDelegate.navigatorKey.currentContext!;
      Navigator.of(ctx).removeRouteBelow(ModalRoute.of(ctx) as Route);
    });*/
    //while (router.canPop() == true) {
    //  router.pop();
    //}
    //router.pushReplacement(loc);
    //final ctx = router.routerDelegate.navigatorKey.currentContext!;
    //final goRoute = router.routerDelegate.state.topRoute!;
    //Navigator.of(ctx, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => goRoute.builder!(context, router.routerDelegate.state)));
    //Navigator.pushNamedAndRemoveUntil(ctx, router.routerDelegate.state.name!, (route) => false, arguments: router.routerDelegate.state.topRoute!..arguments);

    //Navigator.of(router.routerDelegate.navigatorKey.currentContext!).popUntil((route) => router.routerDelegate.currentConfiguration.matches.length <= 1);
    //router.routerDelegate.currentConfiguration.isNotEmpty;
    //router.pushReplacement(loc);

    //Navigator.pushAndRemoveUntil(router.routerDelegate.navigatorKey.currentContext!,'/',(_) => false);

    //Router.neglect(, () => router.pushReplacement(loc));

    while (router.canPop() == true) {
      router.pop();
    }
    Router.neglect(router.routerDelegate.navigatorKey.currentContext!, () => router.push(loc, extra: DateTime.now().microsecondsSinceEpoch),);

    //Router.neglect(router.routerDelegate.navigatorKey.currentContext!, () => router.push(loc));
    //router.pop();
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