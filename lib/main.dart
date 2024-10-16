import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/app/theme.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/router_provider.dart';

void main() {
  runApp(ProviderScope(child: _App()));
  runApp(ProviderScope(child: _App()));
}

class _App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      theme: appTheme,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      // routerConfig: PravoRouter.router(ref),
    );
  }
}
