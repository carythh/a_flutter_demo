import 'package:a_flutter_demo/plan/page/home_plan.dart';
import 'package:a_flutter_demo/routers/router_provider.dart';
import 'package:fluro/fluro.dart';

class HomePlanRouter implements IRouterProvider{
  static String homePlanPage = '/homePlan';

  @override
  void initRouter(FluroRouter router) {
    router.define(homePlanPage, handler: Handler(handlerFunc: (_, __) => const HomePlanPage()));
  }
}