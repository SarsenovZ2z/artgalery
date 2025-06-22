import 'package:artgalery/src/common/presentation/pages/app_scaffold.dart';
import 'package:artgalery/src/features/home/presentation/pages/home_screen.dart';
import 'package:artgalery/src/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ...services
        .map(
          (service) => List<RouteBase>.from(
            service.getGlobalRoutes(),
          ),
        )
        .expand((element) => element),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppScaffold(
          state: state,
          child: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: 'home',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: HomeScreen(
              key: state.pageKey,
            ),
          ),
          routes: <RouteBase>[
            ...services
                .map(
                  (service) => List<RouteBase>.from(
                    service.getRoutes(
                      rootNavigatorKey: _rootNavigatorKey,
                      shellNavigatorKey: _shellNavigatorKey,
                    ),
                  ),
                )
                .expand((element) => element)
          ],
        ),
      ],
    ),
  ],
);
