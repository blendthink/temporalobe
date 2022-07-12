// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $rootRoute,
      $boxRoute,
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

GoRoute get $boxRoute => GoRouteData.$route(
      path: '/:tab',
      factory: $BoxRouteExtension._fromState,
    );

extension $BoxRouteExtension on BoxRoute {
  static BoxRoute _fromState(GoRouterState state) => BoxRoute(
        _$BoxTabEnumMap._$fromName(state.params['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$BoxTabEnumMap[tab]!)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

const _$BoxTabEnumMap = {
  BoxTab.home: 'home',
  BoxTab.setting: 'setting',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}
