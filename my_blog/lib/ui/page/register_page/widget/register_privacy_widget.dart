
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/res/colors.dart';
import 'package:my_blog/res/strings.dart';
import 'package:my_blog/res/style.dart';
import 'package:my_blog/ui/page/register_page/register_controller.dart';

import 'package:get/get.dart';

class RegisterPrivacyWidget extends GetView<RegisterController> {

  const RegisterPrivacyWidget({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Obx(() {
            return Checkbox(
              value: controller.isPrivacyChecked.value, 
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.all(ColorStyle.color_24CF5F),
              onChanged: (selected) {
                controller.updateCheck();
              }
            );
          }),
          Text(
            StringStyles.registerServiceTerms.tr,
            style: Styles.style_white_14,
          )
        ],
      ),
    );
  }
}