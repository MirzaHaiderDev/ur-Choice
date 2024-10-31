import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPtest extends StatefulWidget {
  const OTPtest({Key? key}) : super(key: key);

  @override
  State<OTPtest> createState() => _OTPtestState();
}

class _OTPtestState extends State<OTPtest> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ()async{
          print("working");
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: "+92 304 6473010",
            verificationCompleted: (PhoneAuthCredential credential) {

              print("verificationCompleted___");
              print(credential);
            },
            verificationFailed: (FirebaseAuthException e) {
              print("verificationFailed___");
              print(e);
            },
            codeSent: (String verificationId, int? resendToken) {
              print("codeSent___");
              print(verificationId);
              print(resendToken);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              print("codeAutoRetrievalTimeout___");
              print(verificationId);
            },
          );
        },
          child: Text("button")),
    );
  }
}
