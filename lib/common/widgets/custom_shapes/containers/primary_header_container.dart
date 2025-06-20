import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class GMPrimaryHeaderContainer extends StatelessWidget {
  const GMPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GMCurvedEdgeWidget(
      child: Container(
        color: GMColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: GMCircularContainer(
                backgroundColor: GMColors.textWhite.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: GMCircularContainer(
                backgroundColor: GMColors.textWhite.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
