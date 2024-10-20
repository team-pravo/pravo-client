// 약속 목록 페이지

import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';

class PromiseListScreen extends StatelessWidget {
  const PromiseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: "약속 목록",
        actionIcon: Icons.notifications_none_rounded,
        actionOnPressed: () {},
      ),
      body: const Center(),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
