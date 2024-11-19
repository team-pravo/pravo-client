import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/promises/domain/entities/promise.dart';
import 'package:pravo_client/features/promises/presentation/viewmodels/promises_view_model.dart';
import 'package:pravo_client/features/promises/presentation/widgets/promise_list_widget.dart';

final upcomingPromisesProvider =
    FutureProvider.autoDispose<List<Promise>>((ref) {
  return ref
      .read(promisesViewModelProvider.notifier)
      .fetchUpcomingPromises(DateTime.now());
});

final pastPromisesProvider = FutureProvider.autoDispose<List<Promise>>((ref) {
  return ref
      .read(promisesViewModelProvider.notifier)
      .fetchPastPromises(DateTime.now());
});

class PromisesScreen extends ConsumerWidget {
  const PromisesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: Depth1AppBarWidget(
          title: '약속 목록',
          actionIcon: PhosphorIcons.bell(),
          actionOnPressed: () {},
        ),
        body: Column(
          children: [
            const TabBar(
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
                  // 예정된 약속 탭
                  Consumer(
                    builder: (context, ref, child) {
                      final promisesAsync = ref.watch(upcomingPromisesProvider);
                      return promisesAsync.when(
                        data: (promises) =>
                            PromiseListWidget(promises: promises),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, stack) =>
                            Center(child: Text('Error: $error')),
                      );
                    },
                  ),

                  // 지난 약속 탭
                  Consumer(
                    builder: (context, ref, child) {
                      final promisesAsync = ref.watch(pastPromisesProvider);
                      return promisesAsync.when(
                        data: (promises) =>
                            PromiseListWidget(promises: promises),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, stack) => Center(
                          child: Text(
                            'Error: $error',
                          ),
                        ), // FIXME: 에러가 발생할 경우, 에러 페이지로 리다이렉션 해줄 것인지? 아니면 해당 화면에서 에러 처리를 해줄 것인지?
                      );
                    },
                  ),
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
