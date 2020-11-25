import 'package:anya/presentation/config/route/general_route.dart';
import 'package:sailor/sailor.dart';

/// Route name directory
class RouteName {
  // General routes
  static const String splash = '/';
  static const String login = '/login';
  static const String water = '/water';
  static const String zodiac = '/zodiac';
}

class RouteConfig {
  static void configureMainRoutes(Sailor router) {
    router.addRoutes(GeneralRouteConfig.routes);
  }
}
