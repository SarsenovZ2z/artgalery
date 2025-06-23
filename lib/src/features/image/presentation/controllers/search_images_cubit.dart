import 'package:artgalery/src/common/presentation/controllers/data_cubit.dart';
import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';
import 'package:artgalery/src/features/image/domain/usecases/search_images.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoadImagesParams extends Equatable {
  final String q;

  const LoadImagesParams(this.q);

  @override
  List<Object?> get props => [q];
}

class Images extends Equatable {
  final List<ImageEntity> images;

  const Images(this.images);

  @override
  List<Object?> get props => [images];
}

class SearchImagesCubit extends DataCubit<Images, LoadImagesParams> {
  final SearchImages searchImages;

  SearchImagesCubit({
    required this.searchImages,
  });

  @override
  Future<Either<Object, dynamic>> fetch(
    LoadImagesParams params,
    LoadedState<Images>? oldState,
  ) {
    return searchImages(SearchImagesParams(params.q));
  }

  @override
  Future<DataState<Images>> getLoadedState(
    LoadImagesParams params,
    LoadedState<Images>? oldState,
    data,
  ) async {
    return LoadedState<Images>(
      result: Images(data),
      params: params,
    );
  }
}
