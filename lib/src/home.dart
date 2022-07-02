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
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestWidget()),
                );
              },
              child: const Text('testWidget'),
            ),
          ),
        ],
      ),
    );
  }
}

class TestWidget extends StatefulWidget {
  TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return ParentWidget(
      child: ChildWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  Widget child;
  ParentWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            i.toString(),
            style: TextStyle(fontSize: 150),
          ),
          widget.child,
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          i++;
        });
      }),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rebuild ChildWidget');
    return Container();
  }
}
