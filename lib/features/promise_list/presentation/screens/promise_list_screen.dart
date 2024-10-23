// 약속 목록 페이지

import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/promise_list/presentation/widgets/promise_list_widget.dart';

class PromiseListScreen extends StatelessWidget {
  const PromiseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: Depth1AppBarWidget(
          title: "약속 목록",
          actionIcon: Icons.notifications_none_rounded,
          actionOnPressed: () {},
        ),
        body: const Column(
          children: [
            TabBar(
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              tabs: [
                Tab(
                  text: '예정된 약속',
                  height: 40,
                ),
                Tab(
                  text: '지난 약속',
                  height: 40,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PromiseListWidget(),
                  PromiseListWidget(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const NavigationBarWidget(),
      ),
    );
  }
}
