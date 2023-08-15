import 'package:auto_route/auto_route.dart';
import 'package:mothercare_mobile/core/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashPageRoute.page, path: '/'),
    CustomRoute(
      page: BoardingPageRoute.page,
      path: '/boarding-screen',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400,
    ),
    AutoRoute(page: RegisterPageRoute.page, path: '/register-screen'),
    // AutoRoute(page: ValidateOtpPageRoute.page, path: '/register-validate-otp-screen'),
    // AutoRoute(page: ConfirmRegistrationPageRoute.page, path: '/register-confirm-screen'),
    AutoRoute(page: LoginPageRoute.page, path: '/login-screen'),
    AutoRoute(page: RequestEktpPageRoute.page, path: '/ektp-screen'),
    AutoRoute(page: RequestEktpFormPageRoute.page, path: '/ektp-form-screen'),
    AutoRoute(page: RequestDetailEktpPageRoute.page, path: '/detail-ektp-screen'),

    AutoRoute(page: NotificationsPageRoute.page, path: '/notifications-screen'),

    AutoRoute(page: ResetPasswordPageRoute.page, path: '/reset-password-screen'),
    AutoRoute(page: EditProfilePageRoute.page, path: '/edit-profile-screen'),
    AutoRoute(page: WebviewStaticPageRoute.page, path: '/webview-static-screen'),
    AutoRoute(page: InfoPentingPageRoute.page, path: '/info-penting-screen'),
    AutoRoute(page: PusatBantuanPageRoute.page, path: '/pusat-bantuan-screen'),
    AutoRoute(page: StartPageRoute.page, path: '/start-screen'),
    AutoRoute(page: BoardingPageRoute.page, path: '/boarding-screen'),
    // Main Page Using Bottom Navbar
    AutoRoute(
      children: [
        AutoRoute(page: ProfilePageRoute.page),
        AutoRoute(page: HomePageRoute.page),
        AutoRoute(page: CartPageRoute.page),
        AutoRoute(page: CategoryPageRoute.page),
        AutoRoute(page: ArticlePageRoute.page),
      ],
      page: MainPageRoute.page,
      path: '/main-screen',
    ),
  ];
}
