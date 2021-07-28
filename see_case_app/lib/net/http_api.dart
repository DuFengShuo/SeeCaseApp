class HttpApi {
  ///配置
  static const String icons = 'icons'; // 获取icon
  //获取初始化信息
  static const String init = 'init.json';

  /// 登录、注册
  static const String mobileLogin = 'code/mobile/authorization'; // 手机验证码登录
  static const String emailLogin = 'code/email/authorization'; // 手机验证码登录
  static const String login = 'authorization'; // 登录
  static const String visitor = 'authorization/visitor'; // 游客登录
  static const String authorizationImei = 'authorization/imei'; // 游客模式
  static const String appleLogin = 'social/apple'; // 苹果登录
  static const String googleLogin = 'social/google'; // 谷歌登录
  static const String linkedinLogin = 'social/linkedin/authorization'; // 领英登录
  static const String register = 'authorization/register'; // 注册
  static const String emailRegister = 'authorization/email/register'; // 邮箱注册
  static const String refresh = 'authorization/refresh'; // 刷新Access Token
  static const String captchaImage = 'captcha/image'; // 图片验证码
  static const String captchaSms = 'captcha/sms'; // 发送短信
  static const String captchaEmail = 'captcha/email'; // 获取邮箱验证码
  static const String verificationCode = 'verification/code'; //检查验证码
  static const String renewPwd = 'user/renew/pwd'; // 修改密码
  static const String userInfo = 'authorization/current'; // 获取个人信息
  static const String renewAvatar = 'user/renew/avatar'; // 修改头像
  static const String userUpdate = 'user'; // 修改个人信息
  static const String treatyTerms = '/treaty/terms.html'; // 用户协议
  static const String privacyPolicy = '/treaty/privacy_policy.html'; // 隐私协议

  static const String news = 'news'; // 新闻列表
  static const String recommends = 'recommends/company'; // 推荐公司列表

  static const String companyList = 'companys'; // 公司列表
  static const String personalList = 'peoples'; // 个人列表

  /// 搜索
  static const String search = 'search/'; // 全局搜索
  static const String searchCompany = 'search/company/'; // 公司搜索
  static const String searchPeople = 'search/people/'; // 人员搜索
  static const String searchProduct = 'search/product/'; // 产品搜索
  static const String searchLead = 'search/lead/'; // 商机搜索
  static const String searchAutocomplete = 'search/'; // 搜索自动补全

  static const String productsList = 'products'; // 产品列表、详情

  ///收藏列表
  static const String collectsList = 'collects'; // 收藏列表
  ///标签列表
  static const String tagList = 'tags/'; // 标签列表
  // ///修改删除标签
  // static const String editTags = 'tag/{id}'; // 增加标签

  ///编辑标签
  static const String tags = 'tags/';

  //添加公司或个人到标签
  static const String collect = 'collects'; //收藏

  //添加公司或个人到标签
  static const String cancelCollect = 'collects/cancel/'; //取消收藏

  //设置
  static const String feedback = 'feedbacks'; //反馈
  static const String works = 'people/works'; //工作经验
  static const String educations = 'people/educations'; //教育
  static const String honors = 'people/honors'; //荣誉
  static const String historyRecord = 'history/record/'; //浏览记录
  static const String peoples = 'peoples'; //公司人员

  //热搜
  static const String hotWords = 'hot/words';

  static const String exportIndex = 'export/index'; //导出记录
  static const String export = 'export/store'; //导出

  //支付
  static const String payments = 'payments'; //支付
  static const String iosNotify = 'ios_notify'; //ios回调

}
