import 'package:flutter/material.dart';
import 'package:foods_store_app/mine/widget/mine_cell_widget.dart';
import 'package:foods_store_app/res/resources.dart';


class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final List datas = ["修改头像","清除缓存", "退出登录"];
  String ? _cacheSize;
  String ? isCleanOver;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // 修改contentText参数
    _isCleanOVer(editText) {
      setState(() {
        isCleanOver = editText;
      });
    }
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colours.app_main,
        title: Text(
          "我的",
          style: TextStyles.textSize16,
        ),
        centerTitle: true,
        elevation: 0,
        // actions: [
        //   FlatButton(onPressed: (){}, child: Text("退出登录",style: TextStyle(color: Theme.of(context).accentTextTheme.bodyText1.color),))
        // ],
      ),
      body: ListView.builder(
          itemCount: datas.length,
          itemBuilder: (BuildContext context, int index) {
            return MineCellWidget(
              "${datas[index]}",);
          }),

    );
  }
}
