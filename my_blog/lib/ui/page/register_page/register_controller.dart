
import 'package:my_blog/base/get_controller_inject.dart';
import 'package:my_blog/res/strings.dart';
import 'package:my_blog/router/routes.dart';
import 'package:my_blog/util/toast_util.dart';
import 'package:get/get.dart';

class RegisterController extends BaseGetController {
  String account = '';
  String password = '';
  String rePassword = '';
  final isPrivacyChecked = true.obs;

  updateCheck() {
    isPrivacyChecked.value = !isPrivacyChecked.value;
    update(['isPrivacyChecked']);
  }

  bool showButtonEnabled() {
    return account.isNotEmpty &&
        password.isNotEmpty &&
        rePassword.isNotEmpty;
  }

  ///点击注册
  /// 注册成功跳转
  register() {
    if(account.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty){
      return;
    }
    ///账户名：>6位
    if (account.isEmpty || account.length < 6) {
      ToastUtils.show(account.isEmpty
          ? StringStyles.registerAccountEmpty.tr
          : StringStyles.registerAccountLength.tr);
      return;
    }
    ///密码：>6位
    if (password.isEmpty || password.length < 6) {
      ToastUtils.show(password.isEmpty
          ? StringStyles.registerPasswordEmpty.tr
          : StringStyles.registerPasswordLength.tr);
      return;
    }
    ///确认密码：>6位
    if (rePassword.isEmpty || rePassword.length < 6) {
      ToastUtils.show(rePassword.isEmpty
          ? StringStyles.registerRePasswordEmpty.tr
          : StringStyles.registerRePasswordLength.tr);
      return;
    }
    ///密码 == 确认密码
    if (password != rePassword) {
      ToastUtils.show(StringStyles.registerPasswordDiff.tr);
      return;
    }
    ///同意服务条款
    if (!isPrivacyChecked.value) {
      ToastUtils.show(StringStyles.registerNotServiceTerms.tr);
      return;
    }

    request.register(account, password, rePassword , success: (data){
        ToastUtils.show(StringStyles.registerSuccess.tr);
        Get.offAllNamed(Routes.homePage);
    });
  }
}