import 'package:artgalery/src/common/domain/usecases/usecase.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';
import 'package:artgalery/src/features/image/domain/repositories/image_repository.dart';

class GetImageById extends UseCase<ImageEntity, GetImageByIdParams> {
  final ImageRepository imageRepository;

  const GetImageById({
    required this.imageRepository,
  });

  @override
  Future<ImageEntity> run(GetImageByIdParams params) {
    return imageRepository.getImageById(params.id);
  }
}

class GetImageByIdParams {
  final String id;

  const GetImageByIdParams(this.id);
}
