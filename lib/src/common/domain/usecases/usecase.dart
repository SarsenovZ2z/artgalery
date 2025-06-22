import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  const UseCase();

  Future<Either<Object, T>> call(P params) async {
    try {
      return Right(await _call(params));
    } catch (e) {
      return Left(e);
    }
  }

  Future<T> _call(P params);
}
