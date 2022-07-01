import 'package:flutter/material.dart';
import 'package:sample_inherited_widget/src/components/stateful/item_tag.dart';

class DefaultWidgetTree extends StatelessWidget {
  final Set<String> leftZoneItems;
  final Set<String> rightZoneItems;
  final Function(String, bool) removeItem;
  const DefaultWidgetTree({
    Key? key,
    required this.leftZoneItems,
    required this.rightZoneItems,
    required this.removeItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8),
            height: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: SingleChildScrollView(
              child: Wrap(
                children: List.generate(
                  leftZoneItems.length,
                  (index) => Container(
                      margin: const EdgeInsets.all(3),
                      child: ItemTag(
                        tag: leftZoneItems.toList()[index],
                        removeItemTag: (String item) {
                          removeItem(item, true);
                        },
                      )),
                ),
              ),
            ),
          )),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 200,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: SingleChildScrollView(
                child: Wrap(
                  children: List.generate(
                    rightZoneItems.length,
                    (index) => Container(
                      margin: const EdgeInsets.all(3),
                      child: ItemTag(
                        tag: rightZoneItems.toList()[index],
                        removeItemTag: (String item) {
                          removeItem(item, false);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
