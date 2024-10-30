import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/current_point_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/today_promises_overview_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/upcoming_promises_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: '홈',
        actionIcon: PhosphorIcons.bell(),
        actionOnPressed: () {},
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TodayPromisesOverviewWidget(),
              CurrentPointWidget(),
              UpcomingPromisesWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
