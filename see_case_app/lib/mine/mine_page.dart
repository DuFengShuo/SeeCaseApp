import 'package:flutter/material.dart';
import 'package:foods_store_app/res/colors.dart';
import 'package:foods_store_app/widgets/my_app_bar.dart';
import 'package:foods_store_app/widgets/my_scroll_view.dart';
class MineRootPage extends StatefulWidget {
  const MineRootPage({Key? key}) : super(key: key);

  @override
  _MineRootPageState createState() => _MineRootPageState();
}

class _MineRootPageState extends State<MineRootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: MyAppBar(centerTitle: "我的",isBack: false,),
      body: MyScrollView(children: [


      ],

      ),
    );
  }
}
