import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart' as constants;

class Depth1AppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final IconData actionIcon;
  final VoidCallback actionOnPressed;

  const Depth1AppBarWidget({
    super.key,
    required this.title,
    required this.actionIcon,
    required this.actionOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      actions: [
        IconButton(
          icon: Icon(
            actionIcon,
          ),
          color: Theme.of(context).appBarTheme.iconTheme!.color,
          iconSize: Theme.of(context).appBarTheme.iconTheme!.size,
          onPressed: actionOnPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(constants.kAppBarHeight);
}
