import 'package:flutter/material.dart';
import 'package:flutter_task/di/di.dart';
import 'package:flutter_task/domain/entity/product_entity.dart';
import 'package:flutter_task/presentation/view/product_view.dart';
import 'package:hive_flutter/adapters.dart';


void main() async{
WidgetsFlutterBinding.ensureInitialized();
  init();
  await Hive.initFlutter();
Hive.registerAdapter(ProductEntityAdapter());
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
      home: ProductView()
    );
  }
}
