import 'package:artgalery/src/common/presentation/controllers/data_cubit.dart';
import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';
import 'package:artgalery/src/features/image/domain/usecases/get_image_by_id.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoadImageParams extends Equatable {
  final String id;

  const LoadImageParams(this.id);

  @override
  List<Object?> get props => [
        id,
      ];
}

class ImageResult extends Equatable {
  final ImageEntity image;

  const ImageResult(this.image);

  @override
  List<Object?> get props => [
        image,
      ];
}

class ImageCubit extends DataCubit<ImageResult, LoadImageParams> {
  final GetImageById getImageById;

  ImageCubit({
    required this.getImageById,
  });

  @override
  Future<Either<Object, dynamic>> fetch(
    LoadImageParams params,
    LoadedState<ImageResult>? oldState,
  ) {
    return getImageById(GetImageByIdParams(params.id));
  }

  @override
  Future<DataState<ImageResult>> getLoadedState(
    LoadImageParams params,
    LoadedState<ImageResult>? oldState,
    data,
  ) async {
    return LoadedState<ImageResult>(
      result: ImageResult(data),
      params: params,
    );
  }
}
