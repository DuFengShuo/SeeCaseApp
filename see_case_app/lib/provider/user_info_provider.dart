
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:foods_store_app/common/common.dart';
import 'package:foods_store_app/provider/user_info_model.dart';

class UserInfoProvider extends ChangeNotifier {
  UserInfoModel? _userInfoModel;
  UserInfoModel? get userInfoModel => _userInfoModel;

  Future setUserInfoModel(UserInfoModel? userInfoModel) async {
    _userInfoModel = userInfoModel;
    if (userInfoModel != null) {
      await SpUtil.putBool(Constant.isLogin, true);
      if (userInfoModel.meta != null &&
          userInfoModel.meta?.accessToken != null) {
        await SpUtil.putString(Constant.accessToken,
            '${userInfoModel.meta?.tokenType} ${userInfoModel.meta?.accessToken}');
      }
    }
    refresh();
  }

  Future logOut() async {
    await setUserInfoModel(null);
    await SpUtil.putBool(Constant.isLogin, false);
    await SpUtil.putString(Constant.accessToken, '');
    refresh();
  }

  void updateUserFavoriteCount(int? count) {
    if (userInfoModel != null) {
      userInfoModel?.favoriteCount = count;
      refresh();
    }
  }

  void refresh() {
    notifyListeners();
  }
}
