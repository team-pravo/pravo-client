import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart' as constants;

class Depth2AppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final IconData? actionIcon;
  final String? actionIconText;
  final VoidCallback? actionOnPressed;

  const Depth2AppBarWidget({
    super.key,
    required this.title,
    this.leadingIcon,
    this.leadingOnPressed,
    this.actionIcon,
    this.actionIconText,
    this.actionOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      automaticallyImplyLeading: false,
      leading: leadingIcon != null && leadingOnPressed != null
          ? IconButton(
              icon: Icon(
                leadingIcon,
              ),
              color: Theme.of(context).appBarTheme.iconTheme!.color,
              iconSize: Theme.of(context).appBarTheme.iconTheme!.size,
              onPressed: leadingOnPressed,
            )
          : null,
      actions: [
        if (actionIcon != null && actionOnPressed != null)
          IconButton(
            icon: Icon(
              actionIcon,
            ),
            color: Theme.of(context).appBarTheme.iconTheme!.color,
            iconSize: Theme.of(context).appBarTheme.iconTheme!.size,
            onPressed: actionOnPressed,
          )
        else if (actionIconText != null && actionOnPressed != null)
          GestureDetector(
            onTap: actionOnPressed,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                actionIconText!,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(constants.kAppBarHeight);
}
