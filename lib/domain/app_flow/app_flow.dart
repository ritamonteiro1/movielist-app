import 'package:flutter/cupertino.dart';

class AppFlow {
  AppFlow(this.title, this.iconData, this.navigatorKey);
  final String title;
  final IconData iconData;
  final GlobalKey<NavigatorState> navigatorKey;

}