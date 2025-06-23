import 'package:artgalery/src/common/domain/entities/throttler.dart';
import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:artgalery/src/common/presentation/controllers/load_operation.dart';
import 'package:equatable/equatable.dart';

mixin ReloadOperation<T extends Equatable, P extends Equatable>
    on LoadOperation<T, P> {
  Throttler? throttler;

  DataState<T> getReloadingState(
    P params,
    LoadedState<T> oldState,
  ) =>
      ReloadingState(
        params: params,
        result: oldState.result,
      );

  Future<bool?> reload(
    P? params, {
    int? throttleMilliseconds,
  }) async {
    final currentState = state;
    if (currentState is! LoadedState<T>) {
      if (currentState is ReloadingState<T>) return null;
      if (currentState is LoadingFailedState<T>) {
        return load(params ?? currentState.params);
      }
      return null;
    }

    if (throttleMilliseconds == null) {
      emit(getReloadingState(params ?? currentState.params, currentState));
      return tryToLoad(params ?? currentState.params, null);
    } else {
      throttler ??= Throttler(milliseconds: throttleMilliseconds);
      return throttler?.run<Future<bool?>>(() {
        emit(getReloadingState(params ?? currentState.params, currentState));

        return tryToLoad(params ?? currentState.params, null);
      });
    }
  }
}
