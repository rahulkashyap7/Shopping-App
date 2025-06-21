import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/r_circular_image.dart';


class RUserProfileTile extends StatelessWidget {
  const RUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RCircularImage(image: RImages.userPic, width: 50, height: 50, padding: 0),
      title: Text('Rahul Kashyap', style: Theme.of(context).textTheme.headlineSmall!.apply(color: RColors.white)),
      subtitle: Text('rahul@unitedfacilities.in', style: Theme.of(context).textTheme.bodyMedium!.apply(color: RColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: Icon(Iconsax.edit, color: RColors.white)),
    );
  }
}