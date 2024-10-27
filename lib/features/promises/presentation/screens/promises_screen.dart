import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/promise_list_widget.dart';

class PromisesScreen extends StatelessWidget {
  const PromisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: Depth1AppBarWidget(
          title: '약속 목록',
          actionIcon: Icons.notifications_none_rounded,
          actionOnPressed: () {},
        ),
        body: const Column(
          children: [
            TabBar(
              dividerColor: kUnselectedIconColor,
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
