import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foods_store_app/home/page/goods_detail_page.dart';

// import 'package:foods_store_app/home/model/itemListItem.dart';
import 'package:foods_store_app/home/widget/tj_cell_widget.dart';
import 'package:foods_store_app/net/http_manager/api.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/cancel_over_style.dart';
import 'package:foods_store_app/util/image_utils.dart';
import 'package:foods_store_app/util/user_config.dart';
import 'package:foods_store_app/widgets/my_button.dart';
import 'package:foods_store_app/widgets/my_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TjPage extends StatefulWidget {
  const TjPage({Key? key}) : super(key: key);

  @override
  _TjPageState createState() => _TjPageState();
}

class _TjPageState extends State<TjPage> {
  late List allDatas = [];

  _getItemList() async {
    Map<String, dynamic> params = {
      "csrf_token": csrf_token,
      "categoryId": 0,
      "subCategoryId": 0,
    };
    var responseData = await hotList(params);
    List dataList = [];
    List data = responseData.data['itemList'];
    data.forEach((element) {
      dataList.add(element);
      print("===${element["listPicUrl"]}");
    });
    setState(() {
      allDatas.addAll(dataList);
    });
    print("==---");
    dataList.forEach((element) {
      print(element.name);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getItemList(); //获取数据
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colours.material_bg,
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: ListView.separated(
              // physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 10.h),
              itemCount: allDatas.length,
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Gaps.line,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                //  ItemListItem model =allDatas[index];
                Map data = allDatas[index];
                return InkWell(
                    splashColor: Colours.dark_text_disabled,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SliverAppBarPage();
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 8.w, bottom: 10.h, right: 8.w),
                      child: Container(
                        // height: 200.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //横轴
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Gaps.vGap10,
                              Row(
                                children: <Widget>[
                                  Gaps.hGap10,
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0.r),
                                    ///图片顶部圆角
                                    child: Container(
                                        height: 110.0.h,
                                        width: 100.w,
                                        padding: EdgeInsets.only(left: 0),
                                        color: Colours.bg_gray,
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: ImageUtils.getImageProvider(
                                              "${data["listPicUrl"]}",
                                              holderImg: "state/company"),
                                        )),
                                  ),
                                  Gaps.hGap5,
                                  Expanded(
                                    child: Container(
                                      height: 120.h,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start, //横轴
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 10.w),
                                            child: Text(
                                              "${data["name"]}",
                                              maxLines: 3,
                                              style: TextStyles.textBold14
                                                  .copyWith(
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.w400),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Gaps.vGap5,
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 10.w),
                                            child: Text(
                                              "${data["simpleDesc"]} ",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyles.textSize10
                                                  .copyWith(
                                                  color: Colours.text_gray),
                                            ),
                                          ),
                                          Gaps.vGap5,
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.w, right: 10.w),
                                                child: Text(
                                                  "￥ ${data["counterPrice"]} ",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyles.textSize16
                                                      .copyWith(
                                                      color: Colours.red),
                                                ),
                                              ),
                                              Expanded(child: Gaps.empty),
                                              Padding(
                                                padding:
                                                EdgeInsets.only(top: 3.h),
                                                child: Container(
                                                    height: 26.h,
                                                    width: 70.w,
                                                    child: MyButton(
                                                      radius: 30,
                                                      fontSize: 10,
                                                      text: "立即购买",
                                                      onPressed: () {},
                                                    )),
                                              ),
                                              Gaps.hGap15,
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w,
                                    top: 15.h,
                                    bottom: 5.h,
                                    right: 10.w),
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: Colours.bg_gray,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.r))),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    // // textBaseline: TextBaseline.ideographic,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Gaps.hGap5,
                                      new CircleAvatar(
                                        radius: 14.0.r,
                                        backgroundColor:
                                        Colours.app_main.withAlpha(40),
                                        backgroundImage: ImageUtils.getImageProvider(
                                            "${data["hotSaleListBottomInfo"] == null ? "" : data["hotSaleListBottomInfo"]["iconUrl"]?.toString()}",
                                            holderImg: "state/company"),
                                      ),
                                      Gaps.hGap10,
                                      Expanded(
                                          child: Text(
                                            "${data["hotSaleListBottomInfo"] == null ? "" : data["hotSaleListBottomInfo"]["content"].toString().length == 0 ? "暂无评论" : data["hotSaleListBottomInfo"]["content"]}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyles.textSize10.copyWith(
                                                color: Colours.dark_text_gray),
                                          )),
                                      Icon(Icons.navigate_next,color: Colours.text_gray_c,),
                                      Gaps.hGap5,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ));
              }),
        ));
  }
}
