
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/ui/page/splash_page/splash_binding.dart';
import 'package:my_blog/ui/page/splash_page/splash_page.dart';
import 'package:my_blog/util/injection_init.dart';
import 'package:my_blog/util/save/util.dart';
import 'router/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashPage,
        defaultTransition: Transition.fade,
        getPages: Routes.pages,
    )
  );
}