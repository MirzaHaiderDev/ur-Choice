import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urchoice/Screens/contact_invitation_screen.dart';

class Set_Security_Screen extends StatefulWidget {
  const Set_Security_Screen({Key? key}) : super(key: key);

  @override
  State<Set_Security_Screen> createState() => _Set_Security_ScreenState();
}

class _Set_Security_ScreenState extends State<Set_Security_Screen> {

  bool _checkFace = false;
  bool _checkPassword = true;
  bool _checkFinger = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 70,right: 20,left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset("assets/images/back_button.png")),
                      Text(
                        'Select Password',
                        style: TextStyle(
                          color: Color(0xFFFCFCFC),
                          fontSize: 24,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 5,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(children: [


                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Checkbox(value: _checkFace,
                            onChanged: (value){
                              setState(() {
                                _checkFace = !_checkFace;
                              });
                            },
                            checkColor: Color(0xFFF9C612),
                            activeColor: Color(0xFFF9C612),
                            side: BorderSide(color: Colors.white, width: 0.5),
                          ),
                        ),
                        Image.asset("assets/images/face_detection_icon.png"),
                        SizedBox(width: 5,),
                        Text(
                          'Face Id',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Checkbox(

                            value: _checkPassword,
                            onChanged: (value){

                            },
                            checkColor: Color(0xFFF9C612),
                            activeColor: Color(0xFFF9C612),
                            side: BorderSide(color: Colors.white, width: 0.5),
                          ),
                        ),
                        Text(
                          '....',
                          style: TextStyle(
                            color: Color(0xFFF9C612),
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(width: 4,),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Checkbox(value: _checkFinger,
                            onChanged: (value){
                              setState(() {
                                _checkFinger = !_checkFinger;
                              });
                            },
                            checkColor: Color(0xFFF9C612),
                            activeColor: Color(0xFFF9C612),
                            side: BorderSide(color: Colors.white, width: 0.5),
                          ),
                        ),
                        Image.asset("assets/images/fingerprint_icon.png"),
                        SizedBox(width: 5,),
                        Text(
                          'Fingerprint',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    )
                  ],),
                  SizedBox(height: 30,),
                ],
              ),





              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Contact_Invitation_Screen()),
                  );
                },
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(bottom: 30),
                  height: 53,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF9C612),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
