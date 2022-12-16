
import 'package:flutter/material.dart';
import 'package:my_blog/res/r.dart';
import 'package:my_blog/ui/page/splash_page/widget/splash_anim_widget.dart';

class SplashPage extends StatelessWidget {

  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ///预缓存背景图片
    precacheImage(const AssetImage(R.assetsImagesLoginBackground), context);

    return const Scaffold(
      backgroundColor: Colors.blue,
      body: SplashAnimWidget(),
    );
  }
}