import 'package:flutter/material.dart';
import 'package:sundephish/core/api/api.provider.dart';
import 'package:sundephish/core/api/request.model.dart';
import 'package:sundephish/core/di.dart';
import 'package:sundephish/providers/facebook/facebook.screen.dart';
import 'package:sundephish/providers/facebook/facebook.theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    getIt.get<IApiProvider>().submit(ActionEnum.openBrowser);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: facebookTheme,
      darkTheme: facebookTheme,
      home: const FacebookScreen(),
    );
  }
}
