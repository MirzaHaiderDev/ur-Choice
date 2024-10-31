import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'Utills/ExampleClass.dart';

class ChangeProfilePic_Sreen extends StatefulWidget {
  const ChangeProfilePic_Sreen({Key? key}) : super(key: key);

  @override
  State<ChangeProfilePic_Sreen> createState() => _ChangeProfilePic_SreenState();
}

class _ChangeProfilePic_SreenState extends State<ChangeProfilePic_Sreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
      child: Container(
        margin: EdgeInsets.only(top: 50, right: 20,left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/images/back_button.png")),
              ],
            ),
            Container(

              margin: EdgeInsets.only(top: 40),

              child: Text(
                'Change Profile Pic',
                style: TextStyle(
                  color: Color(0xFFFFFEFE),
                  fontSize: 24,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),


            ),

            Container(
              width: 180,
              height: 180,

              margin: EdgeInsets.only(top: 24),
              child: Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Center(child: Image.asset("assets/images/imagebg.png"))),

                  Container(
                      width: 180,
                      height: 180,
                      margin: EdgeInsets.only(top: 20),

                      decoration: BoxDecoration(

                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                        ),
                        /* image: DecorationImage(
                              image: FileImage(_imgFile!),
                              fit: BoxFit.cover,
                            ),*/
                      ),
                      child: UserRepo.userI.dp=="" ? Image.asset("assets/images/imageplaceholder.png") : ClipRRect(  borderRadius: BorderRadius.circular(20.0),  child: Image.memory(base64Decode(UserRepo.userI.dp),fit: BoxFit.cover))
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/images/profile/editPF.png"),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 50),
              height: 50,
              decoration: ShapeDecoration(
                color: Color(0xFFC79E0D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Center(
                child: Text(
                  'Save Changes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      ),
    );
  }

}
