import 'package:flutter/foundation.dart';

class Constant {
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction = kReleaseMode;

  ///总api
  static const String baseUrl =
      inProduction ? testUrl : debugUrl; //release包时为true
  static const String debugUrl = 'http://172.31.3.209:8001/api/'; //开发环境
  static const String testUrl = 'http://172.31.3.209:8003/api/'; //测试环境
  static const String mastOnLineUrl = 'http://pre.api.myflashinfo.com/'; //预发布
  static const String onLineUrl = 'https://api.myflashinfo.com/'; //线上环境

  ///是否对数据加密 kReleaseMode
  static const bool acceptDebug = inProduction; //线上环境必须加密

  ///数据加密KEY
  static const String dataKey = '5vA6au7Z';

  ///是否登录状态
  static const String isLogin = 'isLogin';

  ///是否同意协议
  static const String checkboxSelected = 'checkboxSelected';

  static bool isDriverTest = false;
  static bool isUnitTest = false;

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';

  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';
  static const String email = 'email';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static const String theme = 'AppTheme';
  static const String locale = 'locale';

  ///缓存
  static const String initialize = 'initialize'; //初始化数据
  static const String localList = 'localList'; //搜索历史记录
  static const String newsDashboard = 'newsDashboard'; //Dashboard新闻数据
  static const String recommendDashboard =
      'recommendDashboard'; //Dashboard推荐公司数据

  static const String linkedInRedirectUrl =
      'http://www.flashinfoapi.com/social/linkedin/authorization';
  static const String linkedInClientId = '788qplfq00tyjg';
  static const String linkedInClientSecret = 'GigsjQR3vTVTRCqQ';
}
