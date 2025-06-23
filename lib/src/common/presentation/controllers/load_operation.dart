import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin LoadOperation<T extends Equatable, P extends Equatable>
    on Cubit<DataState<T>> {
  Future<DataState<T>> getLoadedState(
    P params,
    LoadedState<T>? oldState,
    data,
  );

  Future<Either<Object, dynamic>> fetch(
    P params,
    LoadedState<T>? oldState,
  );

  DataState<T> getLoadingState(
    P params,
  ) =>
      LoadingState(
        params: params,
      );

  DataState<T> getLoadingFailedState(
    P params,
    Object failure,
  ) =>
      LoadingFailedState(
        params: params,
        failure: failure,
      );

  Future<bool?> load(P params) async {
    final currentState = state;
    if ((currentState is LoadingState<T> && currentState.params == params) ||
        (currentState is LoadedState<T> && currentState.params == params)) {
      return null;
    }

    emit(getLoadingState(params));

    return tryToLoad(params, null);
  }

  Future<bool?> tryToLoad(
    P params,
    LoadedState<T>? oldState,
  ) async {
    final Either<Object, dynamic> data = await fetch(params, oldState);

    return data.fold(
      (failure) {
        emit(getLoadingFailedState(params, failure));
        return false;
      },
      (data) async {
        final currentState = state;
        if (currentState is LoadingState<T> && currentState.params == params) {
          emit(await getLoadedState(params, oldState, data));
          return true;
        }
        return false;
      },
    );
  }
}
