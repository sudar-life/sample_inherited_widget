import 'package:flutter/material.dart';
import 'package:sample_inherited_widget/src/components/inherited/in_item_tag.dart';
import 'package:sample_inherited_widget/src/pages/inherited_widget_sample.dart';

class InDefaultWidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var inheritedData = InheritedStatefulWidget.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 200,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Wrap(
                children: List.generate(
                  inheritedData.leftProducts.length,
                  (index) => Container(
                      margin: const EdgeInsets.all(3),
                      child: InItemTag(isRightZone: false, index: index)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 200,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Wrap(
                children: List.generate(
                  inheritedData.rightProducts.length,
                  (index) => Container(
                      margin: const EdgeInsets.all(3),
                      child: InItemTag(isRightZone: true, index: index)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
