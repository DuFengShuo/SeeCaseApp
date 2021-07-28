import 'package:foods_store_app/res/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerTab extends StatelessWidget {
  const ContainerTab(
      {Key? key,
      required this.tabController,
      required this.pageController,
      required this.tabs})
      : super(key: key);
  final List<String> tabs;
  final TabController tabController;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colours.material_bg,
      height: 50.h,
      child: Container(
        margin: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 10.h),
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.gap_dp5, vertical: Dimens.gap_v_dp5),
        decoration: BoxDecoration(
          color: Colours.bg_color,
          borderRadius: BorderRadius.circular(42.r),
        ),
        alignment: Alignment.centerLeft,
        height: 42,
        child: TabBar(
          onTap: (index) {
            pageController.jumpToPage(index);
          },
          controller: tabController,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colours.text_gray,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelStyle: TextStyles.textSize13,
          labelPadding: EdgeInsets.only(left: 0.w),
          indicator: BoxDecoration(
              color: Colours.material_bg,
              borderRadius: BorderRadius.circular(42.r),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colours.bg_color,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 8.0,
                    spreadRadius: 0.0),
              ]),
          labelStyle: TextStyles.text.copyWith(fontWeight: FontWeight.w500),
          tabs: const <Widget>[
            Tab(text: 'Companies'),
            Tab(text: 'Contacts'),
            Tab(text: 'Products'),
          ],
        ),
      ),
    );
  }
}
