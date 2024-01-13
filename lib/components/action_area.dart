import 'package:flutter/material.dart';

class ActionArea extends StatefulWidget {
  const ActionArea({
    super.key,
    required this.diameter,
    required this.icon,
    required this.position,
    required this.onAccept,
    this.backgroundColor = Colors.amber,
    this.borderColor = Colors.black,
  });

  final double diameter;
  final ({double x, double y}) position;
  final Icon? icon;
  final Color backgroundColor;
  final Color borderColor;

  final void Function() onAccept;

  @override
  State<ActionArea> createState() => _ActionAreaState();
}

class _ActionAreaState extends State<ActionArea> {
  bool isHovering = false;

  void _onAccept(Object _) {
    widget.onAccept();
    isHovering = false;
  }

  void _onLeave(Object? _) {
    setState(() {
      isHovering = false;
    });
  }

  bool _onWillAccept(Object? o) {
    setState(() {
      isHovering = true;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final double diameter = widget.diameter;
    final Icon? icon = widget.icon;
    final ({double x, double y}) position = widget.position;

    return Positioned(
      left: position.x,
      bottom: position.y,
      child: DragTarget(
          onAccept: _onAccept,
          onLeave: _onLeave,
          onWillAccept: _onWillAccept,
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) =>
              Container(
                  width: diameter,
                  height: diameter,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: widget.borderColor,
                        width: 1,
                      ),
                    ),
                    boxShadow: isHovering
                        ? const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 10,
                            )
                          ]
                        : [],
                  ),
                  child: icon)),
    );
  }
}
