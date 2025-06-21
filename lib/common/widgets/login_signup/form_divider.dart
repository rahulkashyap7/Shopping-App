import 'package:flutter/material.dart';
import 'package:shopping_app/utils/helpers/helper_function.dart';
import '../../../utils/constants/colors.dart';


class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.dividerText});
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? RColors.darkGrey : RColors.grey, thickness: 1, indent: 60, endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? RColors.darkGrey : RColors.grey, thickness: 1, indent: 5, endIndent: 60)),
      ],
    );
  }
}