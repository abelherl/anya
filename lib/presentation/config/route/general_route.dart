import 'package:anya/presentation/page/login/page.dart';
import 'package:anya/presentation/page/splash/page.dart';
import 'package:sailor/sailor.dart';
import '../route_config.dart';

class GeneralRouteConfig {
  static final List<SailorRoute> routes = [
    SailorRoute(
      name: RouteName.splash,
      builder: (context, args, params) {
        return SplashPage();
      },
    ),
    SailorRoute(
      name: RouteName.login,
      builder: (context, args, params) {
        return LoginPage();
      },
    ),
  ];
}
