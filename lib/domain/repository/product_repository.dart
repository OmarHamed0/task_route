import 'package:either_dart/either.dart';
import 'package:flutter_task/core/failures/failures.dart';
import 'package:flutter_task/domain/entity/product_entity.dart';

abstract class ProductRepository{
  Future<Either<Failures,List<ProductEntity>>>getAllProduct();
}