import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:gabon_meuble_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:gabon_meuble_app/utils/constants/image_strings.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GMHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(GMImages.artisan3),
                ),
                const SizedBox(width: GSizes.spaceBtwItems),
                Text(
                  "Sarah Ndong",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const GMRatingBarIndicator(rating: 4),
            const SizedBox(width: GSizes.spaceBtwItems),
            Text("01 Juin 2025", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems),
        const ReadMoreText(
          "L'interface utilisateur de l'application est très intuitive. J'ai pu naviguer et faire des achats sans problème. Très bon travail!",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: "voir moins",
          trimCollapsedText: "voir plus",
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: GMColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: GMColors.primary,
          ),
        ),
        const SizedBox(height: GSizes.spaceBtwItems),

        /// Company Review
        GMRoundedContainer(
          backgroundColor: dark ? GMColors.darkGrey : GMColors.grey,
          child: Padding(
            padding: EdgeInsets.all(GSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Boutique GM",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "02 Juin 2025",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: GSizes.spaceBtwItems),
                const ReadMoreText(
                  "L'interface utilisateur de l'application est très intuitive. J'ai pu naviguer et effectuer des achats facilement. Excellent Travail !",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: "voir moins",
                  trimCollapsedText: "voir plus",
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: GMColors.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: GMColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: GSizes.spaceBtwSections),
      ],
    );
  }
}
