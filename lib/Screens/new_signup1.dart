import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'new_signup2.dart';
import 'package:date_format_field/date_format_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class NewSignUp1 extends StatefulWidget {
  const NewSignUp1({Key? key}) : super(key: key);

  @override
  State<NewSignUp1> createState() => _NewSignUp1State();
}

class _NewSignUp1State extends State<NewSignUp1> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final bool expended = false;

  List<String> genderOptions = ['Male', 'Female'];

  TextEditingController _nameController = TextEditingController();
  String _dob = "";
  String _gender = "";
  TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false, // fluter 1.x
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50,left: 30,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 24,left: 3),
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
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xfff9C612)),
                        backgroundColor: Color(0xffD6D6D6),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 30,top: 10),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Create ur’',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Choice ',
                            style: TextStyle(
                              color: Color(0xFFF9C612),
                              fontSize: 24,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Profile',
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
                  ),

                  TextFormField(
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white54),
                      hintText: 'Name',
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      labelStyle: TextStyle(
                        color: Colors.white, //<-- SEE HERE
                      ),
                      labelText: "Name",
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
                  SizedBox(height: 10,),


                  DateFormatField(
                    type: DateFormatType.type2,
                    onComplete: (date){
                      print(date.toString());

                      setState(() {
                        _dob = date.toString();
                      });
                    },
                    addCalendar : false,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white54),
                      hintText: 'dd/mm/yyyy',
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
                      labelText: "Birthday",
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  FormBuilderDropdown<String>(
                    isExpanded : expended,
                    elevation : 300,
                    onChanged: (val){
                      setState(() {
                        _gender = val.toString();
                      });
                    },
                    icon: Icon(Icons.expand_more ,color: Colors.yellow,),
                    alignment: Alignment.centerLeft,
                    items: genderOptions.map((gender) {
                      return DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        value: gender,
                        child: Text(gender),
                      );
                    }


                    )
                        .toList(),
                    name: 'gender',
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.white54),
                      hintText: 'Gender',
                      contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
                      labelText: "Gender",
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),

              Column(
                children: [
                  Container(
                    child: Text(
                      'Warning!',
                      style: TextStyle(
                        color: Color(0xFFE70303),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  const SizedBox(
                    child: Text(
                      'Kindly enter correct information otherwise account might be ban',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE70303),
                        fontSize: 12,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: ()async{
                      if(_validateInputs()){
                        _createAccount();
                      }else{
                        var snackBar = SnackBar(content: Text("Please fill all fields"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      height: 53,
                      decoration: ShapeDecoration(
                        color: Color(0xFFA4FDA8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Next',
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
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

  bool _validateInputs(){
     if(_nameController.text.isNotEmpty &&
         _dob!="" &&
     _gender!= ""){
       return true;
     }else{
       print(_nameController.text);
       print(_dob);
       print(_gender);
       return false;
     }
  }

  _createAccount()async{
    showLoaderDialog(context,"Creating account...");
    try {

      User? currentUser = await FirebaseAuth.instance.currentUser;
      String? uid = currentUser?.uid;

      FirebaseFirestore db = FirebaseFirestore.instance;

      final data = {
        "name" : _nameController.text.toString(),
        "date_of_birth" : _dob,
        "gender" : _gender,

        "email": "",
        "password" : ""
      };


      db.collection("user_ids").doc(uid).set(data, SetOptions(merge: true)).then((value){
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewSignUp2_Screen()),
          );
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
