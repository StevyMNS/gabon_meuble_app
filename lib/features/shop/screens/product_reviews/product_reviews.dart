import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/appbar/appbar.dart';
import 'package:gabon_meuble_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:gabon_meuble_app/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GMAppBar(title: Text("Reviews & Ratings"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you use",
              ),
              const SizedBox(height: GSizes.spaceBtwItems),

              /// Overall Product Ratings
              const GMOverallProductRating(),
              const GMRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
