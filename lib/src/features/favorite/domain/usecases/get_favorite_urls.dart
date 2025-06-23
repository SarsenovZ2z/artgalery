import 'package:artgalery/src/common/domain/usecases/usecase_without_params.dart';
import 'package:artgalery/src/features/favorite/domain/repositories/favorite_repository.dart';

class GetFavoriteUrls extends UseCaseWithoutParams<List<String>> {
  final FavoriteRepository favoriteRepository;

  const GetFavoriteUrls({
    required this.favoriteRepository,
  });

  @override
  Future<List<String>> run() {
    return favoriteRepository.getFavorites();
  }
}
