import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:simple_animations/simple_animations.dart';

enum Gradients {
  gradient1,
  gradient2,
  gradient3,
}

class GradientAnimation extends StatefulWidget {
  @override
  _GradientAnimationState createState() => _GradientAnimationState();
}

class _GradientAnimationState extends State<GradientAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<MultiTweenValues<Gradients>> _gradientAnimation;
  final _gradientTween = MultiTween<Gradients>()
    ..add(Gradients.gradient1, ColorTween(begin: gradients[0].colors.first, end: gradients[0].colors.last))
    ..add(Gradients.gradient2, ColorTween(begin: gradients[1].colors.first, end: gradients[1].colors.last))
    ..add(Gradients.gradient3, ColorTween(begin: gradients[2].colors.first, end: gradients[2].colors.last));




  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat();
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );
    _gradientAnimation = _gradientTween.animate(curvedAnimation);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _gradientAnimation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.5, 1.0],
                  colors: [
                    _gradientAnimation.value.get(Gradients.gradient1)!,
                    _gradientAnimation.value.get(Gradients.gradient2)!,
                    _gradientAnimation.value.get(Gradients.gradient3)!,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

List<Gradient> gradients = [  LinearGradient(    colors: [Colors.red, Colors.orange],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
),
  RadialGradient(
    colors: [Colors.blue, Colors.purple],
    center: Alignment.center,
    radius: 0.7,
  ),
  SweepGradient(
    colors: [Colors.red, Colors.orange],
    startAngle: 0.0,
    endAngle: math.pi * 2,
  ),
];