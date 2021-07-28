import 'package:foods_store_app/widgets/Layout/state_layout.dart';
import 'package:flutter/material.dart';
import 'package:foods_store_app/widgets/my_app_bar.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        centerTitle: '页面不存在',
      ),
      body: StateLayout(
        type: StateType.message,
        hintText: 'Page does not exist',
      ),
    );
  }
}
