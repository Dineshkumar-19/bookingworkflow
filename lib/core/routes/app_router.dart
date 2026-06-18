import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
 List<AutoRoute> get routes => [
  AutoRoute(page: SplashRoute.page, initial: true),
  AutoRoute(page: HomeRoute.page),
  AutoRoute(page: BookingRoute.page),
  AutoRoute(page: BookingDetailsRoute.page),
  AutoRoute(page: OtpRoute.page),
];
}