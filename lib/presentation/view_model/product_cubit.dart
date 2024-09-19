import 'package:bloc/bloc.dart';
import 'package:flutter_task/domain/entity/product_entity.dart';
import 'package:flutter_task/domain/use_case/get_all_product_use_case.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProductUseCase getAllProductUseCase;
  ProductCubit(this.getAllProductUseCase) : super(ProductInitial());

  void getAllProduct() async {
    var response = await getAllProductUseCase.call();
    return response.fold(
      (left) {
        emit(ProductErrorStata(errorMassage: left.errorMassage));
      },
      (right) {
        emit(ProductSuccessStata(products: right));
      },
    );
  }
}
