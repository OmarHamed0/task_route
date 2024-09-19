import 'package:hive_flutter/hive_flutter.dart';
part 'product_entity.g.dart';
@HiveType(typeId: 0)
class ProductEntity{
  @HiveField(0)
  num  ? id;
  @HiveField(1)
  String ?title;
  @HiveField(2)
  String ?image;
  @HiveField(3)
  num ?price;
  @HiveField(4)
  String ?description;
  @HiveField(5)
  num ? rate;

 ProductEntity({
   this.id,
   this.price,
   this.title,
   this.description,
   this.rate,
   this.image
});

}
