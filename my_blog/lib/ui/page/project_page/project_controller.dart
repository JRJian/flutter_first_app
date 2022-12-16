
import 'package:flutter/cupertino.dart';
import 'package:my_blog/base/base_page_controller.dart';
import 'package:my_blog/base/get_controller_inject.dart';
import 'package:my_blog/util/ext/refresh_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_blog/ui/widget/pull_smart_refresh.dart';
import 'package:my_blog/model/project_model.dart';

class ProjectController extends BaseGetPageController {
  List<ProjectDetail> projectData = [];

  ///请求积分明细
  @override
  void requestData(RefreshController controller,
      {Refresh refresh = Refresh.first}) {
    request.requestProjectList(page, success: (data, over) {
      RefreshExtension.onSuccess(controller, refresh, over);

      ///下拉刷新需要清除列表
      if (refresh != Refresh.down) {
        projectData.clear();
      }
      projectData.addAll(data);
      showSuccess(projectData);
      update();
    }, fail: (code, msg) {
      showError();
      RefreshExtension.onError(controller, refresh);
    });
  }
}