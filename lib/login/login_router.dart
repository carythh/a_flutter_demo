import 'package:a_flutter_demo/login/page/login_page.dart';
import 'package:fluro/fluro.dart';

import '../routers/router_provider.dart';

/// login router 实现IRouterProvider接口
class LoginRouter implements IRouterProvider{
  static String loginPage = '/login';
  static String registerPage = '/login/register';
  static String smsLoginPage = '/login/smsLogin';
  static String resetPasswordPage = '/login/resetPassword';
  static String updatePasswordPage = '/login/updatePassword';

  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, __) => const LoginPage()));
    // router.define(registerPage, handler: Handler(handlerFunc: (_, __) => const RegisterPage()));
    // router.define(smsLoginPage, handler: Handler(handlerFunc: (_, __) => const SMSLoginPage()));
    // router.define(resetPasswordPage, handler: Handler(handlerFunc: (_, __) => const ResetPasswordPage()));
    // router.define(updatePasswordPage, handler: Handler(handlerFunc: (_, __) => const UpdatePasswordPage()));
  }

}
