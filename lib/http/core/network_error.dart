///需要登录的异常
class NeedLogin extends NetworkError {
  NeedLogin({int code = 401, String message = '请先登录'}) : super(code, message);
}

///需要授权的异常
class NeedAuth extends NetworkError {
  NeedAuth(String message, {int code = 403, dynamic data})
      : super(code, message, data: data);
}

///网络异常统一格式类
class NetworkError implements Exception {
  final int code;
  final String message;
  final dynamic data;

  NetworkError(this.code, this.message, {this.data});
}
