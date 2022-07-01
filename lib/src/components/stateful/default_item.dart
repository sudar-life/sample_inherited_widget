import 'package:flutter/material.dart';

class DefaultItem extends StatelessWidget {
  final String item;
  final Function(bool, String) pushZone;
  const DefaultItem({Key? key, required this.item, required this.pushZone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              pushZone(true, item);
            },
            child: const Text('left'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
            child: Text(
          item,
          textAlign: TextAlign.center,
        )),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              pushZone(false, item);
            },
            child: const Text('right'),
          ),
        )
      ]),
    );
  }
}
