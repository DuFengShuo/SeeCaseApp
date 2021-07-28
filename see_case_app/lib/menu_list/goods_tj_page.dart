import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:foods_store_app/menu_list/widget/goods_add_cell.dart';
import 'package:foods_store_app/res/colors.dart';
import 'package:foods_store_app/res/gaps.dart';
import 'package:foods_store_app/util/image_utils.dart';
import 'package:foods_store_app/widgets/my_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GoodsTjPage extends StatefulWidget {
  const GoodsTjPage({Key? key}) : super(key: key);

  @override
  _GoodsTjPageState createState() => _GoodsTjPageState();
}

class _GoodsTjPageState extends State<GoodsTjPage> {
  //"https://yanxuan-item.nosdn.127.net/753a65fa300eec25311a2321b6ab80ad.jpg"
//   https://yanxuan-item.nosdn.127.net/feefe540760f3f43cc3d1a7e65f846d9.png
// https://yanxuan-item.nosdn.127.net/fcc2507217e199659b3dcf44bb668126.png
// https://yanxuan-item.nosdn.127.net/8ba0a652e6162164ae83a22fcd35cd8e.png
// https://yanxuan-item.nosdn.127.net/705b982786502787db9592fa6014c627.png
// https://yanxuan-item.nosdn.127.net/e720ee099ad7edb39c0b5507a105c7a0.png
// https://yanxuan-item.nosdn.127.net/d89e0e63259a5c158ba8f0aad8fe8cd3.png
// https://yanxuan-item.nosdn.127.net/0208c55d700511db8f1ffd7fe007adbe.jpg
// https://yanxuan-item.nosdn.127.net/829b405db3f207f0f91224bb9bff4c31.png
// https://yanxuan-item.nosdn.127.net/745359b1527e6133004d398afcd9d567.png
// https://yanxuan-item.nosdn.127.net/6b9719ba5c87eececa15389cfd5e6b49.png
// https://yanxuan-item.nosdn.127.net/e5830332fdc0eaec9fc31d7a71072fea.png
// https://yanxuan-item.nosdn.127.net/ecb89844b990a86aea31b264ba10ca68.png
// https://yanxuan-item.nosdn.127.net/519762c7bb30c72faaa1caf50e1ab92e.png
// https://yanxuan-item.nosdn.127.net/4b4d2b89cad3417135b46976b7de0123.png
// https://yanxuan-item.nosdn.127.net/922390c8fc1e6a619c2a1c1196ac4856.png
 List allImage = [
   "https://yanxuan-item.nosdn.127.net/feefe540760f3f43cc3d1a7e65f846d9.png",
   "https://yanxuan-item.nosdn.127.net/8ba0a652e6162164ae83a22fcd35cd8e.png",
   "https://yanxuan-item.nosdn.127.net/705b982786502787db9592fa6014c627.png",
   "https://yanxuan-item.nosdn.127.net/e720ee099ad7edb39c0b5507a105c7a0.png"
 ];

  @override
  Widget build(BuildContext context) {
    return
      ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 10.h,left: 10.w,right: 10.w),
            child: MyCard(
              color: Colours.material_bg,
              // margin: EdgeInsets.all(10),
              // height: 180,
              child: Container(
                // margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.r))
                ),
                height: 180.h,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0.r),

                    ///图片顶部圆角
                    child:Image(
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
                       )
                   ),
                  // viewportFraction: 0.9,
                  //scale: 0.6,
                ),
              ),
            ),
          ),
          Gaps.vGap10,
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 12,
            itemBuilder: (BuildContext context, int index){
              return GoodAddCellWidget();
            })
        ],
      );

  }
}
