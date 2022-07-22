import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temporalobe/ui/box/index.dart';

part 'router.g.dart';

final _router = GoRouter(routes: $appRoutes);

final routeInformationProvider = _router.routeInformationProvider;
final routeInformationParser = _router.routeInformationParser;
final routerDelegate = _router.routerDelegate;

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  String? redirect() => const BoxRoute(BoxTab.services).location;
}

@TypedGoRoute<BoxRoute>(path: '/:tab')
class BoxRoute extends GoRouteData {
  const BoxRoute(this.tab);

  final BoxTab tab;

  @override
  Widget build(BuildContext context) => BoxPage(tab: tab);
}
