import 'package:flutter/material.dart';

class ItemTag extends StatefulWidget {
  final String tag;
  final Function(String) removeItemTag;
  const ItemTag({
    Key? key,
    required this.tag,
    required this.removeItemTag,
  }) : super(key: key);

  @override
  State<ItemTag> createState() => _ItemTagState();
}

class _ItemTagState extends State<ItemTag> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.removeItemTag(widget.tag);
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
                widget.tag,
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
