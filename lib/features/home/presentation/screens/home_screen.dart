import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/home/domain/entities/home.dart';
import 'package:pravo_client/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:pravo_client/features/home/presentation/widgets/current_point_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/today_promises_overview_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/upcoming_promises_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(homeViewModelProvider.notifier).getHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    ref.listen<AsyncValue<Home>>(homeViewModelProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          context.go(
            '/error',
            extra: {
              'appBarTitle': '오류',
              'errorTitle': '오류가 발생했습니다.',
              'errorMessage': '홈을 조회할 수 없습니다.',
            },
          );
        },
      );
    });

    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: '홈',
        actionIcon: PhosphorIcons.bell(),
        actionOnPressed: () {
          context.push(
            '/hello',
          ); // FIXME: 테스트를 위한 코드이므로 추후 삭제 예정
        },
      ),
      body: homeState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('오류 발생: $error')),
        data: (homeData) {
          return SingleChildScrollView(
            child: Padding(
              padding: kScreenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TodayPromisesOverviewWidget(
                    todayPromises: homeData.todayPromises,
                  ),
                  const SizedBox(height: 20),
                  CurrentPointWidget(points: homeData.point),
                  const SizedBox(height: 20),
                  UpcomingPromisesWidget(
                    upcomingPromises: homeData.upcomingPromises,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
