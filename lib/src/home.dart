import 'package:flutter/material.dart';
import 'package:sample_inherited_widget/src/pages/inherited_widget_sample.dart';
import 'package:sample_inherited_widget/src/pages/stateful_widget_sample.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InheritedWidget Test')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StatefulWidgetSample()),
                );
              },
              child: const Text('SetState'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InheritedWidgetParent()),
                );
              },
              child: const Text('InheritedWidget'),
            ),
          )
        ],
      ),
    );
  }
}
