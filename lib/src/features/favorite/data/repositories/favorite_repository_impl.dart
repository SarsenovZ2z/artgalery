import 'package:artgalery/src/features/favorite/data/datasources/favorite_datasource.dart';
import 'package:artgalery/src/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDatasource favoriteDatasource;

  const FavoriteRepositoryImpl({
    required this.favoriteDatasource,
  });

  @override
  Future<List<String>> getFavorites() async {
    return favoriteDatasource.getFavoriteImageUrls();
  }

  @override
  Future<void> toggleFavorite(ImageEntity image) {
    return favoriteDatasource.toggleFavorite(image);
  }
}
