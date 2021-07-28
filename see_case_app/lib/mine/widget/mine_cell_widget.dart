import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/image_utils.dart';
import 'package:foods_store_app/widgets/my_card.dart';


class MineCellWidget extends StatelessWidget {
  String title;
  bool ? isSwitch;

  MineCellWidget(this.title, {this.isSwitch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: MyCard(
          child: Row(
        children: [
          Expanded(
              child: ListTile(
            title: Text(
              "${title}",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil.getScaleSp(context, Dimens.font_sp14),
                  color: Colours.text),
            ),
          )),
          this.isSwitch == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(
                    right: 0,
                  ),
                  child: GestureDetector(
                    child: CircleAvatar(
                        radius: 16.0,
                        backgroundImage: ImageUtils.getAssetImage("photo")),
                  ),
                ),
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: Icon(Icons.navigate_next),
          )
        ],
      )),
    );
  }
}
