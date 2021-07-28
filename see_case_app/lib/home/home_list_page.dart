import 'package:flutter/material.dart';
import 'package:foods_store_app/home/home_detail_page.dart';
import 'package:foods_store_app/res/resources.dart';


class HomeListPage extends StatefulWidget {
  const HomeListPage({Key? key}) : super(key: key);

  @override
  _HomeListPageState createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  List datas = [
    "片子1",
    "控件项目",
    "滚动效果",
    "弹出页面",
    "单选多选",
    "搜索",
    "tab效果",
    "圆角线条",
    "输入框"
  ]; //"更新","购物车","支付","第三方登录","分享"
  List<Widget> allWidget = [
    // PhoneOneKeyLoginPage(),
    // HomePage(),
    // ScrollListPage(),
    // PopViewPages(),
    // SelectPages(),
    // HomeSearch(),
    // TabPages(),
    // BorderPages(),
    // TextFieldPages()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        backgroundColor: Colours.app_main,
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text(
          "首页",
          style: TextStyles.textSize16,
        ),
      ),
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Gaps.line,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              splashColor: Colours.dark_text_disabled,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeDetailPage();
                    },
                  ),
                );
              },
              child: Container(
                color: Colours.material_bg,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  title: Text(
                    "病例$index",
                    style: TextStyles.text,
                  ),
                  trailing: Icon(
                    Icons.navigate_next_outlined,
                    color: Colours.text,
                  ),

                ),
              ),
            );
          }),
    );
  }
}
