import 'package:get/get.dart';
import 'package:my_blog/ui/page/home_page/home_binding.dart';
import 'package:my_blog/ui/page/home_page/home_page.dart';
import 'package:my_blog/ui/page/login_page/login_binding.dart';
import 'package:my_blog/ui/page/login_page/login_page.dart';
import 'package:my_blog/ui/page/register_page/register_binding.dart';
import 'package:my_blog/ui/page/register_page/register_page.dart';
import 'package:my_blog/ui/page/splash_page/splash_binding.dart';
import 'package:my_blog/ui/page/splash_page/splash_page.dart';
import 'package:my_blog/ui/page/webview/webview_binding.dart';
import 'package:my_blog/ui/page/webview/webview_page.dart';

 abstract class Routes {
  ///入口模块
  static const String splashPage = '/splash';

  ///登录模块
  static const String loginPage = '/login';

  ///注册
  static const String registerPage = '/register';

  ///主页
  static const String homePage = '/home';

  ///webView
  static const String webViewPage = '/webView';

  ///反馈
  static const String feedbackPage = '/feedback';

  ///用户信息模块
  static const String userInfoPage = '/userInfo';

  ///积分排行榜
  static const String rankingPage = '/ranking';

  ///关于我们
  static const String aboutPage = '/about';

  ///积分明细
  static const String pointsPage = '/points';

  ///设置
  static const String settingPage = '/setting';

  ///语言
  static const String settingLanguagePage = '/language';

  ///我的收藏
  static const String collectPage = '/collect';

  ///搜索页面
  static const String searchPage = '/search';

  ///浏览记录
  static const String historyPage = '/history';

  ///分享页面
  static const String sharePage = '/share';

  ///页面合集
  static final pages = [
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding()
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: registerPage,
      page: () => const RegisterPage(),
      binding: RegisterBinding()
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: webViewPage,
      page: () => const WebPage(),
      binding: WebPageBinding()
    ),
  ];
}