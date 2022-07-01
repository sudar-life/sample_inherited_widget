import 'package:flutter/material.dart';
import 'package:sample_inherited_widget/src/components/inherited/in_default_item.dart';
import 'package:sample_inherited_widget/src/components/inherited/in_default_widget_tree.dart';
import 'package:sample_inherited_widget/src/utils/string_utils.dart';

class InheritedStatefulWidget extends StatefulWidget {
  InheritedStatefulWidget({
    Key? key,
  }) : super(key: key);

  static InheritedData of(BuildContext context) {
    var data = context.dependOnInheritedWidgetOfExactType<InheritedData>();
    return data!;
  }

  static InheritedStatefulWidgetState find(BuildContext context) {
    var target =
        context.findAncestorStateOfType<InheritedStatefulWidgetState>();
    return target!;
  }

  @override
  State<InheritedStatefulWidget> createState() =>
      InheritedStatefulWidgetState();
}

class InheritedStatefulWidgetState extends State<InheritedStatefulWidget> {
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
      products: products,
      leftProducts: leftProducts,
      rightProducts: rightProducts,
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
                      InheritedStatefulWidget.of(context).products.length,
                      (index) => InDefaultItem(index: index),
                    ),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.parent.addProducts(StringUtils.getRandomString(2));
            },
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}

class InheritedData extends InheritedWidget {
  InheritedData({
    Key? key,
    required this.products,
    required this.leftProducts,
    required this.rightProducts,
    required Widget child,
  }) : super(key: key, child: child);

  Set<String> products = {};
  Set<String> leftProducts = {};
  Set<String> rightProducts = {};

  @override
  bool updateShouldNotify(InheritedData oldWidget) {
    return true;
  }
}

extension SampleBuildContext on BuildContext {
  InheritedData get inherited => InheritedStatefulWidget.of(this);
  InheritedStatefulWidgetState get parent => InheritedStatefulWidget.find(this);
}
