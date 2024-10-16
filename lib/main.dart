import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/app/router.dart';
import 'package:pravo_client/app/theme.dart';

void main() {
  runApp(ProviderScope(child: _App()));
}

class _App extends StatelessWidget {
  Color backgroundColor = const Color.fromRGBO(246, 246, 246, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: PravoRouter.router,
    );
  }
}
