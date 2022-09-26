import 'package:flutter/material.dart';

enum RouteType { push, pushReplace, pushRemove }

Future goToNamed(
  BuildContext context, {
  RouteType? routeType,
  Object? argument,
  required String page,
}) {
  switch (routeType) {
    case RouteType.push:
      return Navigator.pushNamed(
        context,
        page,
        arguments: argument,
      );
    case RouteType.pushReplace:
      return Navigator.pushReplacementNamed(
        context,
        page,
        arguments: argument,
      );
    case RouteType.pushRemove:
      return Navigator.pushNamedAndRemoveUntil(
        context,
        page,
        (route) => false,
        arguments: argument,
      );
    default:
      return Navigator.pushNamed(
        context,
        page,
        arguments: argument,
      );
  }
}

Future goToWidget(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  var pageRoute = MaterialPageRoute(
    builder: (context) => page,
    settings: RouteSettings(name: "/${page.toString()}", arguments: arguments),
  );
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(context, pageRoute,
        result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      pageRoute,
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    pageRoute,
  );
}

void goBack(BuildContext context) {
  return Navigator.pop(context);
}
