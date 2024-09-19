import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/style.dart';

class ProductTitleAndContent extends StatelessWidget {
  final String title;
  final String content;
  const ProductTitleAndContent({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Mens Cotton Jacket",
          style:Styles.textStyle14,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "Ravelling - Foldsack No. 1 Backpack, Fits 15 Laptops",
          style:  Styles.textStyle14,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
