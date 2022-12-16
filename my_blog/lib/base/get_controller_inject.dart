import 'package:get/get.dart';
import 'package:my_blog/http/request_repository.dart';

class BaseGetController extends GetxController {

  /// http请求仓库
  late RequestRepository request;

  @override
  void onInit() {
    super.onInit();
    request = Get.find<RequestRepository>();
  }
}