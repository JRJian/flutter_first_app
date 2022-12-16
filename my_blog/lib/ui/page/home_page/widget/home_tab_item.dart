import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @description :文字加图标的Tab
class TabTitleItem extends StatelessWidget {
  String title = "";
  IconData? icon;

  TabTitleItem({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: title,
      iconMargin: const EdgeInsets.all(4),
      icon: Icon(
        icon,
      ),
    );
  }
}
