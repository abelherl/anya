import 'package:anya/presentation/config/route/general_route.dart';
import 'package:sailor/sailor.dart';

/// Route name directory
class RouteName {
  // General routes
  static const String splash = '/';
  static const String login = '/login';
  static const String water = '/water';
  static const String zodiac = '/zodiac';
  static const String listen = '/listen';
  static const String types = '/types';
  static const String settings = '/settings';
  static const String editProfile = '/editProfile';
  static const String changePassword = '/changePassword';
  static const String preferences = '/listen';
  static const String about = '/about';
  static const String contact = '/contact';
}

class RouteConfig {
  static void configureMainRoutes(Sailor router) {
    router.addRoutes(GeneralRouteConfig.routes);
  }
}
