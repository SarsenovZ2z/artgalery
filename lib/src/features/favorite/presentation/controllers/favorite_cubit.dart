import 'package:artgalery/src/common/presentation/controllers/data_cubit.dart';
import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:artgalery/src/features/favorite/domain/usecases/get_favorite_urls.dart';
import 'package:artgalery/src/features/favorite/domain/usecases/toggle_favorite.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoadFavoritesParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Favorites extends Equatable {
  final List<String> images;

  const Favorites(this.images);

  bool isFavorite(ImageEntity image) {
    return images.contains(image.url);
  }

  @override
  List<Object?> get props => [
        images,
      ];
}

class FavoritesCubit extends DataCubit<Favorites, LoadFavoritesParams> {
  final GetFavoriteUrls getFavoriteUrls;
  final ToggleFavorite toggleFavorite;

  FavoritesCubit({
    required this.getFavoriteUrls,
    required this.toggleFavorite,
  });

  @override
  Future<Either<Object, dynamic>> fetch(
    LoadFavoritesParams params,
    LoadedState<Favorites>? oldState,
  ) {
    return getFavoriteUrls();
  }

  Future<void> toggle(ImageEntity image) {
    return toggleFavorite(ToggleFavoriteParams(image)).whenComplete(() {
      reload(null);
    });
  }

  @override
  Future<DataState<Favorites>> getLoadedState(
    LoadFavoritesParams params,
    LoadedState<Favorites>? oldState,
    data,
  ) async {
    return LoadedState<Favorites>(
      params: params,
      result: Favorites(data),
    );
  }
}
