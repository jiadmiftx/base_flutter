// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/src/widgets/framework.dart' as _i22;
import 'package:mothercare_mobile/features/article/presentation/article_page.dart'
    as _i16;
import 'package:mothercare_mobile/features/boarding/presentation/boarding_page.dart'
    as _i17;
import 'package:mothercare_mobile/features/boarding/presentation/start_page.dart'
    as _i18;
import 'package:mothercare_mobile/features/cart/presentation/cart_page.dart'
    as _i15;
import 'package:mothercare_mobile/features/category/presentation/category_page.dart'
    as _i6;
import 'package:mothercare_mobile/features/ektp/ektp.dart' as _i23;
import 'package:mothercare_mobile/features/ektp/presentation/request_detail_ektp_page.dart'
    as _i9;
import 'package:mothercare_mobile/features/ektp/presentation/request_ektp_form_page.dart'
    as _i8;
import 'package:mothercare_mobile/features/ektp/presentation/request_ektp_page.dart'
    as _i10;
import 'package:mothercare_mobile/features/home/presentation/home_page.dart'
    as _i3;
import 'package:mothercare_mobile/features/home/presentation/info_penting_page.dart'
    as _i2;
import 'package:mothercare_mobile/features/login/presentation/login_page.dart'
    as _i20;
import 'package:mothercare_mobile/features/login/presentation/reset_password_page.dart'
    as _i19;
import 'package:mothercare_mobile/features/main_page.dart' as _i1;
import 'package:mothercare_mobile/features/notifikasi/presentation/notifications_page.dart'
    as _i5;
import 'package:mothercare_mobile/features/profile/model/user_profile_response.dart'
    as _i24;
import 'package:mothercare_mobile/features/profile/presentation/edit_profile.dart'
    as _i12;
import 'package:mothercare_mobile/features/profile/presentation/profile_page.dart'
    as _i14;
import 'package:mothercare_mobile/features/profile/presentation/pusat_bantuan_page.dart'
    as _i13;
import 'package:mothercare_mobile/features/register/presentation/register_page.dart'
    as _i11;
import 'package:mothercare_mobile/features/splash/presentation/splash_page.dart'
    as _i4;
import 'package:mothercare_mobile/features/webview/webview_static.dart' as _i7;

abstract class $AppRouter extends _i21.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    MainPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    InfoPentingPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InfoPentingPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(),
      );
    },
    SplashPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
    NotificationsPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NotificationsPage(),
      );
    },
    CategoryPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CategoryPage(),
      );
    },
    WebviewStaticPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebviewStaticPageRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WebviewStaticPage(
          key: args.key,
          url: args.url,
          title: args.title,
        ),
      );
    },
    RequestEktpFormPageRoute.name: (routeData) {
      final args = routeData.argsAs<RequestEktpFormPageRouteArgs>(
          orElse: () => const RequestEktpFormPageRouteArgs());
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RequestEktpFormPage(
          key: args.key,
          isEdit: args.isEdit,
          requKtpId: args.requKtpId,
        ),
      );
    },
    RequestDetailEktpPageRoute.name: (routeData) {
      final args = routeData.argsAs<RequestDetailEktpPageRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.RequestDetailEktpPage(
          key: args.key,
          id: args.id,
          noPermohonan: args.noPermohonan,
        ),
      );
    },
    RequestEktpPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.RequestEktpPage(),
      );
    },
    RegisterPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.RegisterPage(),
      );
    },
    EditProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfilePageRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.EditProfilePage(
          key: args.key,
          profile: args.profile,
        ),
      );
    },
    PusatBantuanPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.PusatBantuanPage(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ProfilePage(),
      );
    },
    CartPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.CartPage(),
      );
    },
    ArticlePageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ArticlePage(),
      );
    },
    BoardingPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.BoardingPage(),
      );
    },
    StartPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.StartPage(),
      );
    },
    ResetPasswordPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ResetPasswordPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.LoginPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainPageRoute extends _i21.PageRouteInfo<void> {
  const MainPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          MainPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InfoPentingPage]
class InfoPentingPageRoute extends _i21.PageRouteInfo<void> {
  const InfoPentingPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          InfoPentingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoPentingPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i21.PageRouteInfo<void> {
  const HomePageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashPageRoute extends _i21.PageRouteInfo<void> {
  const SplashPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          SplashPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NotificationsPage]
class NotificationsPageRoute extends _i21.PageRouteInfo<void> {
  const NotificationsPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          NotificationsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CategoryPage]
class CategoryPageRoute extends _i21.PageRouteInfo<void> {
  const CategoryPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          CategoryPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WebviewStaticPage]
class WebviewStaticPageRoute
    extends _i21.PageRouteInfo<WebviewStaticPageRouteArgs> {
  WebviewStaticPageRoute({
    _i22.Key? key,
    required String url,
    required String title,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<WebviewStaticPageRouteArgs> page =
      _i21.PageInfo<WebviewStaticPageRouteArgs>(name);
}

class WebviewStaticPageRouteArgs {
  const WebviewStaticPageRouteArgs({
    this.key,
    required this.url,
    required this.title,
  });

  final _i22.Key? key;

  final String url;

  final String title;

  @override
  String toString() {
    return 'WebviewStaticPageRouteArgs{key: $key, url: $url, title: $title}';
  }
}

/// generated route for
/// [_i8.RequestEktpFormPage]
class RequestEktpFormPageRoute
    extends _i21.PageRouteInfo<RequestEktpFormPageRouteArgs> {
  RequestEktpFormPageRoute({
    _i23.Key? key,
    bool isEdit = false,
    String? requKtpId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          RequestEktpFormPageRoute.name,
          args: RequestEktpFormPageRouteArgs(
            key: key,
            isEdit: isEdit,
            requKtpId: requKtpId,
          ),
          initialChildren: children,
        );

  static const String name = 'RequestEktpFormPageRoute';

  static const _i21.PageInfo<RequestEktpFormPageRouteArgs> page =
      _i21.PageInfo<RequestEktpFormPageRouteArgs>(name);
}

class RequestEktpFormPageRouteArgs {
  const RequestEktpFormPageRouteArgs({
    this.key,
    this.isEdit = false,
    this.requKtpId,
  });

  final _i23.Key? key;

  final bool isEdit;

  final String? requKtpId;

  @override
  String toString() {
    return 'RequestEktpFormPageRouteArgs{key: $key, isEdit: $isEdit, requKtpId: $requKtpId}';
  }
}

/// generated route for
/// [_i9.RequestDetailEktpPage]
class RequestDetailEktpPageRoute
    extends _i21.PageRouteInfo<RequestDetailEktpPageRouteArgs> {
  RequestDetailEktpPageRoute({
    _i23.Key? key,
    required String id,
    required String noPermohonan,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          RequestDetailEktpPageRoute.name,
          args: RequestDetailEktpPageRouteArgs(
            key: key,
            id: id,
            noPermohonan: noPermohonan,
          ),
          initialChildren: children,
        );

  static const String name = 'RequestDetailEktpPageRoute';

  static const _i21.PageInfo<RequestDetailEktpPageRouteArgs> page =
      _i21.PageInfo<RequestDetailEktpPageRouteArgs>(name);
}

class RequestDetailEktpPageRouteArgs {
  const RequestDetailEktpPageRouteArgs({
    this.key,
    required this.id,
    required this.noPermohonan,
  });

  final _i23.Key? key;

  final String id;

  final String noPermohonan;

  @override
  String toString() {
    return 'RequestDetailEktpPageRouteArgs{key: $key, id: $id, noPermohonan: $noPermohonan}';
  }
}

/// generated route for
/// [_i10.RequestEktpPage]
class RequestEktpPageRoute extends _i21.PageRouteInfo<void> {
  const RequestEktpPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          RequestEktpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestEktpPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RegisterPage]
class RegisterPageRoute extends _i21.PageRouteInfo<void> {
  const RegisterPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          RegisterPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i12.EditProfilePage]
class EditProfilePageRoute
    extends _i21.PageRouteInfo<EditProfilePageRouteArgs> {
  EditProfilePageRoute({
    _i23.Key? key,
    required _i24.ItemProfile profile,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          EditProfilePageRoute.name,
          args: EditProfilePageRouteArgs(
            key: key,
            profile: profile,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfilePageRoute';

  static const _i21.PageInfo<EditProfilePageRouteArgs> page =
      _i21.PageInfo<EditProfilePageRouteArgs>(name);
}

class EditProfilePageRouteArgs {
  const EditProfilePageRouteArgs({
    this.key,
    required this.profile,
  });

  final _i23.Key? key;

  final _i24.ItemProfile profile;

  @override
  String toString() {
    return 'EditProfilePageRouteArgs{key: $key, profile: $profile}';
  }
}

/// generated route for
/// [_i13.PusatBantuanPage]
class PusatBantuanPageRoute extends _i21.PageRouteInfo<void> {
  const PusatBantuanPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          PusatBantuanPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PusatBantuanPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ProfilePage]
class ProfilePageRoute extends _i21.PageRouteInfo<void> {
  const ProfilePageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ProfilePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i15.CartPage]
class CartPageRoute extends _i21.PageRouteInfo<void> {
  const CartPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          CartPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ArticlePage]
class ArticlePageRoute extends _i21.PageRouteInfo<void> {
  const ArticlePageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ArticlePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlePageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i17.BoardingPage]
class BoardingPageRoute extends _i21.PageRouteInfo<void> {
  const BoardingPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          BoardingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardingPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i18.StartPage]
class StartPageRoute extends _i21.PageRouteInfo<void> {
  const StartPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          StartPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ResetPasswordPage]
class ResetPasswordPageRoute extends _i21.PageRouteInfo<void> {
  const ResetPasswordPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ResetPasswordPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i20.LoginPage]
class LoginPageRoute extends _i21.PageRouteInfo<void> {
  const LoginPageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}
