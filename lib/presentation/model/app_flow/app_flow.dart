import 'package:flutter/material.dart';

class AppFlow {
  AppFlow(
    this.title,
    this.iconData,
    this.navigatorKey,
    this.routeName,
  );

  final String title;
  final IconData iconData;
  final GlobalKey<NavigatorState> navigatorKey;
  final String routeName;
}
