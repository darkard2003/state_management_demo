import 'package:flutter/material.dart';
import 'package:state_management_demo/screens/stream_state/stream_counter_state.dart';
import 'package:state_management_demo/screens/stream_state/strem_counter_viewmodel.dart';
import 'package:state_management_demo/screens/view_model_repository.dart';

class StreamCounterView extends StatelessWidget {
  const StreamCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewmodelRepository.of<StreamCounterViewModel>();
    return StreamBuilder<StreamCounterState>(
        stream: viewModel.stream,
        builder: (context, snapshot) {
          var data = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Stream Counter'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count: ${data?.count ?? 0}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: viewModel.increment,
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: viewModel.decrement,
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
