library dot;

import 'package:dot/dragController/controller.dart';
import 'package:flutter/material.dart';

/// A Calculator.

class Dot extends StatefulWidget {
  const Dot({
    super.key,
    required this.actions,
    this.stickBackgroundColor,
    this.draggingBackgroundColor,
  });

  final Color? stickBackgroundColor;
  final Color? draggingBackgroundColor;

  final List<ActionProp> actions;

  @override
  State<Dot> createState() => _DotState();
}

class _DotState extends State<Dot> {
  @override
  Widget build(BuildContext context) {
    return DragController(
      actions: widget.actions,
      stickBackgroundColor: widget.stickBackgroundColor,
      draggingBackgroundColor: widget.draggingBackgroundColor,
    );
  }
}
