import 'package:artgalery/src/common/service_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeServiceProvider extends ServiceProvider {
  const HomeServiceProvider();

  @override
  List<GoRoute> getRoutes({
    GlobalKey<NavigatorState>? rootNavigatorKey,
    GlobalKey<NavigatorState>? shellNavigatorKey,
  }) {
    return [];
  }

  @override
  void registerBlocs() {
    // TODO: implement registerBlocs
  }

  @override
  void registerDataSources() {
    // TODO: implement registerDataSources
  }

  @override
  void registerRepositories() {
    // TODO: implement registerRepositories
  }

  @override
  void registerUseCases() {
    // TODO: implement registerUseCases
  }
}
