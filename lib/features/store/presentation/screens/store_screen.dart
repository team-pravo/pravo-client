import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: '쇼핑',
        actionIcon: Icons.notifications_none_rounded,
        actionOnPressed: () {},
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
