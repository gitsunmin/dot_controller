import 'package:dot/dragController/action_area.dart';
import 'package:dot/dragController/stick.dart';
import 'package:dot/utils/math.dart';
import 'package:flutter/material.dart';
// import './utils/math.dart';
// import './components/dragController/action_area.dart';
// import './components/dragController/stick.dart';
// import 'package:code_flashcard/helpers/logger.helper.dart';

class ActionProp {
  ActionProp({
    required this.icon,
    required this.onAccept,
    this.onLeave,
    this.onWillAccept,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
  });

  final Icon icon;
  final void Function() onAccept;
  final void Function(Object?)? onLeave;
  final bool Function(Object?)? onWillAccept;

  final Color backgroundColor;
  final Color borderColor;
}

class DragController extends StatefulWidget {
  const DragController({
    super.key,
    required this.actions,
    this.stickBackgroundColor,
    this.draggingBackgroundColor,
  });

  final Color? stickBackgroundColor;
  final Color? draggingBackgroundColor;

  final List<ActionProp> actions;

  @override
  State<DragController> createState() => _DragControllerState();
}

class _DragControllerState extends State<DragController> {
  bool isDragging = false;

  ({double x, double y}) _positioner(
      {required int index,
      required int count,
      required double defaultLeft,
      required double defaultBottom,
      required double distance}) {
    final (:x, :y) = switch (count) {
      1 => (x: 0, y: 1),
      2 => degreeToCoordinate(
          120 - (index * 60),
        ),
      3 => degreeToCoordinate(
          150 - (index * 60),
        ),
      4 => degreeToCoordinate(
          180 - (index * 60),
        ),
      5 => degreeToCoordinate(
          180 - (index * 45),
        ),
      6 => degreeToCoordinate(
          180 - (index * 36),
        ),
      _ => (x: 0, y: 0),
    };

    return (y: y * distance + defaultBottom, x: x * distance + defaultLeft);
  }

  void _onDragStarted() {
    setState(() {
      isDragging = true;
    });
  }

  void _onDraggableCanceled(Velocity _, Offset __) {
    setState(() {
      isDragging = false;
    });
  }

  void _onAccept(ActionProp button) {
    setState(() {
      button.onAccept();
      isDragging = false;
    });
  }

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    const double diameter = 50.0;
    const double distance = diameter * 2;
    final origin = (x: (screenWidth / 2) - diameter / 2, y: 100.0);

    return Stack(
      children: [
        if (isDragging)
          ...widget.actions
              .asMap()
              .map(
                (index, button) => MapEntry(
                  index,
                  ActionArea(
                    backgroundColor: button.backgroundColor,
                    borderColor: button.borderColor,
                    onAccept: () => _onAccept(button),
                    diameter: diameter,
                    icon: button.icon,
                    position: _positioner(
                      index: index,
                      count: widget.actions.length,
                      distance: distance,
                      defaultLeft: origin.x,
                      defaultBottom: origin.y,
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        Positioned(
          left: origin.x,
          bottom: origin.y,
          child: Stack(
            children: [
              Draggable(
                data: 'DragController',
                onDragStarted: _onDragStarted,
                onDraggableCanceled: _onDraggableCanceled,
                feedback: Stick(
                  diameter: diameter,
                  feedback: true,
                  color: widget.draggingBackgroundColor,
                ),
                childWhenDragging: Container(),
                child: Stick(
                  diameter: diameter,
                  color: widget.stickBackgroundColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
