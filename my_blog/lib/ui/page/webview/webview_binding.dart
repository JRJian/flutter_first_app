import 'package:get/get.dart';
import 'package:my_blog/ui/page/webview/webview_controller.dart';

class WebPageBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut(() => WebController());
  }
}