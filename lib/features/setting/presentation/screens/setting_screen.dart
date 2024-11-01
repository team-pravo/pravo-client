import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/profile_preview_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/text_buttons_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: '설정',
        actionIcon: PhosphorIcons.bell(),
        actionOnPressed: () => {},
      ),
      body: Container(
        padding: kScreenPadding,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePreviewWidget(),
            SizedBox(height: 50),
            TextButtonsWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
