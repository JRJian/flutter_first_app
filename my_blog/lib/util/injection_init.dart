import 'package:my_blog/http/request_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @description :初始化时进行依赖注入，可全局使用
class Injection{

  static Future<void> init() async {
    // shared_preferences
    await Get.putAsync(() => SharedPreferences.getInstance());
    Get.lazyPut(() => RequestRepository());
    // 不知道为啥要先取一次RequestRepository，否则后面会获取失败
    RequestRepository request = Get.find<RequestRepository>();
  }
}