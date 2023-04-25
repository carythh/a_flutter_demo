import 'package:a_flutter_demo/discoveries/page/home_discoveries.dart';
import 'package:fluro/fluro.dart';

import '../routers/router_provider.dart';

/// discoveries router 实现IRouterProvider接口
class  HomeDiscoveriesRouter implements IRouterProvider{
  static String homeDiscoveriesPage = '/discoveries';
  @override
  void initRouter(FluroRouter router) {
    router.define(homeDiscoveriesPage, handler: Handler(handlerFunc: (_, __) => const HomeDiscoveriesPage()));
  }

}
