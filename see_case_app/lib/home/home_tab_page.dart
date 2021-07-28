import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:foods_store_app/goods_car/goods_car_page.dart';
import 'package:foods_store_app/home/home_list_page.dart';
import 'package:foods_store_app/home/home_root_page.dart';
import 'package:foods_store_app/menu_list/menu_list_page.dart';
import 'package:foods_store_app/mine/mine_page.dart';
import 'package:foods_store_app/mine/page/mine_page.dart';
import 'package:foods_store_app/res/resources.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> _pageList;
  int index = 0;
  @override
  void initState() {
    super.initState();
    //AnimatedWidgetsTest
    //MainMessagePage
    //QuestSendPage
    //SendAllWidget
    _pageList = [HomeListPage(),  MinePage()];
    // /// 权限检查弹框
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => SpUtil.getString("hasPermission") != null
    //     ? null
    //     : showModalBottomSheet(
    //     backgroundColor: Colors.transparent,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return PermissionContent();
    //     }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colours.bg_color,
        // appBar: MyAppBar(title: "首页",centerTitle: "首页",isBack: false,),
        bottomNavigationBar: ConvexAppBar(
          //curveSize: 50,
          top:0,
          backgroundColor: Colours.material_bg,
          color: Colours.text,
          activeColor: Colours.app_main,
          elevation: 0.3,
          //   curveSize:12.0,
          items: [
            TabItem(icon: Icons.home_filled, title: '首页',),
            // TabItem(icon: Icons.menu, title: '分类'),
            // TabItem(icon: Icons.shopping_cart_outlined, title: '购物车'),
            // // TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: '我的'),
          ],
          initialActiveIndex: 0,//optional, default as 0
          onTap: (int i) {
            setState(() {
              index = i;
            });
          },
        ),
        body: IndexedStack(
          //保持状态
          index: index,
          children: _pageList,
        )
    );
  }
}
