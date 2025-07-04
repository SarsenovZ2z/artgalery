import 'package:artgalery/src/common/data/datasources/unsplash_datasource.dart';
import 'package:artgalery/src/features/image/data/models/image_model.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';

abstract class ImageDatasource {
  Future<List<ImageEntity>> searchImages(String q);

  Future<ImageEntity> getImageById(String id);
}

class ImageUnsplashDatasource extends UnsplashDatasource
    implements ImageDatasource {
  const ImageUnsplashDatasource({
    required super.api,
  });

  @override
  Future<List<ImageEntity>> searchImages(String q) async {
    final response = await api.get(
      '/search/photos',
      queryParameters: {
        'query': q,
        'per_page': 8,
      },
    );

    return List<ImageEntity>.from(
      response.data['results'].map(
        (json) => ImageModel.fromJson(json),
      ),
    );
  }

  @override
  Future<ImageEntity> getImageById(String id) async {
    final response = await api.get('/photos/$id');

    return ImageModel.fromJson(response.data);
  }
}
