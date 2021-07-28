import 'package:flutter/material.dart';
import 'package:foods_store_app/goods_car/widget/good_car_cell.dart';
import 'package:foods_store_app/menu_list/widget/goods_add_cell.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/cancel_over_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foods_store_app/util/screen_utils.dart';
import 'package:foods_store_app/widgets/my_button.dart';

class GoodsCarPage extends StatefulWidget {
  const GoodsCarPage({Key? key}) : super(key: key);

  @override
  _GoodsCarPageState createState() => _GoodsCarPageState();
}

class _GoodsCarPageState extends State<GoodsCarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colours.material_bg,
        title: Text("购物车",style: TextStyles.textBold16.copyWith(fontWeight: FontWeight.w500),) ,
        actions: [
          IconButton(onPressed: (){

          }, icon:  Text("全选",style: TextStyles.textSize12,),)

        ],
      ),
      body:
      Stack(
        children: [
          ScrollConfiguration(
              behavior: OverScrollBehavior(),
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.h,bottom: 70.h),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return GoodCarCellWidget();
                  })),
          Positioned(
              bottom: 0,
              child: Container(
                  width: Screen.width(context),
                  // color: Colours.material_bg,
                  decoration: BoxDecoration(
                      color: Colours.material_bg,
                      border:
                      Border(top: BorderSide(color: Colours.line, width: 1))),
                  height: 50.h,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Gaps.hGap10,
                      Gaps.hGap10,
                      Text("￥ 3233",style: TextStyles.textSize16.copyWith(color: Colours.app_main),),
                      Expanded(child: Gaps.empty),

                      MyButton(
                        minHeight: 36.h,
                        minWidth: 80.w,
                        fontSize: 14,
                        radius: 40.r,
                        textColor: Colours.material_bg,
                        onPressed: () {},
                        backgroundColor: Colours.app_main,
                        text: "结算",
                      ),

                      Gaps.hGap20,
                    ],
                  )))

        ],
      )

    );
  }
}
