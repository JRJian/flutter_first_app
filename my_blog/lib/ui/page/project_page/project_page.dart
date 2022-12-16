
import 'package:flutter/material.dart';
import 'package:my_blog/base/get_save_view.dart';
import 'package:my_blog/ui/page/project_page/project_controller.dart';
import 'package:my_blog/ui/page/project_page/widget/project_list_item.dart';
import 'package:my_blog/ui/widget/pull_smart_refresh.dart';

class ProjectPage extends GetSaveView<ProjectController> {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: RefreshWidget<ProjectController>(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.projectData.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectListItem(
                  controller.projectData[index],
                  (value){
                    controller.projectData[index].collect = value;
                  }
              );
            },
          ),
        ),
      ),
    );
  }
}