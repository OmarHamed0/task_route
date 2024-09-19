import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: Image.network(
               image,
            // height: 120,
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 1,
          right: 1,
          child: IconButton(
            icon: const CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.blueLight,
                )),
            onPressed: () {
              // Add to favorites logic here
            },
          ),
        ),
      ],
    );
  }
}
