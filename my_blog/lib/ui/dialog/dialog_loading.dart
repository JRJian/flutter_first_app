
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_blog/res/strings.dart';
import 'package:my_blog/res/r.dart';
import 'package:my_blog/res/style.dart';

/// 公共加载窗
class LoadingDialog extends StatelessWidget {
  String text = '';

  LoadingDialog({Key? key, this.text = StringStyles.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                )
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Lottie.asset(R.assetsLottieLoading, width: 60, animate: true),
                ),
                Text(text, style: Styles.style_white_14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}