// 약속 상세 페이지 (home 또는 promise_list 페이지 모두에서 접근 가능)

import 'package:flutter/material.dart';

class PromiseDetailScreen extends StatelessWidget {
  const PromiseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('약속 상세 페이지'),
      ),
    );
  }
}
