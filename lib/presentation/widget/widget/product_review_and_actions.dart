import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/style.dart';

class ProductReviewAndActions extends StatelessWidget {
  final String rating;
  const ProductReviewAndActions({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Review ($rating)",
          style: Styles.textStyle12,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Icon(
          Icons.star,
          color: AppColors.kYellow,
          size: 16,
        ),
        const Spacer(),
        const CircleAvatar(
            backgroundColor:AppColors.blueLight,
            radius: 14,
            child: Icon(
              size: 17,
              Icons.add,
              color: AppColors.kWhite,
            )),
      ],
    );
  }
}
