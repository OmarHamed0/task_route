import 'package:flutter_task/domain/entity/product_entity.dart';
import 'package:hive/hive.dart';

abstract class ProductLocalDataSource {
  List<ProductEntity> getAllProduct();
  Future<void> cacheProductEntity(List<ProductEntity> products);
}

class ProductLocalDataSourceImp implements ProductLocalDataSource {
  ProductLocalDataSourceImp(){
    openBox();
  }
  String keyProduct = "product";

  Future<Box<ProductEntity>> openBox() async {
    return await Hive.openBox<ProductEntity>(keyProduct);
  }

  Future<Box<ProductEntity>> box() async {
    return await openBox();
  }

  @override
  List<ProductEntity> getAllProduct() {
    var products = Hive.box<ProductEntity>(keyProduct).values.toList();
    return products;
  }

  @override
  Future<void> cacheProductEntity(List<ProductEntity> products) async {
    var boxInstance = await box();
    await boxInstance.clear();
    for (var product in products) {
      await boxInstance.add(product);
    }
  }
}