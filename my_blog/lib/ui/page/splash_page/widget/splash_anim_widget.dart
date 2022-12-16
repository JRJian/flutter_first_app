import 'package:flutter/cupertino.dart';
import 'package:my_blog/base/get_common_view.dart';
import 'package:my_blog/router/routes.dart';
import 'package:my_blog/ui/page/splash_page/splash_controller.dart';
import 'package:get/get.dart';
import 'package:my_blog/util/save/util.dart';
import 'package:my_blog/res/r.dart';
import 'package:my_blog/res/style.dart';
import 'package:my_blog/res/strings.dart';

class SplashAnimWidget extends GetCommonView<SplashController> {
  const SplashAnimWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        onEnd: () {
          Get.offNamed(UtilTool.getUserInfo() == null
              ? Routes.loginPage
              : Routes.homePage);
        },
        opacity: controller.opacityLevel,
        duration: const Duration(seconds: 3),
        child: Container(
          margin: const EdgeInsets.only(top: 120),
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset(
                R.assetsImagesApplication,
                fit: BoxFit.fitWidth,
                width: 110,
                height: 110,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child:  Text(
                  StringStyles.appName.tr,
                  style: Styles.style_black_36,
                ),
              ),
            ],
          ),
        ));
  }
}
