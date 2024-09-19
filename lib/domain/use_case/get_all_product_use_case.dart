import 'package:either_dart/either.dart';
import 'package:flutter_task/core/failures/failures.dart';
import 'package:flutter_task/domain/entity/product_entity.dart';
import 'package:flutter_task/domain/repository/product_repository.dart';
class GetAllProductUseCase{
  final ProductRepository productRepository;
  GetAllProductUseCase({required this.productRepository});
  Future<Either<Failures,List<ProductEntity>>> call(){
    return productRepository.getAllProduct();
  }
}