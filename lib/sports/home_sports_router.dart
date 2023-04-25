import 'package:a_flutter_demo/routers/router_provider.dart';
import 'package:a_flutter_demo/sports/page/home_sports.dart';
import 'package:fluro/fluro.dart';

class HomeSportsRouter implements IRouterProvider {
  static String homeSportsPage = '/homeSports';

  @override
  void initRouter(FluroRouter router) {
    router.define(homeSportsPage,
        handler: Handler(handlerFunc: (_, __) => const HomeSportsPage()));
  }
}