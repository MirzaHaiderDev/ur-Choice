import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:date_format_field/date_format_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EditAccount_Screen extends StatefulWidget {
  const EditAccount_Screen({Key? key}) : super(key: key);

  @override
  State<EditAccount_Screen> createState() => _EditAccount_ScreenState();
}

class _EditAccount_ScreenState extends State<EditAccount_Screen> {
  String _dobO = "";
  String _genderO = "";


  String _dobN = "";
  String _genderN = "";

  List<String> genderOptions = ['Male', 'Female', 'Other'];
  bool _passwordVisible = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _dobController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    readdata();


    return Scaffold(
      resizeToAvoidBottomInset : false,

      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50, right: 20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Edit your acocunt',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0.05,
                    letterSpacing: -0.24,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 50,bottom: 20),
                child: Text(
                  'Name',
                  style: TextStyle(
                    color: Color(0xFFF7F7F7),
                    fontSize: 15,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: _nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.white54),
                    hintText: 'Name',
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    labelStyle: TextStyle(
                      color: Colors.white, //<-- SEE HERE
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xfff9C612)),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfff9C612),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(top: 20,bottom: 20),
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Color(0xFFF7F7F7),
                    fontSize: 15,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.white54),
                    hintText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    labelStyle: TextStyle(
                      color: Colors.white, //<-- SEE HERE
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xfff9C612)),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfff9C612),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(top: 20,bottom: 20),
                child: const Text(
                  'Date of Birth',
                  style: TextStyle(
                    color: Color(0xFFF7F7F7),
                    fontSize: 15,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
              ),
              Flexible(
                child: DateFormatField(
                  type: DateFormatType.type2,
                  onComplete: (date){
                    print(date.toString());

                    setState(() {
                      _dobN = date.toString();
                    });
                  },
                  addCalendar : false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.white54),
                    hintText: _dobN=="" ?_dobO : _dobN,
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    labelStyle: TextStyle(
                      color: Colors.white, //<-- SEE HERE
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(top: 20,bottom: 20),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Color(0xFFF7F7F7),
                    fontSize: 15,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white),
                 // controller: myControllerPass,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.white54),
                    hintText: 'Password',
                    //errorText: _validatePass ? "Value Can't Be Empty" : null,
                    suffixIcon: IconButton(

                      icon:  _passwordVisible ? Image.asset("assets/images/eye_icon.png", color: Colors.yellow, height: 24, width: 24,) : Image.asset("assets/images/eye_icon.png" ,height: 24, width: 24,),

                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),


                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xfff9C612)),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfff9C612),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20,bottom: 20),
                child: Text(
                  'Gender',
                  style: TextStyle(
                    color: Color(0xFFF7F7F7),
                    fontSize: 15,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
              ),
              Flexible(
                child: FormBuilderDropdown<String>(
                  onChanged: (val){
                    setState(() {
                      _genderN = val.toString();
                    });
                  },
                  icon: Icon(Icons.expand_more ,color: Colors.yellow,),
                  alignment: Alignment.centerLeft,
                  items: genderOptions
                      .map((gender) => DropdownMenuItem(
                    alignment: AlignmentDirectional.centerStart,
                    value: gender,
                    child: Text(gender),
                  ))
                      .toList(),
                  name: 'gender',
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.white54),
                    hintText: _genderN==""? _genderO : _genderN,
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    labelStyle: TextStyle(
                      color: Colors.white, //<-- SEE HERE
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xfff9C612)),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfff9C612),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),


                  ),
                ),
              ),


              GestureDetector(
                onTap: (){
                  updateData();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Color(0xFFC79E0D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  readdata() async {

    User? currentUser = await FirebaseAuth.instance.currentUser;
    String? uid = currentUser?.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("user_ids").doc(uid).get().then((DocumentSnapshot documentSnapshot) {

      print(documentSnapshot["name"]);
      print(documentSnapshot["email"]);
      print(documentSnapshot["date_of_birth"]);
      print(documentSnapshot["password"]);
      print(documentSnapshot["gender"]);


      setState(() {
        _genderO = documentSnapshot["gender"];
        _dobO = documentSnapshot["date_of_birth"];
      });




      _nameController.text=documentSnapshot["name"];
      _emailController.text=documentSnapshot["email"];
      _dobController.text=documentSnapshot["date_of_birth"];
      _passwordController.text=documentSnapshot["password"];

    });
  }

  updateData()async{
    print(_dobO);
    print(_genderO);

    showLoaderDialog(context,"Updating account...");
    try {

      User? currentUser = await FirebaseAuth.instance.currentUser;
      String? uid = currentUser?.uid;

      FirebaseFirestore db = FirebaseFirestore.instance;

      final data = {
        "name" : _nameController.text.toString(),
        "email": _emailController.text.toString(),
        "password" : _passwordController.text.toString(),
        "date_of_birth" : _dobN=="" ?_dobO : _dobN,
        "gender" : _genderN==""? _genderO : _genderN,
      };

      db.collection("user_ids").doc(uid).set(data, SetOptions(merge: true)).then((value){
        Navigator.pop(context);
      });



    } catch (e) {
      Navigator.pop(context);
      var snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
}
