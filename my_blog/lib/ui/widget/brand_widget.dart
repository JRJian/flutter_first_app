
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_blog/res/strings.dart';
import 'package:my_blog/res/style.dart';
import 'package:my_blog/res/r.dart';
import 'package:get/get.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            R.assetsImagesApplicationTransparent,
            color: Colors.white,
            width: 80,
          ),
          Text(
            StringStyles.appName.tr,
            style: Styles.style_white_36,
          )
        ],
      ),
    );
  }
}