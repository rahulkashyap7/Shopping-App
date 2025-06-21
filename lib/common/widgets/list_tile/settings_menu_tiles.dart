import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants/colors.dart';

class RSettingsMenuTiles extends StatelessWidget {
  const RSettingsMenuTiles(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing, this.onTap});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 20, color: RColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelSmall!.apply(color: RColors.darkerGrey)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
