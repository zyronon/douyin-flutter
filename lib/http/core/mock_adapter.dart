import 'package:hope/http/core/network_adapter.dart';
import 'package:hope/http/request/base_request.dart';

///测试适配器，mock数据
class MockAdapter extends NetworkAdapter {
  @override
  Future<NetworkResponse<T>> send<T>(BaseRequest request) {
    return Future<NetworkResponse<T>>.delayed(
        const Duration(milliseconds: 1000), () {
      return NetworkResponse<T>(
          data: {"code": 0, "message": 'success'} as T,
          request: request,
          statusCode: 403,
          statusMessage: 'unknow');
    });
  }
}
