import 'package:flutter/material.dart';
import 'package:urchoice/Screens/Utills/Utills.dart';
import 'package:urchoice/Screens/terms_ofservice_screen.dart';
import 'package:flutter/animation.dart';
import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';



class DelaySplashScreen extends StatefulWidget {
  const DelaySplashScreen({Key? key}) : super(key: key);

  @override
  State<DelaySplashScreen> createState() => _DelaySplashScreenState();
}

class _DelaySplashScreenState extends State<DelaySplashScreen> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();




  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    AppUtills.app_counter = 1;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
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
                            child: Image.asset("assets/images/innerlogo.png", width: 55,height: 55,),
                          ),
                        ),
                        Center(child: Image.asset("assets/images/outerlogo.png", width: 230,height: 230,)),
                      ],
                    )
                ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 66),
              child: Column(
                children: [


                  Container(
                    margin: EdgeInsets.only(bottom: 10,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       Text(
                         'ur’',
                         style: TextStyle(
                           color: Color(0xFFF7F7F7),
                           fontSize: 24,
                           fontFamily: 'DM Sans',
                           fontWeight: FontWeight.w500,
                           height: 0,
                         ),
                       ),
                        Container(
                          width: 150,
                          child: AnimatedTextKit(
                            pause : Duration(milliseconds: 500),
                            repeatForever: true,
                            animatedTexts: [
                            FadeAnimatedText(   'Choice',
                              textStyle: TextStyle(
                                color: Color(0xFFF9C612),
                                fontSize: 24,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),),
                              FadeAnimatedText(   'Decisión',
                                textStyle: TextStyle(
                                  color: Color(0xFFF9C612),
                                  fontSize: 24,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),),
                              FadeAnimatedText(   'выбор',
                                textStyle: TextStyle(
                                  color: Color(0xFFF9C612),
                                  fontSize: 24,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),),
                           ],
                       ),
                        )
                     ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 15,left: 50,right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Private ',
                                style: TextStyle(
                                  color: Color(0xFFF9C612),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '&Connect Worldwide',
                                style: TextStyle(
                                  color: Color(0xFFF8F8F8),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){


                  /*    FirebaseFirestore db = FirebaseFirestore.instance;
                      final data = {"capital": true};
                      db.collection("cities").doc("BJ").set(data, SetOptions(merge: true));*/

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermsOfService_Screen()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 50,right: 50),
                        height: 53,
                        width: double.infinity,
                        child: Center(child: Text("Connect with phone number", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          color: Color(0xFFF9C612),
                            border: Border.all(
                                color: Colors.transparent,
                                width: 0.0
                            ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(24.0)
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

