import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foods_store_app/menu_list/goods_tj_page.dart';
import 'package:foods_store_app/menu_list/widget/menu_lift_widget.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/cancel_over_style.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// scrollable_positioned_list: ^0.1.10
const numberOfItems = 3;
const minItemHeight = 100.0;
const maxItemHeight = 1000.0;
const scrollDuration = Duration(milliseconds: 700);
const randomMax = 1 << 32;

class MenuListPage extends StatefulWidget {
  final companyId;

  const MenuListPage({
    Key? key,
    this.companyId,
  }) : super(key: key);

  @override
  _MenuListPageState createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage>
    with SingleTickerProviderStateMixin {
  /// Controller to scroll or jump to a particular item.
  final ItemScrollController itemScrollController = ItemScrollController();

  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  late List<double> itemHeights;
  late List<Color> itemColors;
  bool reversed = false;
  List<Widget> allViews = [
    GoodsTjPage(),
    GoodsTjPage(),
    GoodsTjPage(),
    GoodsTjPage(),
  ];

  /// The alignment to be used next time the user scrolls or jumps to an item.
  double alignment = 0;
  late TabController tabController;
  late ScrollController nestScroll;
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

  FlexibleSpaceBar buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
//                title: Text("FlexibleSpaceBar title"),
      collapseMode: CollapseMode.pin,
      centerTitle: true,
      background: Container(
        color: Colours.material_bg,
        height: 300,
      ),
    );
  }

  int minIndex = 0;

  @override
  void initState() {
    super.initState();
    final heightGenerator = Random(328902348);
    final colorGenerator = Random(42490823);
    itemHeights = List<double>.generate(
        numberOfItems,
        (int _) =>
            heightGenerator.nextDouble() * (maxItemHeight - minItemHeight) +
            minItemHeight);
    itemColors = List<Color>.generate(numberOfItems,
        (int _) => Color(colorGenerator.nextInt(randomMax)).withOpacity(1));
    tabController =
        new TabController(length: contentTabData.length, vsync: this);
    nestScroll = new ScrollController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colours.material_bg,
        title: Container(
            child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colours.text,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "顺河路124号店",
                  style: TextStyles.textBold16.copyWith(color: Colours.text),
                ),
                Text(
                  "距离你900m",
                  style:
                      TextStyles.textSize12.copyWith(color: Colours.text_gray),
                ),
              ],
            ),
            Expanded(child: Container()),
            Text(
              "自取/外卖",
              style: TextStyles.textSize12.copyWith(color: Colours.text_gray),
            ),
            CupertinoSwitch(
                activeColor: Colours.app_main, value: true, onChanged: (v) {})
          ],
        )),
      ),
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: LeftTablePage(
                itemPositionsListener: itemPositionsListener,
                callResultBack: (value) {
                  if (value != null) {
                  //  scrollTo(value);
                    jumpTo(value);
                  }
                },
              )

              // MyTabWidget(
              //   tabDatas: contentTabData,
              //   itemPositionsListener: itemPositionsListener,
              //   callBack: (value) {
              //     if (value != null) {
              //       jumpTo(value);
              //     }
              //   },
              // )
              ),
          Expanded(
              flex: 8,
              child: OrientationBuilder(
                builder: (context, orientation) => list(orientation),
              ))
        ],
      ));

  Widget list(Orientation orientation) => ScrollConfiguration(
      behavior: OverScrollBehavior(),
      child: ScrollablePositionedList.builder(
        itemCount: allViews.length,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => item(index, orientation),
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        reverse: reversed,
        scrollDirection: orientation == Orientation.portrait
            ? Axis.vertical
            : Axis.horizontal,
      ));

  void scrollTo(int index) => itemScrollController.scrollTo(
      index: index,
      duration: scrollDuration,
      curve: Curves.easeInOutCubic,
      alignment: alignment);

  void jumpTo(int index) =>
      itemScrollController.jumpTo(index: index, alignment: alignment);

  /// Generate item number [i].
  Widget item(int i, Orientation orientation) {
    return allViews[i];
  }
}

class MyTabWidget extends StatefulWidget {
  final List? tabDatas;

  final Function? callBack;
  final ItemPositionsListener? itemPositionsListener;

  const MyTabWidget(
      {Key? key, this.tabDatas, this.itemPositionsListener, this.callBack})
      : super(key: key);

  @override
  _MyTabWidgetState createState() => _MyTabWidgetState();
}

class _MyTabWidgetState extends State<MyTabWidget> {
  late ScrollController tableScroll;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tableScroll = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Iterable<ItemPosition>>(
      valueListenable: widget.itemPositionsListener!.itemPositions,
      builder: (context, positions, child) {
        int tabIndex = 0;

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
          tabIndex = min;

          max = positions
              .where((ItemPosition position) => position.itemLeadingEdge < 1)
              .reduce((ItemPosition max, ItemPosition position) =>
                  position.itemLeadingEdge > max.itemLeadingEdge
                      ? position
                      : max)
              .index;
        }
        return Container(
          //  height: 45.h,
          // width: Screen.width(context),
          color: Colours.material_bg,
          child: ListView.builder(
            controller: tableScroll,
            scrollDirection: Axis.vertical,
            itemCount: widget.tabDatas!.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    widget.callBack!(index);
                  },
                  child: Container(
                      color: Colours.material_bg,
                      height: 50.h,
                      width: 200,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 4, bottom: 4),
                            child: Container(
                              width: 2,
                              // height: 20.h,
                              color: min == index
                                  ? Colours.app_main
                                  : Colors.transparent,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Gaps.vGap20,
                                  Container(
                                    child: Text(
                                      "${widget.tabDatas![index]}",
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style: TextStyles.textSize14.copyWith(
                                        color: min == index
                                            ? Colours.app_main
                                            : Colours.text,
                                        fontWeight: min == index
                                            ? FontWeight.w600
                                            : null,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Gaps.line,
                                ],
                              ),
                            ),
                          ),
                        ],
                      )));
            },
          ),
        );
      },
    );
  }
}
