import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:foods_store_app/home/page/activity_page.dart';
import 'package:foods_store_app/home/page/tj_page.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/image_utils.dart';
import 'package:foods_store_app/util/screen_utils.dart';
import 'package:foods_store_app/widgets/my_card.dart';

class HomeRootPage extends StatefulWidget {
  const HomeRootPage({Key? key}) : super(key: key);

  @override
  _HomeRootPageState createState() => _HomeRootPageState();
}

class _HomeRootPageState extends State<HomeRootPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController nestScroll;
  List<String> contentTabData = [
    "推荐",
    "上新",
    "活动",
    "周边",
  ];
  List allImage = [
    "https://yanxuan-item.nosdn.127.net/feefe540760f3f43cc3d1a7e65f846d9.png",
    "https://yanxuan-item.nosdn.127.net/8ba0a652e6162164ae83a22fcd35cd8e.png",
    "https://yanxuan-item.nosdn.127.net/705b982786502787db9592fa6014c627.png",
    "https://yanxuan-item.nosdn.127.net/e720ee099ad7edb39c0b5507a105c7a0.png"
  ];
  List <Widget>allTabWidget= [
   TjPage(),
   ActivityPage(),
    ActivityPage(),
    ActivityPage()
  ];
  FlexibleSpaceBar buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      centerTitle: true,
      background: Container(
          color: Colours.bg_color,
          margin: EdgeInsets.only(bottom: 2.h),
          //去除底部线条
          // decoration: BoxDecoration(
          //   // color: Colours.material_bg,
          //   image: DecorationImage(
          //     image: NetworkImage(
          //         "https://yanxuan-item.nosdn.127.net/922390c8fc1e6a619c2a1c1196ac4856.png"),
          //     //背景图片
          //     fit: BoxFit.cover,
          //   ),
          // ),
          height: 320.h,
          child: Stack(
            children: [
              Container(
                // margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: const Color(0xffDDDDDD),
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0,
                          spreadRadius: 0.0),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r))),
                height: 320.h,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0.r),

                        ///图片顶部圆角
                        child: Image(
                          fit: BoxFit.cover,
                          image: ImageUtils.getImageProvider(
                              "${allImage[index]}",
                              holderImg: "state/company"),
                        ));
                  },
                  itemCount: allImage.length,
                  autoplay: true, //

                  pagination: new SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                    color: Colours.text_gray_c,
                    activeColor: Colours.app_main,
                  )),
                  // viewportFraction: 0.9,
                  //scale: 0.6,
                ),
              ),
              Positioned(
                  top: 230.h,
                  left: 10.w,
                  right: 10.w,
                  bottom: 54.h,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: const Color(0xffDDDDDD),
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0,
                              spreadRadius: 0.0),
                        ],
                        color: Colours.material_bg,
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: Container(
                        margin: EdgeInsets.all(10.h),
                        color: Colours.material_bg,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    // Gaps.vGap20,
                                    Icon(
                                      Icons.face,
                                    ),
                                    Gaps.vGap5,
                                    Text("门店吃", style: TextStyles.textBold20)
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  width: 1,
                                  height: 100.h,
                                  color: Colours.bg_gray,
                                ),
                                Column(
                                  children: [
                                    // Gaps.vGap20,
                                    Icon(Icons.pedal_bike),
                                    Gaps.vGap5,
                                    Text(
                                      "外卖",
                                      style: TextStyles.textBold20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: Screen.width(context),
                              height: 1,
                              color: Colours.bg_gray,
                            ),
                            Gaps.vGap12,
                            Row(
                              children: [
                                Gaps.hGap10,
                                Icon(Icons.people_outline),
                                Gaps.hGap10,
                                Text(
                                  "好友拼单",
                                  style: TextStyles.text,
                                ),
                                Expanded(child: Container()),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Text(
                                    "一起拼个单,更划算",
                                    style: TextStyles.textSize10.copyWith(
                                        color: Colours.dark_text_gray),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.navigate_next,
                                    size: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  )),
            ],
          )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController =
        new TabController(length: contentTabData.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colours.app_main,
      //   brightness: Brightness.dark,
      //   centerTitle: true,
      //   elevation: 0,
      //   title: Text(
      //     "首页",
      //     style: TextStyles.textSize16,
      //   ),
      // ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool b) {
            return [
              SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  ///是否随着滑动隐藏标题
                  floating: true,
                  // snap: true,
                  forceElevated: true,
                  backgroundColor: Colours.material_bg,
                  ///SliverAppBar展开的高度
                  expandedHeight: 420.h,
                  flexibleSpace: buildFlexibleSpaceBar(),
                  elevation: 0.3,
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(50.h),
                      child: Container(
                        width: Screen.width(context),
                        color: Colours.material_bg,
                        child: TabBar(
                            automaticIndicatorColorAdjustment: false,
                            labelPadding: EdgeInsets.only(left: 15.w),
                            controller: tabController,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            unselectedLabelColor: Colours.dark_text_gray,
                            labelColor: Colours.app_main,
                            isScrollable: true,
                            unselectedLabelStyle: TextStyles.textSize14,
                            labelStyle: TextStyles.textBold18,
                            onTap: (value) {
                              print("点了第$value个");
                            },
                            tabs: contentTabData
                                .map((e) => Tab(text: "$e"))
                                .toList()),
                      ))),
            ];
          },

          ///主体部分
          body: TabBarView(
            controller: tabController,
            children:allTabWidget,
          )),
    );
  }
}
