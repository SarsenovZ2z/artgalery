import 'package:artgalery/src/common/data/datasources/local_datasource.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';

abstract class FavoriteDatasource {
  Future<void> toggleFavorite(ImageEntity image);

  Future<List<String>> getFavoriteImageUrls();
}

class FavoriteLocalDatasource extends LocalDataSource
    implements FavoriteDatasource {
  const FavoriteLocalDatasource({required super.sharedPreferences});

  @override
  Future<List<String>> getFavoriteImageUrls() async {
    return sharedPreferences.getStringList('favorites') ?? <String>[];
  }

  @override
  Future<void> toggleFavorite(ImageEntity image) async {
    final urls = await getFavoriteImageUrls();
    final index = urls.indexOf(image.url);

    if (index == -1) {
      _setFavoriteUrls(urls..insert(0, image.url));
    } else {
      _setFavoriteUrls(urls..removeAt(index));
    }
  }

  _setFavoriteUrls(List<String> urls) {
    sharedPreferences.setStringList('favorites', urls);
  }
}
