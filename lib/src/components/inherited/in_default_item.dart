import 'package:flutter/material.dart';
import 'package:sample_inherited_widget/src/pages/inherited_widget_sample.dart';

class InDefaultItem extends StatelessWidget {
  const InDefaultItem({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    var item = context.inherited.products.toList()[index!];
    var target = context.parent;

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
