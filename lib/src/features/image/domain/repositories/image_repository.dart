import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';

abstract class ImageRepository {
  Future<List<ImageEntity>> searchImages(String q);
  Future<ImageEntity> getImageById(String id);
}
