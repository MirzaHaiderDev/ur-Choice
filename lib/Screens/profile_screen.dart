import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urchoice/Screens/Utills/Utills.dart';
import 'dart:convert';
import 'package:urchoice/Screens/accounthistory_screen.dart';
import 'package:urchoice/Screens/delay_splash_screen.dart';
import 'package:urchoice/Screens/editaccount_screen.dart';
import 'package:urchoice/Screens/followers_screen.dart';
import 'package:urchoice/Screens/yourposts_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'Utills/ExampleClass.dart';
import 'blockedaccount_screen.dart';
import 'changeprofilepic_screen.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFF494949),
        onPressed: (){

        },
        child: Icon(Icons.add,color: Color(0xFFF9C612), size: 40,),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50, right: 20,left: 20),
          child: Column(
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
                    'Profile',
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
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    UserRepo.userI.dp==""? Image.asset("assets/images/dp_placeholder.png" , height: 60, width: 60,) : ClipRRect(borderRadius: BorderRadius.circular(20.0),child: Image.memory(base64Decode(UserRepo.userI.dp) , height: 60, width: 60,)),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => YourPosts_Screen()),
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            margin: EdgeInsets.only(right: 10),
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Opacity(
                                  opacity: 0.80,
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Posts',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 0.08,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Followers_Screen()),
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            margin: EdgeInsets.only(right: 10),
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Opacity(
                                  opacity: 0.80,
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 0.08,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Followers_Screen()),
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            margin: EdgeInsets.only(right: 10),
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Opacity(
                                  opacity: 0.80,
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 0.08,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )



                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Image.asset("assets/images/profile/private_ac.png" , height: 12, width: 12,),
                        SizedBox(width: 10,),
                        Text(
                          'Private Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFEFE6E6),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),

                    FlutterSwitch(
                      height: 20.0,
                      width: 45.0,
                      padding: 2.0,
                      toggleSize: 15.0,
                      borderRadius: 10.0,
                      activeColor: Colors.yellow,
                      value: _switchValue,
                      onToggle: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),




                ],),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditAccount_Screen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(children: [
                    Image.asset("assets/images/profile/edit_ac.png" , height: 12, width: 12,),
                    SizedBox(width: 10,),
                    Text(
                      'Edit Account details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFEFE6E6),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],),
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangeProfilePic_Sreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(children: [
                    Image.asset("assets/images/profile/editPF.png" , height: 12, width: 12,),
                    SizedBox(width: 10,),
                    Text(
                      'Edit Profile Picture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFEFE6E6),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],),
                ),
              ),



              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountHistory_Screen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(children: [
                    Image.asset("assets/images/profile/private_ac.png" , height: 12, width: 12,),
                    SizedBox(width: 10,),
                    Text(
                      'History',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFEFE6E6),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],),
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlockedAccount_Screen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(children: [
                    Image.asset("assets/images/profile/private_ac.png" , height: 12, width: 12,),
                    SizedBox(width: 10,),
                    Text(
                      'Blocked Accounts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFEFE6E6),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _logout();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(children: [
                    Image.asset("assets/images/profile/logout.png" , height: 12, width: 12,),
                    SizedBox(width: 10,),
                    Text(
                      'Log Out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFEFE6E6),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logout()async{
    await FirebaseAuth.instance.signOut().then((value) {
      if(AppUtills.app_counter == 1){
        Navigator.of(context).popUntil(ModalRoute.withName("/SplashScreen"));
      }else{
        Navigator.of(context).popUntil(ModalRoute.withName("/home"));
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DelaySplashScreen()),);

      }

    });
  }
}
