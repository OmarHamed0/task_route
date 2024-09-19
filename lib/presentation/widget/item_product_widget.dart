import 'package:flutter/material.dart';
import 'package:flutter_task/domain/entity/product_entity.dart';
import 'package:flutter_task/presentation/widget/widget/product_detils.dart';
import 'package:flutter_task/presentation/widget/widget/product_image.dart';


class ItemProductWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const ItemProductWidget({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color(0xFF004182).withOpacity(0.2), width: 2),
      ),
      width: MediaQuery.of(context).size.width * 0.5,
      //height:  MediaQuery.of(context).size.height*0.2,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProductImage(image:productEntity.image.toString() ,),
          ProductDetails(productEntity: productEntity,),
        ],
      ),
    );
  }
}





