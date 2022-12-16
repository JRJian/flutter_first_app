import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

// 状态管理器原理：https://juejin.cn/post/7039637076962181157
// 在界面中使用时需要使用 GetBuilder 进行包裹，这样使用 Controller 中的数据变化时，调用 update() 后就会刷新界面控件。

abstract class GetCommonView<T extends GetxController> extends StatefulWidget {

  const GetCommonView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  // get局部更新字段
  get updateId => null;

  @protected
  Widget build(BuildContext context);

  @override
  AutoDisposeState createState() => AutoDisposeState<T>();
}

/// @description :基类,可自动装载的状态管理
class AutoDisposeState<S extends GetxController> extends State<GetCommonView> {
  AutoDisposeState();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<S>(
        id: widget.updateId,
        builder: (controller) {
          return widget.build(context);
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<S>();
    super.dispose();
  }
}
