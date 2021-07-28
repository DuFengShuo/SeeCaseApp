import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foods_store_app/widgets/my_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
const _url = 'https://inferx.infervision.com/h5/da3336fa-ec69-11eb-8020-02420808150322494/0,4,6,10,12';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({Key? key}) : super(key: key);

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
   // _launchURL();

  }
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(centerTitle: "详情",),
      body:   WebView(
     // initialUrl: 'https://www.baidu.com/',
       initialUrl: "https://inferx.infervision.com/h5/da3336fa-ec69-11eb-8020-02420808150322494/0,4,6,10,12",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {

        },
    ),
    );
  }
}
