import 'package:flutter/material.dart';
import 'package:pravo_client/app/router.dart';
import 'package:pravo_client/app/theme.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: PravoRouter.router,
    );
  }
}
