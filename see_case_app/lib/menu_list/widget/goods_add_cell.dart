import 'package:flutter/material.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foods_store_app/util/image_utils.dart';
import 'package:foods_store_app/widgets/my_button.dart';
import 'package:foods_store_app/widgets/my_card.dart';

class GoodAddCellWidget extends StatefulWidget {
  const GoodAddCellWidget({Key? key}) : super(key: key);

  @override
  _GoodAddCellWidgetState createState() => _GoodAddCellWidgetState();
}

class _GoodAddCellWidgetState extends State<GoodAddCellWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        // splashColor: Colours.d,
        onTap: () {},
        child: Padding(
          padding:
          EdgeInsets.only(left: 8.w, bottom: 10.h, right: 8.w),
          child: MyCard(
            color: Colours.material_bg,
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
                                    "https://yanxuan-item.nosdn.127.net/feefe540760f3f43cc3d1a7e65f846d9.png",
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
                                    "商品标题",
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
                                    "商品介绍,两行数据,看看有没有越界,等问题 ",
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
                                        "￥ 0 ",
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
                                          width: 60.w,
                                          child: MyButton(
                                            radius: 30,
                                            fontSize: 10,
                                            minWidth: 60.w,
                                            text: "选规格",
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
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       left: 10.w,
                    //       top: 15.h,
                    //       bottom: 10.h,
                    //       right: 10.w),
                    //   child: Container(
                    //     height: 40.h,
                    //     decoration: BoxDecoration(
                    //         color: Colours.bg_gray,
                    //         borderRadius: BorderRadius.all(
                    //             Radius.circular(40.r))),
                    //     child: Row(
                    //       // crossAxisAlignment: CrossAxisAlignment.center,
                    //       // // textBaseline: TextBaseline.ideographic,
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: <Widget>[
                    //         Gaps.hGap5,
                    //         new CircleAvatar(
                    //           radius: 14.0.r,
                    //           backgroundColor:
                    //           Colours.app_main.withAlpha(40),
                    //           backgroundImage: ImageUtils.getImageProvider(
                    //               "",
                    //               holderImg: "state/company"),
                    //         ),
                    //         Gaps.hGap10,
                    //         Expanded(
                    //             child: Text(
                    //               "${data["hotSaleListBottomInfo"] == null ? "" : data["hotSaleListBottomInfo"]["content"].toString().length == 0 ? "暂无评论" : data["hotSaleListBottomInfo"]["content"]}",
                    //               overflow: TextOverflow.ellipsis,
                    //               maxLines: 2,
                    //               style: TextStyles.textSize10.copyWith(
                    //                   color: Colours.dark_text_gray),
                    //             )),
                    //         Gaps.hGap5,
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Gaps.vGap10,
                  ],
                )),
          ),
        ));
  }
}
