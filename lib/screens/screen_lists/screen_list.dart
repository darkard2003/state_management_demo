import 'package:flutter/material.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<StateScreen> listState = [
      StateScreen(
        title: 'Default',
        onPressed: () {
          Navigator.pushNamed(context, '/default');
        },
      ),
      StateScreen(
        title: 'Stream',
        onPressed: () {
          Navigator.pushNamed(context, '/stream');
        },
      ),
      StateScreen(
        title: 'Bloc',
        onPressed: () {},
      ),
      StateScreen(
        title: 'Provider',
        onPressed: () {},
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Demo'),
      ),
      body: ListView.builder(
        itemCount: listState.length,
        itemBuilder: (context, index) {
          final StateScreen stateScreen = listState[index];
          return Card(
            child: ListTile(
              title: Text(stateScreen.title),
              onTap: stateScreen.onPressed,
            ),
          );
        },
      ),
    );
  }
}

class StateScreen {
  final String title;
  final Function() onPressed;

  StateScreen({
    required this.title,
    required this.onPressed,
  });
}
