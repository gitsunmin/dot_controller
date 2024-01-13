import 'package:flutter/material.dart';

class Stick extends StatelessWidget {
  const Stick({
    super.key,
    this.feedback = false,
    required this.diameter,
    this.icon,
    this.color,
  });

  final bool feedback;
  final double diameter;
  final Icon? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return switch (feedback) {
      true => Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: const Border.fromBorderSide(
                BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              )),
          child: icon),
      false => Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: const Border.fromBorderSide(
              BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          child: icon,
        ),
    };
  }
}
