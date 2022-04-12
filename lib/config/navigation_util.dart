import 'package:flutter/cupertino.dart';

class NavigationUtil {
  static final GlobalKey<NavigatorState> _rootNavigator = GlobalKey();

  // For get current context. Can use rootKey.currentContext
  static GlobalKey<NavigatorState> get rootKey => _rootNavigator;

  static BuildContext? get currentContext => rootKey.currentContext;
}
