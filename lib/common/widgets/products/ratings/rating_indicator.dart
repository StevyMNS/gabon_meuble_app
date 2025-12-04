import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gabon_meuble_app/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class GMRatingBarIndicator extends StatelessWidget {
  const GMRatingBarIndicator({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: GMColors.grey,
      itemBuilder:
          (_, __) => const Icon(Iconsax.star1, color: GMColors.primary),
    );
  }
}
