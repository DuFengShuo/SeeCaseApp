import 'package:foods_store_app/widgets/icon_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/theme_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 搜索页的AppBar
class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({
    Key? key,
    this.hintText = '',
    this.backImg = 'assets/images/ic_back_black.png',
    this.onPressed,
    this.onChanged,
    this.searchValue = '',
  }) : super(key: key);

  final String backImg;
  final String hintText;
  final Function(String)? onPressed;
  final Function(String)? onChanged; //监听输入框
  final String searchValue;
  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  @override
  void initState() {
    _controller.text = widget.searchValue;
    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;
    final Color iconColor =
        isDark ? Colours.dark_text_gray : Colours.text_gray_c;

    final Widget back = Semantics(
      label: '返回',
      child: SizedBox(
        width: 40.0.w,
        height: 40.0.h,
        child: InkWell(
          onTap: () {
            _focus.unfocus();
            Navigator.maybePop(context);
          },
          borderRadius: BorderRadius.circular(24.0.w),
          child: Padding(
            key: const Key('search_back'),
            padding: EdgeInsets.all(12.0.w),
            child: Image.asset(
              widget.backImg,
              color: isDark ? Colours.dark_text : Colours.text,
            ),
          ),
        ),
      ),
    );

    final Widget textField = Expanded(
      child: Container(
        height: 32.0.h,
        decoration: BoxDecoration(
          color: isDark ? Colours.dark_material_bg : Colours.bg_gray,
          borderRadius: BorderRadius.circular(4.0.w),
        ),
        child: TextField(
          key: const Key('search_text_field'),
//          autofocus: true,
          controller: _controller,
          focusNode: _focus,
          maxLines: 1,
          textInputAction: TextInputAction.search,
          onChanged: widget.onChanged,
          onSubmitted: (String val) {
            _focus.unfocus();
            // 点击软键盘的动作按钮时的回调
            widget.onPressed?.call(val);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                top: 0.0, left: -8.0.w, right: -16.0.w, bottom: 10.0.h),
            border: InputBorder.none,
            icon: Padding(
                padding:
                    EdgeInsets.only(top: 10.0.h, bottom: 8.0.h, left: 8.0.w),
                child: IconFont(name: 0xe60b, size: 14.sp, color: iconColor)),
            hintText: widget.hintText,
          ),
        ),
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Material(
        color: context.backgroundColor,
        child: SafeArea(
          child: Row(
            children: <Widget>[
              back,
              textField,
              Gaps.hGap16,
            ],
          ),
        ),
      ),
    );
  }
}
