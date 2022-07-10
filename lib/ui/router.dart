import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temporalobe/ui/services/index.dart';

part 'router.g.dart';

final _router = GoRouter(routes: $appRoutes);

final routeInformationProvider = _router.routeInformationProvider;
final routeInformationParser = _router.routeInformationParser;
final routerDelegate = _router.routerDelegate;

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  String? redirect() => const ServicesRoute().location;
}

@TypedGoRoute<ServicesRoute>(path: '/services')
class ServicesRoute extends GoRouteData {
  const ServicesRoute();

  @override
  Widget build(BuildContext context) => const ServicesPage();
}
