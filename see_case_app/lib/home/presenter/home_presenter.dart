//
// import 'package:flustars/flustars.dart';
// import 'package:flutter/material.dart';
// import 'package:foods_store_app/common/common.dart';
// import 'package:foods_store_app/home/model/initialize_model.dart';
// import 'package:foods_store_app/mvp/base_page_presenter.dart';
// import 'package:foods_store_app/mvp/mvps.dart';
// import 'package:foods_store_app/net/dio_utils.dart';
// import 'package:foods_store_app/net/net.dart';
// import 'package:provider/provider.dart';
//
// class HomePresenter extends BasePagePresenter<IMvpView> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       getInit();
//       final String? accessToken = SpUtil.getString(Constant.accessToken);
//       if (accessToken != null && accessToken.isNotEmpty) {
//         getUserInfo();
//       }
//     });
//   }
//
//   // // 获取用户信息
//   // Future getInit() async {
//   //   return requestNetwork<InitializeModel>(Method.get,
//   //       url: HttpApi.init,
//   //       isShow: false, onSuccess: (InitializeModel? model) async {
//   //     if (model != null) {
//   //       view.getContext().read<CommonProvider>().setInitializeModel(model);
//   //       await SpUtil.putObject(Constant.initialize, model);
//   //       if (model.newsbean != null && model.newsbean?.news != null) {
//   //         await SpUtil.putObject(Constant.newsDashboard, model.newsbean!);
//   //       }
//   //     }
//   //   });
//   // }
//   //
//   // // 获取用户信息
//   // Future getUserInfo() async {
//   //   return requestNetwork<UserInfoModel>(Method.get,
//   //       url: HttpApi.userInfo,
//   //       isShow: false, onSuccess: (UserInfoModel? model) {
//   //     if (model != null) {
//   //       view.getContext().read<UserInfoProvider>().setUserInfoModel(model);
//   //     }
//   //   });
//   // }
// }
