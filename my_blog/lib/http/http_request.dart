import 'dart:io';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_blog/http/request_api.dart';
import 'package:my_blog/model/request_register.dart';
import 'package:my_blog/util/save/util.dart';

import 'http_exception.dart';

///请求类型枚举
// ignore: constant_identifier_names
enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }

///请求类型值
const _methodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};

/// 连接超时时间
const int _connectTimeout = 10000;

/// 接收超时时间
const int _receiveTimeout = 10000;

/// 发送超时时间
const int _sendTimeout = 10000;

/// 成功回调，失败回调
typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class HttpRequest {

  ///是否携带token校验
  static const String _token = '';

  ///全局Dio对象
  static Dio? _dio;

  ///创建 dio 实例对象
  static Dio createInstance([bool isJson = false]) {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        ///提交方式：1.表单提交 2.JSON方式提交
        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        contentType: isJson
          ? Headers.jsonContentType 
          : Headers.formUrlEncodedContentType,
        // 适用于post form表单提交
        // responseType: ResponseType.json,
        /// 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        validateStatus: (status) => true,
        baseUrl: RequestApi.baseurl,
        sendTimeout: _sendTimeout,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
      );
      _dio = Dio(options);
    }
    _dio?.options.contentType =
        isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    return _dio!;
  }

  static Future request<T>(Method method, String path, dynamic params, 
    {bool isJson = false, Success? success, required Fail? fail}) async {
      try {
        ///请求前先检查网络连接
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          _onError(HttpException.netError, '网络异常，请检查你的网络！', fail);
          return;
        }
        Dio dio = createInstance(isJson);
        Response response = await dio.request(path, data: params, options: Options(
          method: _methodValues[method],
          headers: _headerToken()
        ));
        if (success != null) {
          success(response.data);
        }
      } on DioError catch (e) {
        final NetError netError = HttpException.handleException(e);
        _onError(netError.code, netError.msg, fail);
        debugPrint("异常=====>$e");
      }
  }
}

/// 请求时添加cookie
Map<String, dynamic>? _headerToken(){
  /// 自定义Header,如需要添加token信息请调用此参数
  UserEntity? info = UtilTool.getUserInfo();
  if(info == null){
    return null;
  }
  Map<String, dynamic> httpHeaders = {
    'Cookie': 'loginUserName=${info.username};loginUserPassword=${info.password}',
  };
  return httpHeaders;
}

/// 错误回调
/// [code] 错误代码
/// [msg] 错误信息
/// [fail] 错误回调
void _onError(int code, String msg, Fail? fail) {
  if (code == 0) {
    code = HttpException.unknownError;
    msg = '未知异常';
  }
  if (fail != null) {
    fail(code, msg);
  }
}

///解析json数据
///[data] 数据
Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}