import 'package:flutter/material.dart';

class AnimationsCubesWidget extends StatefulWidget {
  const AnimationsCubesWidget({Key? key}) : super(key: key);

  @override
  _AnimationsCubesWidgetState createState() => _AnimationsCubesWidgetState();
}

class _AnimationsCubesWidgetState extends State<AnimationsCubesWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();

    // animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    // rotation animation
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // radius animation --> from circle to square
    _radiusAnimation = Tween(begin: 450.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.addListener(() {
      setState(() {});
    });

    // make animation go back and forth
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
    );
  }
}
