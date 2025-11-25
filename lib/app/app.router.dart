// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:stacked/stacked.dart' as _i10;
import 'package:stacked_services/stacked_services.dart' as _i9;

import '../ui/views/faq/faq_view.dart' as _i3;
import '../ui/views/home/home_view.dart' as _i1;
import '../ui/views/section_contact_us/section_contact_us_view.dart' as _i7;
import '../ui/views/section_download_app/section_download_app_view.dart' as _i6;
import '../ui/views/shop/shop_view.dart' as _i5;
import '../ui/views/terms/terms_view.dart' as _i2;
import '../ui/views/training_services/section_sessions_info_view.dart' as _i4;
import '../ui/views/unknown/unknown_view.dart' as _i8;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i9.StackedService.navigatorKey);

class StackedRouterWeb extends _i10.RootStackRouter {
  StackedRouterWeb({_i11.GlobalKey<_i11.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TermsRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.TermsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    PolicyRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.TermsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FaqViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.FaqView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SectionSessionsInfoViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.SectionSessionsInfoView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShopViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.ShopView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SectionDownloadAppViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.SectionDownloadAppView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SectionContactUsViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.SectionContactUsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          TermsRoute.name,
          path: '/terms',
        ),
        _i10.RouteConfig(
          PolicyRoute.name,
          path: '/policy',
        ),
        _i10.RouteConfig(
          FaqViewRoute.name,
          path: '/faq',
        ),
        _i10.RouteConfig(
          SectionSessionsInfoViewRoute.name,
          path: '/training-services',
        ),
        _i10.RouteConfig(
          ShopViewRoute.name,
          path: '/shop',
        ),
        _i10.RouteConfig(
          SectionDownloadAppViewRoute.name,
          path: '/mobile-app',
        ),
        _i10.RouteConfig(
          SectionContactUsViewRoute.name,
          path: '/contact',
        ),
        _i10.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i10.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i10.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.TermsView]
class TermsRoute extends _i10.PageRouteInfo<void> {
  const TermsRoute()
      : super(
          TermsRoute.name,
          path: '/terms',
        );

  static const String name = 'Terms';
}

/// generated route for
/// [_i2.TermsView]
class PolicyRoute extends _i10.PageRouteInfo<void> {
  const PolicyRoute()
      : super(
          PolicyRoute.name,
          path: '/policy',
        );

  static const String name = 'Policy';
}

/// generated route for
/// [_i3.FaqView]
class FaqViewRoute extends _i10.PageRouteInfo<void> {
  const FaqViewRoute()
      : super(
          FaqViewRoute.name,
          path: '/faq',
        );

  static const String name = 'FaqView';
}

/// generated route for
/// [_i4.SectionSessionsInfoView]
class SectionSessionsInfoViewRoute extends _i10.PageRouteInfo<void> {
  const SectionSessionsInfoViewRoute()
      : super(
          SectionSessionsInfoViewRoute.name,
          path: '/training-services',
        );

  static const String name = 'SectionSessionsInfoView';
}

/// generated route for
/// [_i5.ShopView]
class ShopViewRoute extends _i10.PageRouteInfo<void> {
  const ShopViewRoute()
      : super(
          ShopViewRoute.name,
          path: '/shop',
        );

  static const String name = 'ShopView';
}

/// generated route for
/// [_i6.SectionDownloadAppView]
class SectionDownloadAppViewRoute extends _i10.PageRouteInfo<void> {
  const SectionDownloadAppViewRoute()
      : super(
          SectionDownloadAppViewRoute.name,
          path: '/mobile-app',
        );

  static const String name = 'SectionDownloadAppView';
}

/// generated route for
/// [_i7.SectionContactUsView]
class SectionContactUsViewRoute extends _i10.PageRouteInfo<void> {
  const SectionContactUsViewRoute()
      : super(
          SectionContactUsViewRoute.name,
          path: '/contact',
        );

  static const String name = 'SectionContactUsView';
}

/// generated route for
/// [_i8.UnknownView]
class UnknownViewRoute extends _i10.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i9.RouterService {
  Future<dynamic> navigateToHomeView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTerms(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TermsRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPolicy(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PolicyRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToFaqView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const FaqViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSectionSessionsInfoView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SectionSessionsInfoViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToShopView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ShopViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSectionDownloadAppView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SectionDownloadAppViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSectionContactUsView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SectionContactUsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTerms(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TermsRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPolicy(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PolicyRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithFaqView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const FaqViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSectionSessionsInfoView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SectionSessionsInfoViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithShopView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ShopViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSectionDownloadAppView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SectionDownloadAppViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSectionContactUsView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SectionContactUsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
