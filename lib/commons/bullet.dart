import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:my_personal_website/commons/triangular_bullet.dart';

class Bullet extends StatelessWidget {
  const Bullet({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90 * math.pi / 180,
      child: const CustomPaint(
        painter:  TriangularBullet(),
        child: SizedBox(
          height: 8,
          width: 10,
        ),
      ),
    );
  }
}
