import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/cancel_over_style.dart';
import 'package:foods_store_app/util/image_utils.dart';
import 'package:foods_store_app/util/screen_utils.dart';
import 'package:foods_store_app/widgets/my_card.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List allImage = [
    "https://yanxuan-item.nosdn.127.net/feefe540760f3f43cc3d1a7e65f846d9.png",
    "https://yanxuan-item.nosdn.127.net/8ba0a652e6162164ae83a22fcd35cd8e.png",
    "https://yanxuan-item.nosdn.127.net/705b982786502787db9592fa6014c627.png",
    "https://yanxuan-item.nosdn.127.net/e720ee099ad7edb39c0b5507a105c7a0.png"
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: OverScrollBehavior(),
    child: ListView.builder(
        padding: EdgeInsets.only(top: 10.h),
        itemCount: allImage.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:  EdgeInsets.only(left: 10.w, right: 10.w,bottom: 10.h ),
            child: MyCard(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                 //   margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                  //  padding: EdgeInsets.only(left: 0),
                    height: 200.h,
                    width: Screen.width(context),
                    color: Colours.bg_gray,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0.r),
                        ///图片顶部圆角
                        child: Image(
                          fit: BoxFit.cover,
                          image: ImageUtils.getImageProvider("${allImage[index]}",
                              holderImg: "state/company"),
                        )),
                  ),
                  // Gaps.vGap8,
                  Padding(
                    padding:  EdgeInsets.all(10.0.h),
                    child: Text(
                      "活动标题,发啥快递发射点发射点发射点发射点发射点方法手动阀手动阀",
                      style: TextStyles.textBold15,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Gaps.vGap10,
                ],
              ),
            ),
          );
        }));
  }
}
