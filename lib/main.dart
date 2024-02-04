import 'package:flutter/material.dart';
import 'package:state_management_demo/screens/default/default_screen.dart';
import 'package:state_management_demo/screens/screen_lists/screen_list.dart';
import 'package:state_management_demo/screens/stream_state/stream_screen.dart';
import 'package:state_management_demo/screens/stream_state/strem_counter_viewmodel.dart';
import 'package:state_management_demo/screens/view_model_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void _registerViewmodels() {
    ViewmodelRepository.register<StreamCounterViewModel>(
      StreamCounterViewModel(
        initialCount: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _registerViewmodels();
    return MaterialApp(
      routes: {
        '/': (context) => const ScreenList(),
        '/default': (context) => const DefaultCounter(),
        '/stream': (context) => const StreamCounterScreen(),
      },
      initialRoute: '/',
    );
  }
}
