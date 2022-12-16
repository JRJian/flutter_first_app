import 'package:get/get.dart';
import 'package:my_blog/ui/page/project_page/project_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectController());
  }
}