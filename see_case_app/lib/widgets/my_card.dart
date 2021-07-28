import 'package:flutter/material.dart';
import 'package:foods_store_app/res/colors.dart';
import 'package:foods_store_app/util/theme_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.child, this.color, this.shadowColor})
      : super(key: key);

  final Widget child;
  final Color? color;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;

    final Color _backgroundColor =
        color ?? (isDark ? Colours.dark_bg_gray_ : Colors.white);
    final Color _shadowColor =
        isDark ? Colors.transparent : (shadowColor ?? const Color(0xffDDDDDD));

    return DecoratedBox(
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(8.0.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colours.bg_color,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.8,
              spreadRadius: 0.0),
        ],
      ),
      child: child,
    );
  }
}
