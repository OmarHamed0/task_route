import 'package:dio/dio.dart';
import 'package:flutter_task/core/api/api_consumer.dart';
import 'package:flutter_task/core/api/dio_consumer.dart';
import 'package:flutter_task/data/data_source/product_local_data_source.dart';
import 'package:flutter_task/domain/repository/product_repository.dart';
import 'package:flutter_task/domain/use_case/get_all_product_use_case.dart';
import 'package:flutter_task/presentation/view_model/product_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/network/network_info.dart';
import 'package:get_it/get_it.dart';

import '../data/data_source/product_remote_data_source.dart';
import '../data/repository_imp/product_repository_imp.dart';
final getIt = GetIt.instance;

Future<void> init()async{
  ///bloc
  getIt.registerLazySingleton<ProductCubit>(() => ProductCubit(getIt()),);

  // use case
  getIt.registerLazySingleton<GetAllProductUseCase>(() => GetAllProductUseCase(
      productRepository: getIt(),),);
   //Repository

    getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(
        networkInfo:getIt() ,
        productLocalDataSource: getIt(),
        productRemoteDataSource: getIt()),);

    // data source

    //remote Data Source
    getIt.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImp(
        apiConsumer:getIt(),),);

     /// local Data Source
  getIt.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImp(),);

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(connectionChecker: getIt()));
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));


  /// external
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => Dio());

}
