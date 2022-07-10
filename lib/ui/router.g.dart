// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $rootRoute,
      $servicesRoute,
    ];

GoRoute get $rootRoute => GoRouteData.$route(
      path: '/',
      factory: $RootRouteExtension._fromState,
    );

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => const RootRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $servicesRoute => GoRouteData.$route(
      path: '/services',
      factory: $ServicesRouteExtension._fromState,
    );

extension $ServicesRouteExtension on ServicesRoute {
  static ServicesRoute _fromState(GoRouterState state) => const ServicesRoute();

  String get location => GoRouteData.$location(
        '/services',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
