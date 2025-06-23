import 'package:equatable/equatable.dart';

abstract class DataState<T extends Equatable> extends Equatable {
  const DataState();

  @override
  List<Object?> get props => [];
}

class NotLoadedState<T extends Equatable> extends DataState<T> {
  const NotLoadedState();
}

class LoadingState<T extends Equatable> extends NotLoadedState<T> {
  final dynamic params;

  const LoadingState({
    required this.params,
  });

  @override
  List<Object?> get props => [
        params,
      ];
}

class LoadingFailedState<T extends Equatable> extends NotLoadedState<T> {
  final Object failure;
  final dynamic params;

  const LoadingFailedState({
    required this.failure,
    required this.params,
  });

  @override
  List<Object?> get props => [
        failure,
        params,
      ];
}

class LoadedState<T extends Equatable> extends DataState<T> {
  final T result;
  final dynamic params;

  const LoadedState({
    required this.result,
    required this.params,
  });

  @override
  List<Object?> get props => [
        result,
        params,
      ];
}

class LazyLoadingState<T extends Equatable> extends LoadedState<T>
    implements LoadingState<T> {
  const LazyLoadingState({
    required super.result,
    required super.params,
  });
}

class ReloadingState<T extends Equatable> extends LoadedState<T>
    implements LoadingState<T> {
  const ReloadingState({
    required super.result,
    required super.params,
  });
}
