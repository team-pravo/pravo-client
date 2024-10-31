import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/date_provider.dart';
import 'package:pravo_client/provider/navigation_provider.dart';

class NavigationBarWidget extends ConsumerWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationIndexProvider);

    void onItemTapped(int index) {
      final routes = ['/', '/promises', '/new', '/store', '/setting'];
      ref.read(navigationIndexProvider.notifier).state = index;

      // 탭 이동 시 dateProvider 상태 초기화
      ref.read(dateProvider.notifier).updateDate(null);

      context.go(routes[index]);
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0.0,
      unselectedFontSize: 0.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(color: kSelectedIconColor),
      unselectedIconTheme: const IconThemeData(color: kUnselectedIconColor),
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: PhosphorIcon(
            PhosphorIcons.house(PhosphorIconsStyle.regular),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: PhosphorIcon(
            PhosphorIcons.list(PhosphorIconsStyle.regular),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: PhosphorIcon(
            PhosphorIcons.calendarBlank(PhosphorIconsStyle.regular),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: PhosphorIcon(
            PhosphorIcons.shoppingBag(PhosphorIconsStyle.regular),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: PhosphorIcon(
            PhosphorIcons.user(PhosphorIconsStyle.regular),
          ),
          label: '',
        ),
      ],
    );
  }
}
