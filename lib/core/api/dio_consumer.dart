import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_task/core/api/api_constant.dart';
import 'package:flutter_task/core/api/api_consumer.dart';
import 'package:flutter_task/core/api/status_code.dart';
import 'package:flutter_task/core/failures/exception.dart';
class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = ApiConstant.url
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
  }

  @override
  Future get(
      {required String endPoint,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    try {
      final response =
          await client.get(endPoint, queryParameters: query, data: data);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badCertificate:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        _handleResponseError(error.response!);
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
    }
  }

  dynamic _handleResponseError(Response response) {
    switch (response.statusCode) {
      case StatusCode.badRequest:
        throw const BadRequestException();
      case StatusCode.unauthorized:
      case StatusCode.forbidden:
        throw const UnauthorizedException();
      case StatusCode.notFound:
        throw const NotFoundException();
      case StatusCode.conflict:
        throw const ConflictException();
      case StatusCode.internalServerError:
        throw const InternalServerErrorException();
    }
  }
}
