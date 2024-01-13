import 'package:flutter/material.dart';
import 'package:dot_controller/dot_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    final dragController = DotController(
      actions: [
        ActionProp(
          icon: const Icon(Icons.remove),
          backgroundColor: Colors.red,
          borderColor: Colors.black,
          onAccept: () {},
        ),
      ],
    );
    expect(dragController.actions.length, 1);
  });
}
