
import 'package:flutter/material.dart';
import 'package:my_blog/base/get_common_view.dart';
import 'package:my_blog/res/colors.dart';
import 'package:my_blog/res/r.dart';
import 'package:my_blog/res/shadow_style.dart';
import 'package:my_blog/res/strings.dart';
import 'package:my_blog/res/style.dart';
import 'package:my_blog/ui/page/webview/webview_controller.dart';
import 'package:my_blog/util/toast_util.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/// @description :WebView 底部菜单
class WebViewBottomWidget extends GetCommonView<WebController> {
  const WebViewBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: ShadowStyle.white12Circle(radius: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Box.hBox20,
          Expanded(
              child: GestureDetector(
            onTap: () => ToastUtils.show(StringStyles.webNotComment.tr),
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  StringStyles.webEditHint.tr,
                  style: Styles.style_B8C0D4_14,
                ),
                decoration: const BoxDecoration(
                  color: ColorStyle.colorShadow,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )),
          )),
          Box.hBox20,
          InkWell(
            onTap: () => controller.collectArticle(),
            child: Obx(() => SvgPicture.asset(
              controller.isCollect.value ? R.assetsImagesCollect : R.assetsImagesCollectQuit,
              width: 24,
            )),
          ),
          Box.hBox20,
          InkWell(
            onTap: ()=> ToastUtils.show(StringStyles.notSupportLikes.tr),
            child: const Icon(
            Icons.thumb_up_alt_outlined,
            color: ColorStyle.color_24CF5F,
            size: 24,
          )),
          Box.hBox20,
          InkWell(
            // onTap: () => Navigate.launchInBrowser(controller.detail.link),
            child: const Icon(
              Icons.public,
              color: Colors.blue,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
