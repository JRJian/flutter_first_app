
import 'package:get/get.dart';
import 'package:my_blog/ui/page/register_page/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}