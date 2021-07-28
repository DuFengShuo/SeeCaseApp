import 'package:flutter/material.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/theme_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'Layout/state_layout.dart';

/// 封装下拉刷新与加载更多
class DeerListView extends StatefulWidget {
  const DeerListView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.onRefresh,
    this.loadMore,
    this.hasMore = false,
    this.stateType = StateType.empty,
    this.pageSize = 20,
    this.childLayout = Gaps.empty,
  }) : super(key: key);

  final RefreshCallback? onRefresh;
  final LoadMoreCallback? loadMore;
  final int itemCount;
  final bool hasMore;
  final IndexedWidgetBuilder itemBuilder;
  final StateType stateType;
  final Widget childLayout;

  /// 一页的数量，默认为20
  final int pageSize;

  @override
  _DeerListViewState createState() => _DeerListViewState();
}

typedef RefreshCallback = Future<void> Function();
typedef LoadMoreCallback = Future<void> Function();

class _DeerListViewState extends State<DeerListView> {
  /// 是否正在加载数据
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: SafeArea(
        child: widget.itemCount == 0
            ? (widget.childLayout != Gaps.empty
                ? widget.childLayout
                : StateLayout(
                    type: widget.stateType, onRefresh: widget.onRefresh))
            : EasyRefresh.custom(
                header: BallPulseHeader(
                  color: Colours.app_main,
                ),
                footer: BallPulseFooter(
                  color: Colours.app_main,
                ),
                onRefresh: widget.onRefresh,
                onLoad: widget.itemCount % widget.pageSize > 0
                    ? null
                    : () async {
                        await _loadMore();
                      },
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        /// 不需要加载更多则不需要添加FootView
                        if (widget.loadMore == null) {
                          return widget.itemBuilder(context, index);
                        } else {
                          return index < widget.itemCount
                              ? widget.itemBuilder(context, index)
                              : MoreWidget(
                                  itemCount: widget.itemCount,
                                  hasMore: widget.hasMore,
                                  pageSize: widget.pageSize);
                        }
                      },
                      childCount: widget.loadMore == null
                          ? widget.itemCount
                          : widget.itemCount + 1,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _loadMore() async {
    if (widget.loadMore == null) {
      return;
    }
    if (_isLoading) {
      return;
    }
    if (!widget.hasMore) {
      return;
    }
    _isLoading = true;
    await widget.loadMore!();
    _isLoading = false;
  }
}

class MoreWidget extends StatelessWidget {
  const MoreWidget(
      {Key? key,
      required this.itemCount,
      required this.hasMore,
      required this.pageSize})
      : super(key: key);
  final int itemCount;
  final bool hasMore;
  final int pageSize;
  @override
  Widget build(BuildContext context) {
    final TextStyle style = context.isDark
        ? TextStyles.textGray14
        : const TextStyle(color: Color(0x8A000000));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // if (hasMore) const CupertinoActivityIndicator(),
          // if (hasMore) Gaps.hGap5,

          /// 只有一页的时候，就不显示FooterView了
          Text(
              hasMore
                  ? ''
                  : (itemCount % pageSize > 0
                      ? 'Oops, no more information!'
                      : ''),
              style: style),
        ],
      ),
    );
  }
}
