import 'dart:math' as math;

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooPage extends StatefulWidget {
  const FooPage({Key? key}) : super(key: key);

  @override
  State<FooPage> createState() => _FooPageState();
}

class _FooPageState extends State<FooPage> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [

            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: child,
                  );
                },
                child: Container(
                    child: Image.asset("assets/images/innerlogo.png", width: 80,height: 80,)),
              ),
            ),
            Center(child: Image.asset("assets/images/outerlogo.png", width: 230,height: 230,)),
          ],
        )
      ),
    );
  }
}
