import 'package:flutter/material.dart';

class DefaultItem extends StatefulWidget {
  final String item;
  final Function(bool, String) pushZone;
  const DefaultItem({Key? key, required this.item, required this.pushZone})
      : super(key: key);

  @override
  State<DefaultItem> createState() => _DefaultItemState();
}

class _DefaultItemState extends State<DefaultItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              widget.pushZone(true, widget.item);
            },
            child: const Text('left'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
            child: Text(
          widget.item,
          textAlign: TextAlign.center,
        )),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              widget.pushZone(false, widget.item);
            },
            child: const Text('right'),
          ),
        )
      ]),
    );
  }
}
