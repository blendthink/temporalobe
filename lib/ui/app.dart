import 'package:flutter/material.dart';
import 'package:temporalobe/ui/router.dart' as router;
import 'package:temporalobe/ui/theme.dart' as theme;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: theme.light,
      darkTheme: theme.dark,
    );
  }
}
