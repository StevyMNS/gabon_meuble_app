import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/images/gm_circular_image.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class GMUserProfileTile extends StatelessWidget {
  const GMUserProfileTile({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GMCircularImage(
        image: GMImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        "John Doe",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: GMColors.white),
      ),
      subtitle: Text(
        "johndoe@gmail.com",
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: GMColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: GMColors.white),
      ),
    );
  }
}
