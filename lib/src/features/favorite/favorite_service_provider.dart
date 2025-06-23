import 'package:artgalery/src/common/service_provider.dart';
import 'package:artgalery/src/features/favorite/data/datasources/favorite_datasource.dart';
import 'package:artgalery/src/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:artgalery/src/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:artgalery/src/features/favorite/domain/usecases/get_favorite_urls.dart';
import 'package:artgalery/src/features/favorite/domain/usecases/toggle_favorite.dart';
import 'package:artgalery/src/features/favorite/presentation/controllers/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class FavoriteServiceProvider extends ServiceProvider {
  const FavoriteServiceProvider();

  @override
  List<GoRoute> getRoutes({
    GlobalKey<NavigatorState>? rootNavigatorKey,
    GlobalKey<NavigatorState>? shellNavigatorKey,
  }) {
    return [];
  }

  @override
  void registerBlocs() {
    GetIt.instance.registerFactory<FavoritesCubit>(
      () => FavoritesCubit(
        getFavoriteUrls: GetIt.instance(),
        toggleFavorite: GetIt.instance(),
      ),
    );
  }

  @override
  void registerDataSources() {
    GetIt.instance.registerFactory<FavoriteDatasource>(
      () => FavoriteLocalDatasource(
        sharedPreferences: GetIt.instance(),
      ),
    );
  }

  @override
  void registerRepositories() {
    GetIt.instance.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(
        favoriteDatasource: GetIt.instance(),
      ),
    );
  }

  @override
  void registerUseCases() {
    GetIt.instance.registerFactory<ToggleFavorite>(
      () => ToggleFavorite(
        favoriteRepository: GetIt.instance(),
      ),
    );

    GetIt.instance.registerFactory<GetFavoriteUrls>(
      () => GetFavoriteUrls(
        favoriteRepository: GetIt.instance(),
      ),
    );
  }
}
