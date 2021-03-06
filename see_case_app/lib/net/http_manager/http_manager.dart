import 'dart:async';
import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foods_store_app/net/http_manager/response_data.dart';
import 'package:foods_store_app/res/colors.dart';
import 'package:foods_store_app/res/resources.dart';
import 'package:foods_store_app/util/user_config.dart';


class HttpManager {
  static Future<ResponseData> request(
    //TODO GET和POST添加静态
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? postParams,
    dynamic postData,
    String? accept,
    int? sendTimeout,
    int? receiveTimeout,
    RequestCancelToken? cancelToken,
    bool? needToastMessage,
    bool? needAuthentication,
    bool? needCommonParameters,
    bool? needCommonHeaders,
    bool? showProgress,
    SignatureCondition? signatureCondition, // 签名条件
  }) async {
    print('showProgress = $showProgress');
    // get native data
    cancelToken = cancelToken ?? RequestCancelToken();
    headers = headers ?? Map();
    queryParameters = queryParameters ?? Map();
    sendTimeout = sendTimeout ?? 15000;
    receiveTimeout = receiveTimeout ?? 15000;

    // if (accept != null) {
    //   postHeader['accept'] = 'application/json, text/javascript, */*; q=0.01';
    //   postHeader['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
    // } else {
    //   postHeader['Content-Type'] =
    //   'application/x-www-form-urlencoded; charset=UTF-8';
    // }

    if (needCommonParameters ?? false) {
      queryParameters.addAll(commonParameters());
    }

    if (needCommonHeaders ?? true) {
      headers.addAll(commonHeaders());
    }
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      if (showProgress ?? true) {
        BotToast.showLoading(clickClose: true);
      }
      print("----------------------- 请求数据 -----------------------\n");
      print("method = ${options.method.toString()}");
      print("url = ${options.uri.toString()}");
      print("headers = ${options.headers}");
      print("params = ${options.queryParameters}");
      print("body = ${options.data}");

      handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      if (showProgress ?? true) {
        BotToast.closeAllLoading();
      }
      print("----------------------- 响应开始 -----------------------\n");
      print("code = ${response.statusCode}");
      print("data = ${json.encode(response.data)}");
      LogUtil.v("data = ${json.encode(response.data)}"); //打印长Log
      handler.next(response);
      print("----------------------- 响应结束 -----------------------\n");
    }, onError: (DioError e, ErrorInterceptorHandler handler) {
      if (showProgress ?? true) {
        BotToast.closeAllLoading();
      }
      print("-----------------------错误响应数据 -----------------------\n");
      print("type = ${e.type}");
      if (e.type == DioErrorType.other) {
        BotToast.showSimpleNotification(
            title: "请检查网络是否连接",
            backgroundColor: Colours.app_main,
            titleStyle: TextStyles.textWhite14,
            closeIcon: Icon(
              Icons.cancel,
              color: Colours.material_bg,
            ));
      }
      print("message = ${e.message}");
      print("stackTrace = ${e.message}");
      print("\n");
      handler.next(e);
    }));

    ///注意代理必须配置到await dio.request之后，否则不打开抓包工具时无法访问网络

    Options options = Options(
      method: method,
      headers: headers,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
    );
    try {
      Response response = await dio.request(
        path,
        data: postData ?? postParams,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken.cancelToken,
      );
      if (response.data != null) {
        return ResponseData.convertData(response);
      } else {
        return Future.value(ResponseData());
      }
    } on DioError catch (e) {
      // BotToast.showText(text: '请求失败，请稍后重试');
      return Future.value(ResponseData());
    }
  }

  static Future<ResponseData> post(
    path, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? params,
    Map<String, dynamic>? postParams,
    int? sendTimeout, // 毫秒
    int? receiveTimeout, // 毫秒
    RequestCancelToken? cancelToken, // 取消网络请求的Token
    bool? needToastMessage,
    bool? needAuthentication,
    bool? needCommonParameters,
    bool? needCommonHeaders,
    String? accept,
    dynamic postData,
    bool showProgress = false,
    SignatureCondition? signatureCondition, // 签名条件
  }) {
    return HttpManager.request(
      path,
      queryParameters: params,
      postParams: postParams,
      postData: postData,
      method: 'POST',
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      cancelToken: cancelToken,
      needToastMessage: needToastMessage,
      needAuthentication: needAuthentication,
      needCommonParameters: needCommonParameters,
      needCommonHeaders: needCommonHeaders,
      accept: accept,
      showProgress: showProgress,
      signatureCondition: signatureCondition,
    );
  }

  static Future<ResponseData> get(
    path, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? params,
    int? sendTimeout, // 毫秒
    int? receiveTimeout, // 毫秒
    RequestCancelToken? cancelToken, // 取消网络请求的Token
    bool? needToastMessage,
    bool? needAuthentication,
    bool? needCommonParameters,
    bool? needCommonHeaders,
    String? accept,
    bool showProgress = false,
    SignatureCondition? signatureCondition, // 签名条件
  }) {
    return HttpManager.request(
      path,
      queryParameters: params,
      method: 'GET',
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      cancelToken: cancelToken,
      needToastMessage: needToastMessage,
      needAuthentication: needAuthentication,
      needCommonParameters: needCommonParameters,
      needCommonHeaders: needCommonHeaders,
      accept: accept,
      showProgress: showProgress,
      signatureCondition: signatureCondition,
    );
  }

  static Map<String, dynamic> commonParameters() {
    Map<String, dynamic> parameters = {
      "csrf_token": csrf_token,
      "__timestamp": "${DateTime.now().millisecondsSinceEpoch}"
    };
    return parameters;
  }

  static Map<String, dynamic> commonHeaders() {
    Map<String, dynamic> headers = {"Cookie": cookie};
    return headers;
  }

  static Map<String, dynamic> authenticationHeader() {
    Map<String, dynamic> auth = {'auth': 'auth'};
    return auth;
  }

  static Future<Map<String, dynamic>> signatureHeader() async {
    Map<String, dynamic> headers = {};
    return headers;
  }
}

class RequestCancelToken {
  CancelToken _cancelToken = CancelToken();

  RequestCancelToken() : _cancelToken = CancelToken();

  CancelToken get cancelToken => _cancelToken;

  void cancel() {
    _cancelToken.cancel('App取消HTTP请求');
  }
}

class SignatureCondition {
  bool needSign = false;
  String originalSuffix = '';

  SignatureCondition({
    required this.needSign,
    required this.originalSuffix,
  });
}
