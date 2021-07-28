import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/widgets/my_card.dart';

import 'package:provider/provider.dart';

class ChangeThemePage extends StatefulWidget {
  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  List<Color> colorList = [
    Colors.teal,
    Colors.yellow,
    Colors.amber,
    Colors.deepOrange,
    Colors.blue,
    Colors.deepPurple,
    Colors.pink,
    Colors.brown,
  ]; //必须是MaterialColor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("修改主题色",style: TextStyles.textSize16,),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(top: 5),
           // scrollDirection: Axis.horizontal, //水平方向
            itemCount: colorList.length,
            itemBuilder: (BuildContext context, int index) {
              return
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
                  child: GestureDetector(
                    // onTap: ()=>
                    //     Provider.of<ThemeModel>(context, listen: false)
                    //         .changeThemeColor(colorList[index]), //修改主题色,
                    child: MyCard(
                      child: Container(
                        decoration: BoxDecoration(//背景装饰
                            borderRadius: BorderRadius.circular(8.0),
                          color: colorList[index],
                        ),
                        height: 60,

                      ),
                    ),
                  )
                );
              //   InkWell(
              // //  radius: 1,
              //   borderRadius: BorderRadius.circular(80),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              //     child: Card(
              //
              //       child: Container(
              //         width: 60,
              //         height: 60,
              //         color: colorList[index],
              //       ),
              //     ),
              //   ),
              //   onTap: () {
              //     Provider.of<ThemeModel>(context, listen: false)
              //         .changeThemeColor(colorList[index]); //修改主题色
              //   },
              // );
            }));
  }
}
