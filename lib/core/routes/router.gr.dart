// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/src/widgets/framework.dart' as _i17;
import 'package:pgn_mobile/features/article/presentation/article_page.dart'
    as _i11;
import 'package:pgn_mobile/features/boarding/presentation/boarding_page.dart'
    as _i12;
import 'package:pgn_mobile/features/boarding/presentation/start_page.dart'
    as _i13;
import 'package:pgn_mobile/features/cart/presentation/cart_page.dart' as _i10;
import 'package:pgn_mobile/features/category/presentation/category_page.dart'
    as _i6;
import 'package:pgn_mobile/features/home/presentation/home_page.dart' as _i3;
import 'package:pgn_mobile/features/home/presentation/info_penting_page.dart'
    as _i2;
import 'package:pgn_mobile/features/login/presentation/login_page.dart' as _i15;
import 'package:pgn_mobile/features/login/presentation/reset_password_page.dart'
    as _i14;
import 'package:pgn_mobile/features/main_page.dart' as _i1;
import 'package:pgn_mobile/features/notifikasi/presentation/notifications_page.dart'
    as _i5;
import 'package:pgn_mobile/features/profile/presentation/profile_page.dart'
    as _i9;
import 'package:pgn_mobile/features/register/presentation/register_page.dart'
    as _i8;
import 'package:pgn_mobile/features/splash/presentation/splash_page.dart'
    as _i4;
import 'package:pgn_mobile/features/webview/webview_static.dart' as _i7;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    MainPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    InfoPentingPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InfoPentingPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(),
      );
    },
    SplashPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
    NotificationsPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NotificationsPage(),
      );
    },
    CategoryPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CategoryPage(),
      );
    },
    WebviewStaticPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebviewStaticPageRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WebviewStaticPage(
          key: args.key,
          url: args.url,
          title: args.title,
        ),
      );
    },
    RegisterPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RegisterPage(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfilePage(),
      );
    },
    CartPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CartPage(),
      );
    },
    ArticlePageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ArticlePage(),
      );
    },
    BoardingPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.BoardingPage(),
      );
    },
    StartPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.StartPage(),
      );
    },
    ResetPasswordPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ResetPasswordPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LoginPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainPageRoute extends _i16.PageRouteInfo<void> {
  const MainPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MainPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InfoPentingPage]
class InfoPentingPageRoute extends _i16.PageRouteInfo<void> {
  const InfoPentingPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          InfoPentingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoPentingPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i16.PageRouteInfo<void> {
  const HomePageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashPageRoute extends _i16.PageRouteInfo<void> {
  const SplashPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NotificationsPage]
class NotificationsPageRoute extends _i16.PageRouteInfo<void> {
  const NotificationsPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          NotificationsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CategoryPage]
class CategoryPageRoute extends _i16.PageRouteInfo<void> {
  const CategoryPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CategoryPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WebviewStaticPage]
class WebviewStaticPageRoute
    extends _i16.PageRouteInfo<WebviewStaticPageRouteArgs> {
  WebviewStaticPageRoute({
    _i17.Key? key,
    required String url,
    required String title,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          WebviewStaticPageRoute.name,
          args: WebviewStaticPageRouteArgs(
            key: key,
            url: url,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'WebviewStaticPageRoute';

  static const _i16.PageInfo<WebviewStaticPageRouteArgs> page =
      _i16.PageInfo<WebviewStaticPageRouteArgs>(name);
}

class WebviewStaticPageRouteArgs {
  const WebviewStaticPageRouteArgs({
    this.key,
    required this.url,
    required this.title,
  });

  final _i17.Key? key;

  final String url;

  final String title;

  @override
  String toString() {
    return 'WebviewStaticPageRouteArgs{key: $key, url: $url, title: $title}';
  }
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterPageRoute extends _i16.PageRouteInfo<void> {
  const RegisterPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegisterPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfilePage]
class ProfilePageRoute extends _i16.PageRouteInfo<void> {
  const ProfilePageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProfilePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CartPage]
class CartPageRoute extends _i16.PageRouteInfo<void> {
  const CartPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CartPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ArticlePage]
class ArticlePageRoute extends _i16.PageRouteInfo<void> {
  const ArticlePageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ArticlePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlePageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.BoardingPage]
class BoardingPageRoute extends _i16.PageRouteInfo<void> {
  const BoardingPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          BoardingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardingPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.StartPage]
class StartPageRoute extends _i16.PageRouteInfo<void> {
  const StartPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          StartPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ResetPasswordPage]
class ResetPasswordPageRoute extends _i16.PageRouteInfo<void> {
  const ResetPasswordPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ResetPasswordPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.LoginPage]
class LoginPageRoute extends _i16.PageRouteInfo<void> {
  const LoginPageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
