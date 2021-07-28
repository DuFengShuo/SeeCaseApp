import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/image_utils.dart';

class SwipterWidget extends StatefulWidget {
  final height;
  final List? allDatas;
  final double? radius;
  const SwipterWidget({Key? key, this.height, this.allDatas,this.radius}) : super(key: key);

  @override
  _SwipterWidgetState createState() => _SwipterWidgetState();
}

class _SwipterWidgetState extends State<SwipterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(widget.radius!.r),
              ///图片顶部圆角
              child: Image(
                fit: BoxFit.cover,
                image: ImageUtils.getImageProvider(
                    "${widget.allDatas![index]}",
                    holderImg: "state/company"),
              ));
        },
        itemCount: widget.allDatas!.length,
        autoplay: true, //
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colours.text_gray_c,
              activeColor: Colours.app_main,
            )),
        // viewportFraction: 0.9,
        //scale: 0.6,
      ),

    );
  }
}
