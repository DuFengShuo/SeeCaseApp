

import 'package:foods_store_app/common/common.dart';

class BaseEntity<T> {
  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[Constant.code] as int?;
    message = json[Constant.message] as String;
    if (json.containsKey(Constant.data)) {
      data = _generateOBJ<T>(json[Constant.data] as Object);
    }
  }

  int? code;
  late String message;
  T? data;

  T? _generateOBJ<O>(Object json) {
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      /// List类型数据由fromJsonAsT判断处理
      // return JsonConvert.fromJsonAsT<T>(json);
      return _fromJsonAsT(json);
    }
  }

  T? _fromJsonAsT(Object json) {
    switch (T) {
      // case StatusModel:
      //   return StatusModel.fromJson(json as Map<String, dynamic>) as T;
      // case UserInfoModel:
      //   return UserInfoModel.fromJson(json as Map<String, dynamic>) as T;
      // case AreaCodeModel:
      //   return AreaCodeModel.fromJson(json as Map<String, dynamic>) as T;
      // case CaptchaEmailModel:
      //   return CaptchaEmailModel.fromJson(json as Map<String, dynamic>) as T;
      // case CaptchaImgModel:
      //   return CaptchaImgModel.fromJson(json as Map<String, dynamic>) as T;
      // case CaptchaSmsModel:
      //   return CaptchaSmsModel.fromJson(json as Map<String, dynamic>) as T;
      // case RecommendBean:
      //   return RecommendBean.fromJson(json as Map<String, dynamic>) as T;
      // case NewsBean:
      //   return NewsBean.fromJson(json as Map<String, dynamic>) as T;
      // case TagsBean:
      //   return TagsBean.fromJson(json as Map<String, dynamic>) as T;
      // case TagsModel:
      //   return TagsModel.fromJson(json as Map<String, dynamic>) as T;
      // case BrowsingBean:
      //   return BrowsingBean.fromJson(json as Map<String, dynamic>) as T;
      // case ExportBean:
      //   return ExportBean.fromJson(json as Map<String, dynamic>) as T;
      // case InitializeModel:
      //   return InitializeModel.fromJson(json as Map<String, dynamic>) as T;
      // case AutocompleteBean:
      //   return AutocompleteBean.fromJson(json as Map<String, dynamic>) as T;
      // case PeoplesBean:
      //   return PeoplesBean.fromJson(json as Map<String, dynamic>) as T;
      // case ProductsBean:
      //   return ProductsBean.fromJson(json as Map<String, dynamic>) as T;

      default:
    }
  }
}
