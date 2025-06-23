import 'package:artgalery/src/common/service_provider.dart';
import 'package:artgalery/src/features/image/data/datasources/image_unsplash_datasource.dart';
import 'package:artgalery/src/features/image/data/repositories/image_repository_impl.dart';
import 'package:artgalery/src/features/image/domain/repositories/image_repository.dart';
import 'package:artgalery/src/features/image/domain/usecases/search_images.dart';
import 'package:artgalery/src/features/image/presentation/controllers/search_images_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ImageServiceProvider extends ServiceProvider {
  const ImageServiceProvider();

  @override
  List<GoRoute> getRoutes({
    GlobalKey<NavigatorState>? rootNavigatorKey,
    GlobalKey<NavigatorState>? shellNavigatorKey,
  }) {
    return [];
  }

  @override
  void registerBlocs() {
    GetIt.instance.registerFactory<SearchImagesCubit>(
      () => SearchImagesCubit(
        searchImages: GetIt.instance(),
      ),
    );
  }

  @override
  void registerDataSources() {
    GetIt.instance.registerFactory<ImageDatasource>(
      () => ImageUnsplashDatasource(
        api: GetIt.instance(),
      ),
    );
  }

  @override
  void registerRepositories() {
    GetIt.instance.registerLazySingleton<ImageRepository>(
      () => ImageRepositoryImpl(
        imageDatasource: GetIt.instance(),
      ),
    );
  }

  @override
  void registerUseCases() {
    GetIt.instance.registerFactory<SearchImages>(
      () => SearchImages(
        imageRepository: GetIt.instance(),
      ),
    );
  }
}
