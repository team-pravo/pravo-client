import 'package:flutter/material.dart';
import 'package:pravo_client/app/router.dart';
import 'package:pravo_client/app/theme.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  Color backgroundColor = const Color.fromRGBO(246, 246, 246, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: PravoRouter.router,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: backgroundColor),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: backgroundColor),
      ),
    );
  }
}
