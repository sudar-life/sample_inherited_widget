import 'package:flutter/material.dart';
import 'package:sample_inherited_widget/src/pages/inherited_widget_sample.dart';

class InItemTag extends StatelessWidget {
  final bool isRightZone;
  final int index;
  InItemTag({
    Key? key,
    required this.isRightZone,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var target = InheritedStatefulWidget.find(context);
    var inheritedData = InheritedStatefulWidget.of(context);
    var rightItem = '';
    var leftItem = '';
    if (isRightZone) {
      rightItem = inheritedData.rightProducts.toList()[index];
    } else {
      leftItem = inheritedData.leftProducts.toList()[index];
    }
    return GestureDetector(
      onTap: () {
        if (isRightZone) {
          target.removeRightItem(rightItem);
        } else {
          target.removeLeftItem(leftItem);
        }
      },
      child: Container(
        width: 50,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue),
          color: Colors.blue.shade50,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                isRightZone ? rightItem : leftItem,
                style: const TextStyle(fontSize: 13, color: Colors.blue),
              ),
            ),
            const Positioned(
              right: 3,
              child: Icon(
                Icons.close,
                size: 14,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
