import 'package:flutter/material.dart';

class BuildButton extends StatefulWidget {
  final Text text;
  final Color color;
  final double borderRadius;
  final double? width;
  final double? height;

  const BuildButton({
    Key? key,
    required this.text,
    required this.color,
    this.borderRadius = 8.0,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<BuildButton> createState() => _BuildButtonState();
  
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text.data!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Option 1',
                child: Text('Option 1'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 2',
                child: Text('Option 2'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 3',
                child: Text('Option 3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
