class Throttler {
  final int milliseconds;

  int _lastActionTime;

  int get _millisecondsSinceEpoch => DateTime.now().millisecondsSinceEpoch;

  Throttler({required this.milliseconds})
      : _lastActionTime = DateTime.now().millisecondsSinceEpoch;

  T? run<T>(T Function() action) {
    if (_millisecondsSinceEpoch - _lastActionTime > milliseconds) {
      final T res = action();
      _lastActionTime = _millisecondsSinceEpoch;

      return res;
    }

    return null;
  }
}