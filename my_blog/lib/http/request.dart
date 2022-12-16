
import 'package:flutter/cupertino.dart';
import 'package:my_blog/http/http_request.dart';
import 'package:my_blog/base/get_extension.dart';
import 'package:get/get.dart';
import 'package:my_blog/http/request_api.dart';
import 'package:my_blog/model/request_result.dart';
import 'package:my_blog/util/toast_util.dart';

// 请求对象
class Request {

  /// 发起GET请求
  /// [url] 请求url
  /// [parameters] 请求参数
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  static void get<T>(
    String url,
    parameters, {
    bool isJson = false,
    bool dialog = true,
    Success<T>? success,
    Fail? fail,
  }) {
    _request(Method.GET, url, parameters,isJson: isJson ,dialog: dialog, success: success, fail: fail);
  }

  /// 发起POST请求
  /// [url] 请求url
  /// [parameters] 请求参数
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  static void post<T>(
    String url,
    parameters, {
    bool isJson = false,
    bool dialog = true,
    Success<T>? success,
    Fail? fail,
  }) {
    _request(Method.POST, url, parameters, isJson: isJson ,dialog: dialog ,success: success, fail: fail);
  }

  static void _request<T>(
    Method method,
    String url,
    dynamic parameters, {
      bool isJson = false,
      bool dialog = true,
      Success<T>? success,
      Fail? fail,
    }
  ) {
    if (dialog) {
      Get.showLoading();
    }
    debugPrint("request url ==============> ${RequestApi.baseurl}$url");
    // 校验参数中是否携带URL
    parameters.forEach((key, value) {
      if (url.contains(key)) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    HttpRequest.request(method, url, parameters, isJson: isJson, success: (result) {
      if (dialog) {
        Get.dismiss();
      }
      if(success != null){
        var resultModel = Result.fromJson(result);
        debugPrint("request success =>$resultModel");
        if (resultModel.errorCode == 0) {
          success(resultModel.data);
        } else {
          ///其他状态，弹出错误提示信息
          ToastUtils.show(resultModel.errorMsg);
        }
      }
    }, fail:(code, msg) {
      debugPrint("request error =>$msg");
      if (dialog) {
        Get.dismiss();
      }
      ToastUtils.show(msg);
      if (fail != null) {
        fail(code, msg);
      }
    },);
  }
}