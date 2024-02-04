import 'dart:async';

import 'package:state_management_demo/screens/stream_state/stream_counter_state.dart';

class StreamCounterViewModel {
  late final StreamController<StreamCounterState> _streamController;

  StreamCounterState _state;

  StreamCounterViewModel({
    required int initialCount,
  }) : _state = StreamCounterState(
          count: initialCount,
        ) {
    _streamController = StreamController<StreamCounterState>.broadcast(
      onListen: () {
        _streamController.add(
          _state,
        );
      },
    );
  }

  Stream<StreamCounterState> get stream => _streamController.stream;

  void increment() {
    _state = _state.copyWith(
      count: _state.count + 1,
    );
    _streamController.add(
      _state,
    );
  }

  void decrement() {
    _state = _state.copyWith(
      count: _state.count - 1,
    );
    _streamController.add(
      _state,
    );
  }
}
