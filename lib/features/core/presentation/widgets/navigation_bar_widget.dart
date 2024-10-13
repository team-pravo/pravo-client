import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/provider/navigation_provider.dart';

class NavigationBarWidget extends ConsumerWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationIndexProvider);

    void onItemTapped(int index) {
      final routes = ['/', '/promises', '/promises/new', '/shop', '/setting'];
      ref.read(navigationIndexProvider.notifier).state = index;
      context.go(routes[index]);
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0.0,
      unselectedFontSize: 0.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(color: Color(0xff0cc761)),
      unselectedIconTheme: const IconThemeData(color: Color(0xffc9c9c9)),
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list_rounded,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.post_add_rounded,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag_outlined,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_2_outlined,
          ),
          label: "",
        ),
      ],
    );
  }
}
