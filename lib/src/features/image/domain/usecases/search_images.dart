import 'package:artgalery/src/common/domain/usecases/usecase.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';
import 'package:artgalery/src/features/image/domain/repositories/image_repository.dart';

class SearchImages extends UseCase<List<ImageEntity>, SearchImagesParams> {
  final ImageRepository imageRepository;

  const SearchImages({
    required this.imageRepository,
  });

  @override
  Future<List<ImageEntity>> run(SearchImagesParams params) {
    return imageRepository.searchImages(params.q);
  }
}

class SearchImagesParams {
  final String q;

  const SearchImagesParams(this.q);
}
