import 'package:either_dart/src/either.dart';
import 'package:flutter_task/core/failures/exception.dart';
import 'package:flutter_task/core/failures/failures.dart';
import 'package:flutter_task/core/network/network_info.dart';
import 'package:flutter_task/data/data_source/product_local_data_source.dart';
import 'package:flutter_task/data/data_source/product_remote_data_source.dart';
import 'package:flutter_task/domain/entity/product_entity.dart';
import 'package:flutter_task/domain/repository/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;
  final NetworkInfo networkInfo;
  ProductRepositoryImp(
      {required this.productLocalDataSource,
      required this.networkInfo,
      required this.productRemoteDataSource});
  @override
  Future<Either<Failures, List<ProductEntity>>> getAllProduct() async {
    if (await networkInfo.isConnected) {
      try {
        final products = await productRemoteDataSource.getAllProduct();
        await productLocalDataSource.cacheProductEntity(products);
        return Right(products);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMassage: e.toString()));
      }
    } else {
      try {
        final products = productLocalDataSource.getAllProduct();
        return Right(products);
      } catch (e) {
        return Left(ServerFailure(errorMassage: e.toString()));
      }
    }
  }
}
