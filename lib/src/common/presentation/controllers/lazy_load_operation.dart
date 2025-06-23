import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:artgalery/src/common/presentation/controllers/load_operation.dart';
import 'package:equatable/equatable.dart';

mixin LazyLoadOperation<T extends Equatable, P extends Equatable>
    on LoadOperation<T, P> {
  bool canLazyLoad(LoadedState<T> state) {
    return false;
  }

  DataState<T> getLazyLoadingState(
    LoadedState<T> state,
  ) =>
      LazyLoadingState(
        params: state.params,
        result: state.result,
      );

  Future<void> lazyLoad() async {
    final currentState = state;
    if (currentState is LazyLoadingState<T>) return;
    if (currentState is! LoadedState<T> || currentState is ReloadingState<T>) {
      return;
    }

    if (!canLazyLoad(currentState)) return;

    emit(getLazyLoadingState(currentState));

    return tryToLazyLoad(currentState);
  }

  Future<void> tryToLazyLoad(LoadedState<T> oldState) {
    return tryToLoad(oldState.params, oldState);
  }
}
