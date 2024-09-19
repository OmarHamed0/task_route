import 'package:flutter/material.dart';
import 'package:flutter_task/domain/entity/product_entity.dart';
import 'package:flutter_task/presentation/widget/widget/product_price.dart';
import 'package:flutter_task/presentation/widget/widget/product_review_and_actions.dart';
import 'package:flutter_task/presentation/widget/widget/product_title_and_content.dart';


class ProductDetails extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetails({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductTitleAndContent(
            title: productEntity.title.toString(),
            content:productEntity.description.toString() ,
          ),
          const SizedBox(
            height: 2,
          ),
           ProductPrice(
            price: productEntity.price?.toDouble() ?? 12.0,
            priceDecount: productEntity.price?.toDouble() ?? 12.0,
          ),
          const SizedBox(
            height: 2,
          ),
          ProductReviewAndActions(
            rating: productEntity.rate.toString(),
          )
        ],
      ),
    );
  }
}
