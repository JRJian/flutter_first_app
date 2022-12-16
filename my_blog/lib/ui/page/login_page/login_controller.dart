
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/base/get_controller_inject.dart';
import 'package:my_blog/res/strings.dart';
import 'package:my_blog/router/routes.dart';
import 'package:my_blog/util/toast_util.dart';

class LoginController extends BaseGetController {

  String account = '';
  String password = '';

  bool showButtonEnabled() {
    return account.isNotEmpty && password.isNotEmpty;
  }

  login() {
    if (!showButtonEnabled()) {
      return;
    }

    if (account.isEmpty || account.length < 6) {
      ToastUtils.show(account.isEmpty 
      ? StringStyles.registerAccountEmpty.tr
      : StringStyles.registerAccountLength.tr);
      return;
    }

    if (password.isEmpty || password.length < 6) {
      ToastUtils.show(password.isEmpty 
      ? StringStyles.registerPasswordEmpty.tr
      : StringStyles.registerPasswordLength.tr);
      return;
    }

    request.login(account, password, success: (data) {
      ToastUtils.show(StringStyles.loginSuccess.tr);
      Get.offAllNamed(Routes.homePage);
    }, fail: (code, msg) {
      debugPrint(msg);
    },);
  }
}