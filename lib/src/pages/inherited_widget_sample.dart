import 'package:flutter/material.dart';
import 'package:sample_inherited_widget/src/components/inherited/in_default_item.dart';
import 'package:sample_inherited_widget/src/components/inherited/in_default_widget_tree.dart';
import 'package:sample_inherited_widget/src/utils/string_utils.dart';

class InheritedWidgetParent extends StatefulWidget {
  InheritedWidgetParent({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetParent> createState() => _InheritedWidgetParentState();
}

class _InheritedWidgetParentState extends State<InheritedWidgetParent> {
  @override
  Widget build(BuildContext context) {
    return InheritedStateWidget(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('즐겨찾는 상품')),
          body: Column(
            children: [
              InDefaultWidgetTree(),
              const Divider(height: 1, color: Colors.grey),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      context.inherited.products.length,
                      (index) => InDefaultItem(index: index),
                    ),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: const FloatingSampleBtn(),
        );
      }),
    );
  }
}

class FloatingSampleBtn extends StatelessWidget {
  const FloatingSampleBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FloatingSampleBtn in build');
    return FloatingActionButton(
      onPressed: () {
        context.inheritedNoneRebuld.addProducts(StringUtils.getRandomString(2));
      },
      child: const Icon(Icons.add),
    );
  }
}

class InheritedStateWidget extends StatefulWidget {
  Widget child;
  InheritedStateWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  static InheritedState of(BuildContext context, {bool rebuild = true}) {
    var data = rebuild
        ? context.dependOnInheritedWidgetOfExactType<InheritedData>()!.data
        : context.findAncestorWidgetOfExactType<InheritedData>()!.data;
    return data!;
  }

  @override
  State<InheritedStateWidget> createState() => InheritedState();
}

class InheritedState extends State<InheritedStateWidget> {
  Set<String> products = {};
  Set<String> leftProducts = {};
  Set<String> rightProducts = {};

  void update() => setState(() {});

  addProducts(String item) {
    products.add(item);
    update();
  }

  leftAddProducts(String item) {
    leftProducts.add(item);
    products.remove(item);
    update();
  }

  rightAddProducts(String item) {
    rightProducts.add(item);
    products.remove(item);
    update();
  }

  removeRightItem(String item) {
    rightProducts.remove(item);
    products.add(item);
    update();
  }

  removeLeftItem(String item) {
    leftProducts.remove(item);
    products.add(item);
    update();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedData(
      data: this,
      child: widget.child,
    );
  }
}

class InheritedData extends InheritedWidget {
  InheritedState? data;
  InheritedData({
    Key? key,
    this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedData oldWidget) {
    return true;
  }
}

extension SampleBuildContext on BuildContext {
  InheritedState get inherited => InheritedStateWidget.of(this);
  InheritedState get inheritedNoneRebuld =>
      InheritedStateWidget.of(this, rebuild: false);
}
