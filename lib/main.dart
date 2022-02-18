import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'demo_cubit.dart';

void main() {
  runApp(const MaterialApp(home: Test()));
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

// this widget has the purpose to trigger a rebuild of "MyApp"
class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      ElevatedButton(
        onPressed: () => setState(() => {}),
        child: Text('rebuild widget'),
      ),
      Expanded(child: MyApp()),
    ]));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DemoCubit cubit = DemoCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemoCubit, int>(
      buildWhen: (previous, current) {
        return false;
      },
      bloc: cubit,
      builder: (context, state) {
        print('builder_state: $state -- cubit_state: ${cubit.state}');
        return ElevatedButton(
          onPressed: () => cubit.change(1),
          child: const Text('Change state'),
        );
      },
    );
  }
}
