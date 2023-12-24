import 'dart:math';

double dgreeToRadian(double degree) => degree * pi / 180;

({double x, double y}) degreeToCoordinate(
  double degree,
) =>
    (x: cos(dgreeToRadian(degree)), y: sin(dgreeToRadian(degree)));
