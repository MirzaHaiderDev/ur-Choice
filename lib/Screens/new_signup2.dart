import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:urchoice/Screens/welcom_screen.dart';
import 'dart:io';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' as io;

import 'Utills/Utills.dart';

class NewSignUp2_Screen extends StatefulWidget {
  const NewSignUp2_Screen({Key? key}) : super(key: key);

  @override
  State<NewSignUp2_Screen> createState() => _NewSignUp2_ScreenState();
}

class _NewSignUp2_ScreenState extends State<NewSignUp2_Screen> {
  String img64 = "";
  File? _imgFile = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: ()async{


          _addImage();


        },
        child: Container(
          margin: EdgeInsets.only(left: 30,right: 30),
          width: double.maxFinite,
          height: 53,
          decoration: ShapeDecoration(
            color: Color(0xfff9C612),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Center(
            child: Text(
              'Sign up',
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
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.maxFinite,
                height: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: 1.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xfff9C612)),
                    backgroundColor: Color(0xffD6D6D6),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 20,top: 10),
                child: Text(
                  'Add profile picture',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  pickImage();
                },
                child: Container(
                  width: 180,
                  height: 180,
                  margin: EdgeInsets.only(top: 24),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Center(child: Image.asset("assets/images/imagebg.png"))),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 180,
                          height: 180,
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
                          child: _imgFile==null ? Image.asset("assets/images/imageplaceholder.png") : ClipRRect(  borderRadius: BorderRadius.circular(20.0), child: Image.memory(base64Decode(img64),fit: BoxFit.cover))
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor:  Color(0xFFA4FDA8),
                              child: Container(child: Icon(Icons.add,color: Colors.black54,),),
                            ),
                          )
                        ],
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



  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.gallery, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
    if (img == null) return;
    setState(() {
      _imgFile = File(img.path); // convert it to a Dart:io file

      print(_imgFile?.path.toString());

    });


    final bytes = io.File(_imgFile!.path).readAsBytesSync();

    setState(() {
      img64 = base64Encode(bytes);
    });


    print("Image64");
    print(img64);

  }

  showLoaderDialog(BuildContext context,String msg){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text(msg)),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  _addImage()async{
    showLoaderDialog(context,"Uploading image...");
    try {

      User? currentUser = await FirebaseAuth.instance.currentUser;
      String? uid = currentUser?.uid;

      FirebaseFirestore db = FirebaseFirestore.instance;

      final data = {
        "dp" : img64=="" ? AppUtills.dpPlaceholder : img64
      };


      db.collection("user_ids").doc(uid).set(data, SetOptions(merge: true)).then((value){
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      });

    } catch (e) {
      Navigator.pop(context);
      var snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}
