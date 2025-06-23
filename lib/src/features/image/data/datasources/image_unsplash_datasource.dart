import 'package:artgalery/src/common/data/datasources/unsplash_datasource.dart';
import 'package:artgalery/src/features/image/data/models/image_model.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';

abstract class ImageDatasource {
  Future<List<ImageEntity>> searchImages(String q);
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
        'per_page': 15,
      },
    );

    print(response.data);

    return List<ImageEntity>.from(
      response.data['results'].map(
        (json) => ImageModel.fromJson(json),
      ),
    );
  }
}
