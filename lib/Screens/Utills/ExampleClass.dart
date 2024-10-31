
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:urchoice/Screens/Utills/user_dataModel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserRepo {



  static String userDPUrl= "";
  static UserItem userI = UserItem("", "", "", "", "", "");


  static Future<void> fetchUserDP() async {

    User? currentUser = await FirebaseAuth.instance.currentUser;
    String? uid = currentUser?.uid;
    FirebaseStorage storage = FirebaseStorage.instance;
    //Create a reference to the location you want to upload to in firebase
    Reference reference = storage.ref().child("Images/"+uid.toString()+"/Profile_Picture").child("dp.jpg");
    reference.getDownloadURL().then((value){

      userDPUrl = value.toString();

    });
  }


  static Future<void> fetchUserData() async {

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
      String gender = documentSnapshot["gender"];
      String dp = documentSnapshot["dp"];

      userI = UserItem(name,email,pass,dob,gender,dp);

      print("testing user");
      print(userI.name);
      print(userI.email);
      print(userI.pass);
      print(userI.dob);
      print(userI.gender);
      print(userI.dp);


    });
  }

}




