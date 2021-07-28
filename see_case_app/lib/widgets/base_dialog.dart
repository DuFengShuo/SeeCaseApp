import 'package:foods_store_app/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/routers/fluro_navigator.dart';
import 'package:foods_store_app/util/device_utils.dart';
import 'package:foods_store_app/widgets/my_button.dart';
import 'package:foods_store_app/util/screen_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 自定义dialog的模板
class BaseDialog extends StatelessWidget {
  const BaseDialog(
      {Key? key,
      this.title,
      this.onPressed,
      this.hiddenTitle = false,
      required this.child})
      : super(key: key);

  final String? title;
  final VoidCallback? onPressed;
  final Widget child;
  final bool hiddenTitle;

  @override
  Widget build(BuildContext context) {
    final Widget dialogTitle = Visibility(
      visible: !hiddenTitle,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colours.bg_color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w), topRight: Radius.circular(16.w)),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.gap_dp20, vertical: Dimens.font_sp15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hiddenTitle ? '' : title ?? '',
              style:
                  TextStyles.textBold14.copyWith(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => NavigatorUtils.goBack(context),
              child: SizedBox(
                width: Dimens.gap_dp20,
                height: Dimens.gap_v_dp20,
                child: LoadAssetImage(
                  'login/qyg_shop_icon_delete',
                  width: 14.0.w,
                  height: 30.0.h,
                ),
              ),
            )
          ],
        ),
      ),
    );

    final Widget bottomButton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _DialogButton(
          text: 'Cancel',
          textColor: Colours.material_bg,
          backgroundColor: Colours.text_gray_c,
          onPressed: () => NavigatorUtils.goBack(context),
        ),
        _DialogButton(
          text: 'Done',
          textColor: Colours.material_bg,
          onPressed: onPressed,
        ),
      ],
    );

    final Widget content = Material(
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          dialogTitle,
          Flexible(child: child),
          Gaps.vGap8,
          Gaps.line,
          bottomButton,
          Gaps.vGap15,
        ],
      ),
    );

    final Widget body = MediaQuery.removeViewInsets(
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      context: context,
      child: Center(
        child: SizedBox(
          width: context.width - 80.w,
          child: content,
        ),
      ),
    );

    /// Android 11添加了键盘弹出动画，这与我添加的过渡动画冲突（原先iOS、Android 没有相关过渡动画，相关问题跟踪：https://github.com/flutter/flutter/issues/19279）。
    /// 因为在Android 11上，viewInsets的值在键盘弹出过程中是变化的（以前只有开始结束的值）。
    /// 所以解决方法就是在Android 11及以上系统中使用Padding代替AnimatedPadding。

    if (Device.getAndroidSdkInt() >= 30) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: body,
      );
    } else {
      return AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeInCubic, // easeOutQuad
        child: body,
      );
    }
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    Key? key,
    required this.text,
    this.textColor,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 25.h,
      child: MyButton(
        text: text,
        fontSize: Dimens.font_sp10,
        backgroundColor: backgroundColor,
        textColor: textColor,
        onPressed: onPressed,
      ),
    );
  }
}
