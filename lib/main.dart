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
  final DemoCubit demo = DemoCubit();
  List<String> items = ['Hello', 'Peter', 'Number', 'Foo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ElevatedButton(
        child: Text('change cubit'),
        onPressed: () => demo.change(demo.state + 1),
      )),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return BlocBuilder<DemoCubit, int>(
              bloc: demo,
              buildWhen: (previous, current) {
                if (index == 0) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                print('$state ---  ${demo.state}');
                return ListTile(
                  title: Text(items[index]),
                );
              });
        },
      ),
    );
  }
}
