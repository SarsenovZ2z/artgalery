import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class ServiceProvider {
  const ServiceProvider();

  void registerBlocs();

  void registerUseCases();

  void registerRepositories();

  void registerDataSources();

  List<GoRoute> getGlobalRoutes() {
    return [];
  }

  List<GoRoute> getRoutes({
    GlobalKey<NavigatorState>? rootNavigatorKey,
    GlobalKey<NavigatorState>? shellNavigatorKey,
  });

  void register() {
    registerBlocs();
    registerUseCases();
    registerRepositories();
    registerDataSources();
  }
}
