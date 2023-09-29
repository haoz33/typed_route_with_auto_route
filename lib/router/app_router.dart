import 'package:auto_route/auto_route.dart';
import 'package:typed_route_with_auto_route/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: SettingRoute.page,
        )
      ];
}
