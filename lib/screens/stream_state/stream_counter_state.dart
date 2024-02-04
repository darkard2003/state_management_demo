class StreamCounterState {
  final int count;
  const StreamCounterState({
    required this.count,
  });

  StreamCounterState copyWith({
    int? count,
  }) {
    return StreamCounterState(
      count: count ?? this.count,
    );
  }
}
