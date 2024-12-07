import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/member/presentation/viewmodels/get_member_view_model.dart';
import 'package:pravo_client/features/setting/presentation/widgets/profile_preview_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/text_buttons_widget.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getMemberViewModelProvider.notifier).getMember();
    });
  }

  @override
  Widget build(BuildContext context) {
    final memberState = ref.watch(getMemberViewModelProvider);

    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: '설정',
        actionIcon: PhosphorIcons.bell(),
        actionOnPressed: () => {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: kScreenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                memberState.when(
                  data: (member) => ProfilePreviewWidget(
                    member: member,
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                ),
                const SizedBox(height: 50),
                const TextButtonsWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
