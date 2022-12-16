
import 'package:my_blog/base/get_controller_inject.dart';
import 'package:my_blog/base/base_page_controller.dart';
import 'package:my_blog/model/web_model.dart';
import 'package:get/get.dart';

class WebController extends BaseGetController {

  /// 外部传的参数
  WebEntity detail = Get.arguments;

  ///进度条
  var progress = 0.0.obs;

  ///是否点赞
  var isCollect = false.obs;

  ///控制收藏的取消与结束
  var collectAtState = false.obs;

  @override
  void onInit() {
    super.onInit();
    isCollect.value = detail.isCollect;
  }
  
  ///收藏&取消收藏
  ///注意此处，从收藏进入取消收藏的ID是originId
  collectArticle() {
    // if(!isCollect.value){
    //   collectAtState.value = true;
    //   Future.delayed(const Duration(milliseconds: 900)).then((value)  {
    //     collectAtState.value = false;
    //   });
    // }

    // request.collectArticle(
    //     isCollect.value && detail.originId != 0? detail.originId : detail.id,
    //     isCollect: isCollect.value,
    //     success: (data) {
    //       ToastUtils.show(
    //           isCollect.value ? StringStyles.collectQuit.tr : StringStyles
    //               .collectSuccess.tr);
    //       isCollect.value = !isCollect.value;
    //       update();
    //     });
  }
}