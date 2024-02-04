class ViewmodelRepository<T> {
  static final Map<Type, dynamic> _viewmodels = {};

  static void register<T>(T viewModel) {
    _viewmodels[T.runtimeType] = viewModel;
  }

  static T of<T>() {
    if (!_viewmodels.containsKey(T.runtimeType)) {
      throw Exception('Viewmodel not registered');
    }
    return _viewmodels[T.runtimeType] as T;
  }
}