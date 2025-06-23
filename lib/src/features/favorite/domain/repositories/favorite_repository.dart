import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';

abstract class FavoriteRepository {
  Future<void> toggleFavorite(ImageEntity image);

  Future<List<String>> getFavorites();
}
