import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:gabon_meuble_app/utils/helpers/helper_functions.dart';

class GMChoiceChip extends StatelessWidget {
  const GMChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = GMHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        avatar:
            isColor
                ? GMCircularContainer(
                  width: 50,
                  height: 50,
                  backgroundColor: GMHelperFunctions.getColor(text)!,
                )
                : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? GMHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
