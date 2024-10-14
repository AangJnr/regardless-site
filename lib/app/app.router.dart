// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:stacked/stacked.dart' as _i7;
import 'package:stacked_services/stacked_services.dart' as _i6;

import '../ui/views/faq/faq_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i1;
import '../ui/views/shop/shop_view.dart' as _i2;
import '../ui/views/terms/terms_view.dart' as _i3;
import '../ui/views/unknown/unknown_view.dart' as _i5;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i6.StackedService.navigatorKey);

class StackedRouterWeb extends _i7.RootStackRouter {
  StackedRouterWeb({_i8.GlobalKey<_i8.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShopViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.ShopView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TermsRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.TermsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    PolicyRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.TermsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FaqViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.FaqView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          ShopViewRoute.name,
          path: '/shop',
        ),
        _i7.RouteConfig(
          TermsRoute.name,
          path: '/terms',
        ),
        _i7.RouteConfig(
          PolicyRoute.name,
          path: '/policy',
        ),
        _i7.RouteConfig(
          FaqViewRoute.name,
          path: '/faq-view',
        ),
        _i7.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i7.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i7.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.ShopView]
class ShopViewRoute extends _i7.PageRouteInfo<void> {
  const ShopViewRoute()
      : super(
          ShopViewRoute.name,
          path: '/shop',
        );

  static const String name = 'ShopView';
}

/// generated route for
/// [_i3.TermsView]
class TermsRoute extends _i7.PageRouteInfo<void> {
  const TermsRoute()
      : super(
          TermsRoute.name,
          path: '/terms',
        );

  static const String name = 'Terms';
}

/// generated route for
/// [_i3.TermsView]
class PolicyRoute extends _i7.PageRouteInfo<void> {
  const PolicyRoute()
      : super(
          PolicyRoute.name,
          path: '/policy',
        );

  static const String name = 'Policy';
}

/// generated route for
/// [_i4.FaqView]
class FaqViewRoute extends _i7.PageRouteInfo<void> {
  const FaqViewRoute()
      : super(
          FaqViewRoute.name,
          path: '/faq-view',
        );

  static const String name = 'FaqView';
}

/// generated route for
/// [_i5.UnknownView]
class UnknownViewRoute extends _i7.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i6.RouterService {
  Future<dynamic> navigateToHomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToShopView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ShopViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTerms(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TermsRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPolicy(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PolicyRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToFaqView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const FaqViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithShopView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ShopViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTerms(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TermsRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPolicy(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PolicyRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithFaqView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const FaqViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
