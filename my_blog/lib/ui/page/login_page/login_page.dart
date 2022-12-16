
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/base/get_common_view.dart';
import 'package:my_blog/res/button_style.dart';
import 'package:my_blog/res/colors.dart';
import 'package:my_blog/res/strings.dart';
import 'package:my_blog/res/style.dart';
import 'package:my_blog/router/routes.dart';
import 'package:my_blog/ui/page/login_page/login_controller.dart';
import 'package:my_blog/res/r.dart';
import 'package:my_blog/ui/page/login_page/widget/edit_widget.dart';
import 'package:my_blog/ui/widget/brand_widget.dart';
import 'package:my_blog/ui/widget/section_bar.dart';
import 'package:my_blog/util/keyboard_util.dart';

class LoginPage extends GetCommonView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.assetsImagesLoginBackground),
            fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            SectionBar(
              backColor: Colors.white, 
              backgroundColor: Colors.transparent,
              ),
            
            const BrandWidget(),

            // 用户名输入框
            EditWidget(
              iconWidget: const Icon(
                Icons.perm_identity, 
                color: Colors.white,
                ),
              hintText: StringStyles.loginAccountNameHint.tr,
              onChanged: (text) => controller
                ..account = text
                ..update(),
            ),

            // 密码输入框
            EditWidget(
              iconWidget: const Icon(
                Icons.lock_open, 
                color: Colors.white,
                ),
              hintText: StringStyles.loginAccountPwdHint.tr,
              security: true,
              onChanged: (text) => controller
                ..password = text
                ..update(),
            ),

              ///登录按钮
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 36, left: 25, right: 25),
                decoration: BoxDecoration(
                  color: controller.showButtonEnabled()
                      ? ColorStyle.color_24CF5F
                      : ColorStyle.color_24CF5F_20,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: TextButton(
                    style: controller.showButtonEnabled()
                        ? ButtonStyles.getButtonStyle()
                        : ButtonStyles.getTransparentStyle(),
                    onPressed: () {
                      KeyboardUtils.hideKeyboard(context);
                      controller.login();
                    },
                    child: Text(
                      StringStyles.loginButton.tr,
                      style: controller.showButtonEnabled()
                          ? Styles.style_white_18
                          : Styles.style_white24_18,
                    )),
              ),

              ///注册按钮
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: TextButton(
                    style: ButtonStyles.getButtonStyle(),
                    onPressed: () {
                      KeyboardUtils.hideKeyboard(context);
                      Get.toNamed(Routes.registerPage);
                    },
                    child: Text(
                      StringStyles.registerButton.tr,
                      style: Styles.style_white_18,
                    )),
              )
          ],
        ),
      ),
    );
  }
}