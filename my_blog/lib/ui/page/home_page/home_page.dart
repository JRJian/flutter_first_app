
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_blog/res/colors.dart';
import 'package:my_blog/res/shadow_style.dart';
import 'package:my_blog/res/strings.dart';
import 'package:my_blog/ui/page/home_page/widget/home_tab_item.dart';
import 'package:my_blog/ui/page/project_page/project_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomeTabOptionsState();
}

class HomeTabOptionsState extends State<HomePage> 
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {

  TabController? tabController;

  ///监听应用从后台切换到前台时，读取粘贴板中的数据，验证URL，已保存分享
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      var clipboardData = Clipboard.getData(Clipboard.kTextPlain);
      clipboardData.then((value){
        debugPrint("clipboardData=> ${value?.text}");
        if(value != null
            && value.text != null
            && value.text!.isNotEmpty
            && (value.text!.startsWith("https://")
            || value.text!.startsWith("http://"))) {
          // Get.dialog(ShareArticleDialog(url :  value.text!));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addObserver(this);

    ///监听TabBar切换事件
    tabController?.addListener(() { 
      var index = tabController?.index;

      ///修复执行2次的BUG,增加条件
      if (tabController?.index == tabController?.animation?.value) {
        if (index == tabController!.length - 1) {
          // Get.find<MyController>()
          //   ..notifyUserInfo()
          //   ..notifyBrowseHistory()
          //   ..notifyShareArticle();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: tabController,
        // children: const [ComplexPage(), ProjectPage(), MyPage()],
        children: const [ProjectPage(), ProjectPage(), ProjectPage()],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
        height: 65,
        decoration: ShadowStyle.white12TopSpread4Blur10(radius: 0),
        child: TabBar(
          indicator: const BoxDecoration(),
          labelColor: ColorStyle.color_24CF5F,
          unselectedLabelColor: ColorStyle.color_B8C0D4,
          controller: tabController,
          tabs: [
            TabTitleItem(
              title: StringStyles.homeComplex.tr,
              icon: Icons.turned_in,
            ),
            TabTitleItem(
              title: StringStyles.homeProject.tr,
              icon: Icons.send,
            ),
            TabTitleItem(
              title: StringStyles.homeMy.tr,
              icon: Icons.person,
            ),
          ],
        ),
      ),)
    );
  }
}