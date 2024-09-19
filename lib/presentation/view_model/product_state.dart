part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoadingStata extends ProductState {}
final class ProductSuccessStata extends ProductState {
 final List<ProductEntity>products;
  ProductSuccessStata({required this.products});
}
final class ProductErrorStata extends ProductState {
  final String errorMassage;
  ProductErrorStata({required this.errorMassage});
}
