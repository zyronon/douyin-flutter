import 'package:hope/http/core/dio_adapter.dart';

import '../request/base_request.dart';
import 'network_error.dart';
import 'network_adapter.dart';
import 'mock_adapter.dart';

///1.支持网络库插拔设计，且不干扰业务层
///2.基于配置请求请求，简洁易用
///3.Adapter设计，扩展性强
///4.统一异常和返回处理
class Network {
  Network._(); // 私有化构造函数

  static Network get instance => _getInstance();
  static Network? _instance;

  static Network _getInstance() {
    _instance ??= Network._();
    return _instance!; // 断言_instance不为空
  }

  Future<T?> fire<T>(BaseRequest request) async {
    NetworkResponse<T>? response;
    var error;
    try {
      response = await send(request);
    } on NetworkError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    } catch (e) {
      //其它异常
      error = e;
      printLog(e);
    }
    if (response == null) {
      printLog(error);
      throw NetworkError(0, 'unknow error');
    }
    int status = response.statusCode;
    var result = response.data;
    printLog(result);
    switch (status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw NetworkError(status, result.toString(), data: result);
    }
  }

  Future<NetworkResponse<T>> send<T>(BaseRequest request) async {
    ///使用Dio发送请求
    NetworkAdapter adapter = DioAdapter();
    return adapter.send<T>(request);
  }

  void printLog(log) {
    print('network:${log.toString()}');
  }
}
