import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  const UseCase();

  Future<Either<Object, T>> call(P params) async {
    try {
      return Right(await run(params));
    } catch (e) {
      return Left(e);
    }
  }

  Future<T> run(P params);
}
