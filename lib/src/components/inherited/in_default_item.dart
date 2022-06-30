import 'package:flutter/material.dart';
import 'package:sample_inherited_widget/src/pages/inherited_widget_sample.dart';

class InDefaultItem extends StatelessWidget {
  int? index;
  InDefaultItem({this.index});

  @override
  Widget build(BuildContext context) {
    var inheritedData = InheritedStatefulWidget.of(context);
    var item = inheritedData.products.toList()[index!];
    var target = InheritedStatefulWidget.find(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              target.leftAddProducts(item);
            },
            child: const Text('left'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(child: Text(item, textAlign: TextAlign.center)),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              target.rightAddProducts(item);
            },
            child: const Text('right'),
          ),
        )
      ]),
    );
  }
}
