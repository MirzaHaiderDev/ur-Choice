import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urchoice/Screens/otp_sent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_code_picker/country_code_picker.dart';

class VerifyNumber_Screen extends StatefulWidget {
  const VerifyNumber_Screen({Key? key}) : super(key: key);

  @override
  State<VerifyNumber_Screen> createState() => _VerifyNumber_ScreenState();
}

class _VerifyNumber_ScreenState extends State<VerifyNumber_Screen> {
  TextEditingController _noController = TextEditingController();

  String countrycode = "+92";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: (){
          showLoaderDialog(context);

          String no = _noController.text.toString();
          print(no);

          no = countrycode+no;
          sendOtp(no);

        },
        child: Container(
          margin: EdgeInsets.only(left: 30,right: 30),
          width: 390,
          height: 53,
          decoration: ShapeDecoration(
            color: Color(0xFFA4FDA8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: const Center(
            child: Text(
              'Verify Number',
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
          margin: EdgeInsets.only(top: 50,left: 30,right: 30),
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
                      'Your Mobile Number',
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
                margin: const EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    Container(
                      color: Colors.black,
                      width: 100,
                      height: 50,
                      child:  CountryCodePicker(
                        searchStyle : TextStyle(color: Colors.white),
                        dialogTextStyle: TextStyle(color: Colors.white),
                        barrierColor: Colors.white10,
                        backgroundColor: Colors.black,
                        dialogBackgroundColor: Colors.black,
                        textStyle : TextStyle(color: Colors.white),
                        padding: EdgeInsets.all(2),
                        onChanged: (val){
                          setState(() {
                            countrycode = val.toString();
                            print(countrycode);
                          });
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'PK',
                        favorite: ['+39','FR',"+49"],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),
                    ),
                    Flexible(
                        child: TextFormField(
                          controller: _noController,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),

                            labelStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7), //<-- SEE HERE
                            ),
                            hintText: '123456',
                            hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(0),
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
      ),
    );
  }

  sendOtp(String no)async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: no,
      verificationCompleted: (PhoneAuthCredential credential) {

        print("verificationCompleted___");
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Navigator.pop(context);
        print("verificationFailed___");
        print(e);
        var snackBar = SnackBar(content: Text(e.message.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      codeSent: (String verificationId, int? resendToken) {
        print("codeSent___");
        print(verificationId);
        print(resendToken);

        Navigator.pop(context);
        Future.delayed(Duration(milliseconds: 500));

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OTPSent_Screen(verificationid: verificationId,)),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("codeAutoRetrievalTimeout___");
        print(verificationId);
      },
    );
  }


  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Sending OTP..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

}
