

import 'package:foods_store_app/util/user_config.dart';

class HttpUtil {
  static Map<String, dynamic> getHeader() {
    return {"Cookie": cookie, "csrf_token": csrf_token};
  }
}
