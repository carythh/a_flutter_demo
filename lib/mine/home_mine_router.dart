import 'package:a_flutter_demo/mine/page/home_mine.dart';
import 'package:a_flutter_demo/routers/router_provider.dart';
import 'package:fluro/fluro.dart';

class HomeMineRouter implements IRouterProvider {
  static String homeMinePage = '/homeMine';

  @override
  void initRouter(FluroRouter router) {
    router.define(homeMinePage, handler: Handler(handlerFunc: (_, __) => const HomeMinePage()));
  }
}