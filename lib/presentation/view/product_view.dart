// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/api/dio_consumer.dart';
import 'package:flutter_task/core/widget/error_widget.dart';
import 'package:flutter_task/di/di.dart';
import 'package:flutter_task/presentation/view_model/product_cubit.dart';
import 'package:flutter_task/presentation/widget/product_grid_view.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

   var viewModel=getIt.get<ProductCubit>()..getAllProduct();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is ProductSuccessStata) {
            return ProductGridView(
              products: state.products,
            );
          } else if (state is ProductErrorStata) {
            return HandleErrorWidget(
              error: state.errorMassage,
              onPress: () {
                return viewModel.getAllProduct();
              },
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.orangeAccent,
            ));
          }
        },
      ),
    );
  }
}
