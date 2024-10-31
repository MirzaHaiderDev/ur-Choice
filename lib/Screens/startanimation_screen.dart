import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'delay_splash_screen.dart';
class StartAnimation_Screen extends StatefulWidget {
  const StartAnimation_Screen({Key? key}) : super(key: key);

  @override
  State<StartAnimation_Screen> createState() => _StartAnimation_ScreenState();
}

class _StartAnimation_ScreenState extends State<StartAnimation_Screen>with SingleTickerProviderStateMixin {
  double height = 200;
  late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
  bool play1 = false;
  @override
  Widget build(BuildContext context) {
    movT();
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(seconds: 2),
            height: height,
            child: Container(height: 200, width: 200),
            onEnd: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DelaySplashScreen()),);
            },
          ),
          Container(
            child: Container(
              height: 200, width: 200,

                child :  Container(
                  height: 200,
                  width: 200,

                  margin: EdgeInsets.only(top: 50),
                  child: Center(
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
                              child: Image.asset("assets/images/innerlogo.png", width: 55,height: 55, fit: BoxFit.cover,),
                            ),
                          ),
                          Center(child: Image.asset("assets/images/outerlogo.png", width: 230,height: 230, )),
                        ],
                      )
                  ),
                ),

            ),

          ),
        ],
      );

  }

  movT(){

    if(play1 == false){
      Future.delayed(const Duration(milliseconds: 500), () {

        setState(() {
          play1 = true;
          height = height == 0 ? 200 : 0;// Here you can write your code for open new view
        });

      });
    }




  }

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }
}
