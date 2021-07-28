import 'package:flutter/material.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LeftTablePage extends StatefulWidget {
  // final tabLength;
  // final goodList;

  final Function? callResultBack;
  final ItemPositionsListener? itemPositionsListener;
  const LeftTablePage({Key? key, this.callResultBack,  this.itemPositionsListener}) : super(key: key);

  @override
  _LeftTablePageState createState() => _LeftTablePageState();
}

class _LeftTablePageState extends State<LeftTablePage> {
  int oneIndex = 0; //一级分类下标 记录选中的下表，给选中的样式

  List<String> contentTabData = [
    "推荐",
    "套餐",
    "优惠",
    "主食1",
    "主食2",
    "饮料1",
    "饮料2",
    "小吃1",
    "小吃2",
    "其他"
  ];

  Widget getRow(int i, String title) {
    Color textColor = Colours.app_main; //字体颜色
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //Container下的color属性会与decoration下的border属性冲突，所以要用decoration下的color属性
        decoration: BoxDecoration(
          color: oneIndex == i ? Colors.white : Colours.bg_color,
          border: Border(
            left: BorderSide(
                width: 5,
                color: oneIndex == i
                    ? Colours.app_main
                    : Colours.bg_color),
          ),
        ),
        child: Text(
          "$title",
          style: TextStyle(
            color: oneIndex == i ? textColor : Colours.dark_text_gray,
            fontWeight: oneIndex == i ? FontWeight.w600 : FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ),
      onTap: () async {
        setState(() {
          oneIndex = i; //记录选中的下标
          textColor = Colours.app_main;
        });
        widget.callResultBack!(i); //返回数据

      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return
      ValueListenableBuilder<Iterable<ItemPosition>>(
          valueListenable: widget.itemPositionsListener!.itemPositions,
          builder: (context, positions, child) {

      int min = 0;
      int max;
      if (positions.isNotEmpty) {
        min = positions
            .where((ItemPosition position) => position.itemTrailingEdge > 0)
            .reduce((ItemPosition min, ItemPosition position) =>
        position.itemTrailingEdge < min.itemTrailingEdge
            ? position
            : min)
            .index;
         oneIndex = min;

        // max = positions
        //     .where((ItemPosition position) => position.itemLeadingEdge < 1)
        //     .reduce((ItemPosition max, ItemPosition position) =>
        // position.itemLeadingEdge > max.itemLeadingEdge
        //     ? position
        //     : max)
        //     .index;
      }
      return    ListView.builder(
          itemCount: contentTabData.length,
          itemExtent: 60,
          padding: EdgeInsets.only(bottom: 50),
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            String name = contentTabData[index];
            return getRow(index, name);
          });
          });


  }
}

