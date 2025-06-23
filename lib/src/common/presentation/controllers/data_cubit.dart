import 'package:artgalery/src/common/presentation/controllers/data_states.dart';
import 'package:artgalery/src/common/presentation/controllers/lazy_load_operation.dart';
import 'package:artgalery/src/common/presentation/controllers/load_operation.dart';
import 'package:artgalery/src/common/presentation/controllers/reload_operation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DataCubit<T extends Equatable, P extends Equatable>
    extends Cubit<DataState<T>>
    with LoadOperation<T, P>, ReloadOperation<T, P>, LazyLoadOperation<T, P> {
  DataCubit() : super(NotLoadedState<T>());

  void reset() {
    emit(NotLoadedState<T>());
  }
}
