import 'package:a_flutter_demo/mine/home_mine_router.dart';
import 'package:a_flutter_demo/plan/home_plan_router.dart';
import 'package:a_flutter_demo/routers/router_provider.dart';
import 'package:a_flutter_demo/sports/home_sports_router.dart';
import 'package:fluro/fluro.dart';
import '../discoveries/home_discoveries_router.dart';
import '../home/home_page.dart';
import '../home/webview_page.dart';
import '../login/login_router.dart';
import 'not_found_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static String home = '/home';
  static String webViewPage = '/webView';

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return const NotFoundPage();
    });

    router.define(home,
        handler: Handler(
            handlerFunc:
                (BuildContext? context, Map<String, List<String>> params) =>
                    const Home()));

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first ?? '';
      final String url = params['url']?.first ?? '';
      return WebViewPage(title: title, url: url);
    }));

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(LoginRouter());
    _listRouter.add(HomeSportsRouter());
    _listRouter.add(HomePlanRouter());
    _listRouter.add(HomeMineRouter());
    _listRouter.add(HomeDiscoveriesRouter());

    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRouter);
  }
}
