import 'package:dartz/dartz.dart';

abstract class UseCaseWithoutParams<T> {
  const UseCaseWithoutParams();

  Future<Either<Object, T>> call() async {
    try {
      return Right(await run());
    } catch (e) {
      return Left(e);
    }
  }

  Future<T> run();
}
