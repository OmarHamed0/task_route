import 'package:flutter_task/core/api/api_consumer.dart';
import 'package:flutter_task/core/api/end_points.dart';
import 'package:flutter_task/data/model/product_model.dart';
import 'package:flutter_task/domain/entity/product_entity.dart';
abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> getAllProduct();
}
class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
   final ApiConsumer apiConsumer;
  ProductRemoteDataSourceImp({required this.apiConsumer});

  @override
  Future<List<ProductEntity>>  getAllProduct() async {
    final response = await apiConsumer.get(
      endPoint: EndPoints.product,
    );
    List<ProductEntity> productEntities = (response as List).map((json) {
      final productModel = ProductModel.fromJson(json);

      return ProductEntity(
          id: productModel.id ?? 0,
          title: productModel.title,
          price: productModel.price ?? 0.0,
          image: productModel.image ?? '',
          description: productModel.description ?? 'No description',
          rate: productModel.rating?.rate ?? 131
      );
    }).toList();
    return productEntities;
  }

}
