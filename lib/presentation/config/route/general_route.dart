import 'package:anya/presentation/page/login/page.dart';
import 'package:anya/presentation/page/splash/page.dart';
import 'package:anya/presentation/page/water/page.dart';
import 'package:anya/presentation/page/zodiac/page.dart';
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
    SailorRoute(
      name: RouteName.water,
      builder: (context, args, params) {
        return WaterPage()  ;
      },
    ),
    SailorRoute(
      name: RouteName.zodiac,
      builder: (context, args, params) {
        return ZodiacPage()  ;
      },
    ),
  ];
}
