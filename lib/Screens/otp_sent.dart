import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'Utills/Utills.dart';
import 'new_signup1.dart';

class OTPSent_Screen extends StatefulWidget {
  String verificationid;
  OTPSent_Screen({super.key, required this.verificationid});

  @override
  State<OTPSent_Screen> createState() => _OTPSent_ScreenState();
}

class _OTPSent_ScreenState extends State<OTPSent_Screen> {
  OtpFieldController _otpController = OtpFieldController();
  String finalOtp = "0";


  @override
  Widget build(BuildContext context) {


    final defaultPinTheme = PinTheme(
      width: 40,
      height: 50,
      textStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.transparent,
        border: Border.all(color: Colors.green),
      ),
    );



    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      child: Scaffold(
          floatingActionButton: GestureDetector(
            onTap: () async {
              showLoaderDialog(context);
              try {
                print("FPin___");
                print(finalOtp);

                PhoneAuthCredential credential = await PhoneAuthProvider.credential(
                    verificationId: widget.verificationid,
                    smsCode: finalOtp.toString());

                FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 100));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewSignUp1()),
                  );
                });
              } catch (e) {
                var snackBar = SnackBar(content: Text(e.toString()));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }


            },
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              width: 390,
              height: 53,
              decoration: ShapeDecoration(
                color: Color(0xFFA4FDA8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Center(
                child: Text(
                  'Verify ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          backgroundColor: Colors.black,
          body: Center(
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Image.asset("assets/images/back_button.png")),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Code Sent to your Number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child:   Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                      length: 6,

                      onCompleted: (val){
                        setState(() {
                          print("onCompleted");
                          finalOtp = val;
                        });
                      },
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'enter the 6 digit code',
                      style: TextStyle(
                        color: Color(0xFFF9C612),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Countdown(
                      seconds: 120,
                      build: (BuildContext context, double time) => Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Resend in ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: formattedTime(timeInSecond: time.toInt()).toString(),
                              style: TextStyle(
                                color: Color(0xFFF9C612),
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      interval: Duration(milliseconds: 100),
                      onFinished: () {
                        print('Timer is done!');
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );

  }


  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Verifying OTP..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }


  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

}

