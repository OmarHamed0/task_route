import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/style.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final double priceDecount;
  const ProductPrice(
      {super.key, required this.price, required this.priceDecount});

  @override
  Widget build(BuildContext context) {
    return Row(
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Text(
            "EGp $price",
            style: Styles.textStyle14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Text(
            " $priceDecount EGp",
            style:Styles.textStyle11,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
