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
    _rotationAnimation = Tween(begin: 0.0, end: 5.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // radius animation --> from circle to square
    _radiusAnimation = Tween(begin: 40.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
      backgroundColor: Colors.deepPurple[300],
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // biggest  object
            Transform.rotate(
              angle: _radiusAnimation.value,
              child: Container(
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 114, 64, 199),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      offset: const Offset(-6.0, -6.0),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(-6.0, -6.0),
                    ),
                  ],
                ),
              ),
            ),

            // 2nd biggest
            Transform.rotate(
              angle: _radiusAnimation.value + 0.2,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[500],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),
            //3rd biggest
            Transform.rotate(
              angle: _rotationAnimation.value + 0.4,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),
            //4rd biggest
            Transform.rotate(
              angle: _rotationAnimation.value + 0.6,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),
            //5rd biggest
            Transform.rotate(
              angle: _rotationAnimation.value + 0.8,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[150],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),
            //6rd biggest
            // Transform.rotate(
            //   angle: _rotationAnimation.value + 1,
            //   child: Container(
            //     width: 120,
            //     height: 120,
            //     decoration: BoxDecoration(
            //       color: Colors.deepPurple[100],
            //       borderRadius: BorderRadius.circular(_radiusAnimation.value),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
