// 약속 목록 페이지

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/user_provider.dart';

class PromiseListScreen extends ConsumerWidget {
  const PromiseListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      body: Center(
        child: Text("로그인 상태: ${user?.name}"),
      ),
    );
  }
}
