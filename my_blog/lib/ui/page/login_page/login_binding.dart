
import 'package:get/get.dart';
import 'package:my_blog/ui/page/login_page/login_controller.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginController>(() => LoginController());
  }
}