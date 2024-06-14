import 'package:auto_route/auto_route.dart';
import 'package:greenapp/features/delivery_point/presentation/delivery_point_page.dart';
import 'package:greenapp/features/profile/presentation/pages/profile_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/auth/presentation/pages/authgate_page.dart';
import '../features/home/presentation/pages/main_page.dart';
import '../features/profile/presentation/pages/edit_profile_page.dart';
import '../features/profile/presentation/pages/leader_board_page.dart';

//home page
import '../features/home/presentation/pages/home_page.dart';
import '../features/qr/presentation/pages/product_preview_page.dart';
import '../features/qr/presentation/pages/qr_page.dart';
import '../features/map/domain/repositories/pages/map_page.dart';
import '../splash_page.dart';

part "router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Page|Screen|View|Widget|Tab,Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),

        // AutoRoute(page: MainRoute.page, children: [
        //   AutoRoute(page: HomeRoute.page, initial: true),
        //   AutoRoute(
        //     page: SecondaryRoute.page,
        //   ),
        //   AutoRoute(page: QrRoute.page),
        //   AutoRoute(page: MapRoute.page),
        //   AutoRoute(page: ProfileRoute.page),
        // ]),
        AutoRoute(page: AuthGateRoute.page, children: [
          AutoRoute(page: MainRoute.page),
          AutoRoute(page: HomeRoute.page, initial: true),
          AutoRoute(page: MapRoute.page),
          AutoRoute(page: ProfileRoute.page),
          AutoRoute(page: DeliveryPointRoute.page),
          AutoRoute(page: LoginRoute.page),
        ]),
        AutoRoute(page: QrRoute.page),

        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ProductPreviewRoute.page),
        AutoRoute(page: LeaderBoardRoute.page),
        AutoRoute(page: EditProfileRoute.page),
      ];
}
