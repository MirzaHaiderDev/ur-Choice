import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:urchoice/Screens/Utills/user_dataModel.dart';
import 'package:firebase_storage/firebase_storage.dart';


class user_Repo{

  static late File userDP;

  static _fetchUserData()async{
    User? currentUser = await FirebaseAuth.instance.currentUser;
    String? uid = currentUser?.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("user_ids").doc(uid).get().then((DocumentSnapshot documentSnapshot) {

      print(documentSnapshot["email"]);
      print(documentSnapshot["date_of_birth"]);
      print(documentSnapshot["password"]);

      String name = documentSnapshot["name"];
      String email = documentSnapshot["email"];
      String dob = documentSnapshot["date_of_birth"];
      String pass = documentSnapshot["password"];

    /*_nameController.text=documentSnapshot["name"];
      _emailController.text=documentSnapshot["email"];
      _dobController.text=documentSnapshot["date_of_birth"];
      _passwordController.text=documentSnapshot["password"];*/





    });
  }

  static _fetchUserDP()async{
    User? currentUser = await FirebaseAuth.instance.currentUser;
    String? uid = currentUser?.uid;
    FirebaseStorage storage = FirebaseStorage.instance;
    //Create a reference to the location you want to upload to in firebase
    Reference reference = storage.ref().child("Images/"+uid.toString()+"/Profile_Picture").child("dp.jpg");
    reference.getDownloadURL().then((value){


      String userDPUrl = value.toString();

      userDP = File(userDPUrl);

    });
  }
}