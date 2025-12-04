import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class GMOverallProductRating extends StatelessWidget {
  const GMOverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text("4.8", style: Theme.of(context).textTheme.displayLarge),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              GMRatingProgressIndicator(text: "5", value: 1.0),
              GMRatingProgressIndicator(text: "4", value: 0.8),
              GMRatingProgressIndicator(text: "3", value: 0.6),
              GMRatingProgressIndicator(text: "2", value: 0.4),
              GMRatingProgressIndicator(text: "1", value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}
