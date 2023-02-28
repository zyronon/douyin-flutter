import 'package:dio/dio.dart';
import 'package:hope/http/core/network_error.dart';
import 'package:hope/http/core/network_adapter.dart';
import 'package:hope/http/request/base_request.dart';

///Dio适配器
class DioAdapter extends NetworkAdapter {
  @override
  Future<NetworkResponse<T>> send<T>(BaseRequest request) async {
    Options options = Options(headers: request.header);
    var response;
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await Dio().get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await Dio()
            .delete(request.url(), data: request.params, options: options);
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }
    if (error != null) {
      ///抛出NetworkError
      throw NetworkError(response?.statusCode ?? 0, error.toString(),
          data: buildRes(response, request));
    }
    return buildRes<T>(response, request);
  }

  ///构建NetworkResponse
  NetworkResponse<T> buildRes<T>(Response<T> response, BaseRequest request) {
    return NetworkResponse<T>(
        data: response.data,
        request: request,
        statusCode: response.statusCode ?? 0,
        statusMessage: response.statusMessage ?? 'unknow',
        extra: response);
  }
}
