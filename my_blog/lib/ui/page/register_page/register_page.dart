
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/base/get_common_view.dart';
import 'package:my_blog/res/button_style.dart';
import 'package:my_blog/res/colors.dart';
import 'package:my_blog/res/r.dart';
import 'package:my_blog/res/strings.dart';
import 'package:my_blog/res/style.dart';
import 'package:my_blog/ui/page/login_page/widget/edit_widget.dart';
import 'package:my_blog/ui/page/register_page/register_controller.dart';
import 'package:my_blog/ui/page/register_page/widget/register_privacy_widget.dart';
import 'package:my_blog/ui/widget/brand_widget.dart';
import 'package:my_blog/ui/widget/section_bar.dart';
import 'package:my_blog/util/keyboard_util.dart';

class RegisterPage extends GetCommonView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(R.assetsImagesLoginBackground),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SectionBar(
                    backColor: Colors.white,
                    backOnTap: () => Get.back(),
                    backgroundColor: Colors.transparent,
                  ),

                  ///logo及app名称
                  const BrandWidget(),

                  ///账户名输入框
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

                  ///密码输入框
                  EditWidget(
                    iconWidget:
                        const Icon(Icons.lock_open, color: Colors.white),
                    hintText: StringStyles.loginAccountPwdHint.tr,
                    security: true,
                    onChanged: (text) => controller
                      ..password = text
                      ..update(),
                  ),

                  ///再次输入密码输入框
                  EditWidget(
                    iconWidget:
                        const Icon(Icons.lock_open, color: Colors.white),
                    hintText: StringStyles.loginAccountRePwdHint.tr,
                    security: true,
                    onChanged: (text) => controller
                      ..rePassword = text
                      ..update(),
                  ),

                  ///用户服务条款
                  const RegisterPrivacyWidget(),

                  ///注册按钮
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
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
                          controller.register();
                        },
                        child: Text(
                          StringStyles.registerButton.tr,
                          style: controller.showButtonEnabled()
                              ? Styles.style_white_18
                              : Styles.style_white24_18,
                        )),
                  ),
                ],
              ),
            )));
  }
}