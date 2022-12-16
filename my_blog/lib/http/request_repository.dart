
import 'package:my_blog/http/http_request.dart';
import 'package:my_blog/http/request.dart';
import 'package:my_blog/http/request_api.dart';
import 'package:my_blog/model/project_model.dart';
import 'package:my_blog/model/request_register.dart';
import 'package:my_blog/util/save/util.dart';

typedef SuccessOver<T> = Function(T data, bool over);

class RequestRepository {
  ///登录请求
  /// [account]账号
  /// [password]密码
  /// [password]重复密码
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  register(
    String account,
    String password,
    String rePassword, {
    Success<UserEntity>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.apiRegister, {
      "username": account,
      "password": password,
      "repassword": rePassword
    }, success: (data) {
      var registerInfo = UserEntity.fromJson(data);
      registerInfo.password = password;
      UtilTool.putUserInfo(registerInfo);
      if (success != null) {
        success(registerInfo);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  ///登录请求
  /// [account]账号
  /// [password]密码
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  login(
    String account,
    String password, {
    Success<UserEntity>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(
        RequestApi.apiLogin, {"username": account, "password": password},
        success: (data) {
      var loginInfo = UserEntity.fromJson(data);
      loginInfo.password = password;
      UtilTool.putUserInfo(loginInfo);
      if (success != null) {
        success(loginInfo);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }


  ///请求项目列表接口
  ///[id]文章ID
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  requestProjectList(
    int page, {
    SuccessOver<List<ProjectDetail>>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
        RequestApi.apiProject.replaceFirst(RegExp('page'), '$page'), {},
        dialog: false, success: (data) {
      ProjectPage pageData = ProjectPage.fromJson(data);
      var list = pageData.datas.map((value) {
        return ProjectDetail.fromJson(value);
      }).toList();
      if (success != null) {
        success(list, pageData.over);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }
}