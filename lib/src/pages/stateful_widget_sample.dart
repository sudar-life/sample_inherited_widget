import 'package:flutter/material.dart';
import 'package:sample_inherited_widget/src/components/stateful/default_item.dart';
import 'package:sample_inherited_widget/src/components/stateful/default_widget_tree.dart';
import 'package:sample_inherited_widget/src/utils/string_utils.dart';

class StatefulWidgetSample extends StatefulWidget {
  StatefulWidgetSample({Key? key}) : super(key: key);

  @override
  State<StatefulWidgetSample> createState() => _StatefulWidgetSampleState();
}

class _StatefulWidgetSampleState extends State<StatefulWidgetSample> {
  Set<String> products = {};
  Set<String> leftProducts = {};
  Set<String> rightProducts = {};

  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('즐겨찾는 상품')),
      body: Column(
        children: [
          DefaultWidgetTree(
            leftZoneItems: leftProducts,
            rightZoneItems: rightProducts,
            removeItem: (String item, bool isLeftZone) {
              if (isLeftZone) {
                leftProducts.remove(item);
              } else {
                rightProducts.remove(item);
              }
              products.add(item);
              update();
            },
          ),
          const Divider(height: 1, color: Colors.grey),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  products.length,
                  (index) => DefaultItem(
                    item: products.toList()[index],
                    pushZone: (bool isLeftZone, String item) {
                      if (isLeftZone) {
                        leftProducts.add(item);
                      } else {
                        rightProducts.add(item);
                      }
                      products.remove(item);
                      update();
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            products.add(StringUtils.getRandomString(2));
            update();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
