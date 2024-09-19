import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/domain/entity/product_entity.dart';
import 'package:flutter_task/presentation/widget/item_product_widget.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
        itemCount: products.length,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        builder: (ctx, index) {
          return ItemProductWidget(
            productEntity: products[index],
          );
        });
  }
}
