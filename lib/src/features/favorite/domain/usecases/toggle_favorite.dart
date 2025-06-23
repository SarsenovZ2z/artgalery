import 'package:artgalery/src/common/domain/usecases/usecase.dart';
import 'package:artgalery/src/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';

class ToggleFavorite extends UseCase<void, ToggleFavoriteParams> {
  final FavoriteRepository favoriteRepository;

  const ToggleFavorite({
    required this.favoriteRepository,
  });

  @override
  Future<void> run(ToggleFavoriteParams params) {
    return favoriteRepository.toggleFavorite(params.image);
  }
}

class ToggleFavoriteParams {
  final ImageEntity image;

  const ToggleFavoriteParams(this.image);
}
