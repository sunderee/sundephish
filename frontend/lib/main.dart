import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:sundephish/core/app.dart';
import 'package:sundephish/core/di.dart';

void main() {
  usePathUrlStrategy();
  configureDependencies();
  runApp(const App());
}
