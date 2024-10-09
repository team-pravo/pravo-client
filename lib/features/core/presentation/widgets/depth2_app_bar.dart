import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart' as constants;

class Depth2AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback leadingOnPressed;
  final IconData actionIcon;
  final VoidCallback actionOnPressed;

  const Depth2AppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.leadingOnPressed,
    required this.actionIcon,
    required this.actionOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      leading: IconButton(
        icon: Icon(
          leadingIcon,
        ),
        color: Theme.of(context).appBarTheme.iconTheme!.color,
        iconSize: Theme.of(context).appBarTheme.iconTheme!.size,
        onPressed: leadingOnPressed,
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
