import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final bool interactive;
  final Function(double)? onRatingChanged;
  
  const RatingStars({
    Key? key,
    required this.rating,
    this.size = 20.0,
    this.interactive = false,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: interactive
              ? () => onRatingChanged?.call((index + 1).toDouble())
              : null,
          child: Icon(
            index < rating.floor()
                ? Icons.star
                : (index < rating.ceil() && rating % 1 != 0)
                    ? Icons.star_half
                    : Icons.star_border,
            color: Colors.amber,
            size: size,
          ),
        );
      }),
    );
  }
}