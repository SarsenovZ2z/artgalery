import 'package:artgalery/src/features/image/data/datasources/image_unsplash_datasource.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';
import 'package:artgalery/src/features/image/domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDatasource imageDatasource;

  const ImageRepositoryImpl({
    required this.imageDatasource,
  });

  @override
  Future<List<ImageEntity>> searchImages(String q) {
    return imageDatasource.searchImages(q);
  }
}
