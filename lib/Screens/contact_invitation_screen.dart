
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urchoice/Screens/Utills/users_Repo.dart';
import 'dart:io';
import 'dart:convert';
import 'package:urchoice/Screens/invite_new_screen.dart';
import 'package:urchoice/Screens/profile_screen.dart';
import 'package:urchoice/Screens/publicmain_screen.dart';
import 'package:urchoice/Screens/requests_screen.dart';

import 'Utills/ExampleClass.dart';

class Contact_Invitation_Screen extends StatefulWidget {
  const Contact_Invitation_Screen({Key? key}) : super(key: key);

  @override
  State<Contact_Invitation_Screen> createState() => _Contact_Invitation_ScreenState();
}

class _Contact_Invitation_ScreenState extends State<Contact_Invitation_Screen> {

  PageController controller = PageController();
  int bnIndex = 1;

  int tabIndex = 1;

  var list = [1, 2, 3, 4, 5, 6, 7];

  bool _searchbar = false;
  @override
  Widget build(BuildContext context) {

    UserRepo.fetchUserData();

    return Scaffold(
      floatingActionButton: Container(
          width: 271,
          height: 68,
        decoration: ShapeDecoration(
          color: Color(0xFF272727),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  bnIndex = 1;
                });
              },
              child: Container(
                width: 96,
                height: 39.90,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(

                  color: bnIndex == 1 ?  Color(0xFF383636) :  Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(children: [
                  Image.asset("assets/images/private_icon.png"),
                  SizedBox(width: 5,),
                  Text(
                    'Private',
                    style: TextStyle(
                      color: Color(0xFFF6F6F6),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
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
                  MaterialPageRoute(builder: (context) =>  PublicMain_Screen()),
                );
                setState(() {

                });
              },
              child: Container(
                width: 114,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: bnIndex == 2 ?  Color(0xFF383636) :  Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(children: [
                  Image.asset("assets/images/logo.png",height: 24,width: 24,),
                  SizedBox(width: 5,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'ur’',
                          style: TextStyle(
                            color: Color(0xFFF6F6F6),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Choice',
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
                  )
                ],),
              ),
            )
          ],
        )

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Center(child: Opacity(
                opacity: 0.5,
                child: Image.asset("assets/images/logo.png"))),
            Container(
              margin: EdgeInsets.only(top: 50, right: 20,left: 20),
              child: Column(
                children: [
                  _searchbar ? Text("True", style: TextStyle(color: Colors.white),) : topBar(),


                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Requests_Screen()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 160,
                          height: 57,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: ShapeDecoration(
                            color: Color(0xFF282727),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Requests',
                              style: TextStyle(
                                color: Color(0xFF173CFF),
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Opacity(
                              opacity: 0.80,
                              child: Text(
                                'Private',
                                style: TextStyle(
                                  color: tabIndex ==1 ? Color(0xFFF9C612) : Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                tabIndex == 1 ? SvgPicture.asset("assets/images/Lgreen_arrow.svg", height: 24, width: 24,) : SvgPicture.asset("assets/images/Lred_arrow.svg", height: 24, width: 24,),
                                SizedBox(width: 15,),
                                tabIndex == 1 ? SvgPicture.asset("assets/images/Rred_arrow.svg", height: 24, width: 24,) : SvgPicture.asset("assets/images/Rgreen_arrow.svg", height: 24, width: 24,),

                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'ur’',
                                    style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Choice',
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
                          )
                        ],
                      )),

                  Expanded(
                    child: PageView(

                      onPageChanged: (value){
                        print(value);
                        setState(() {
                          tabIndex = value+1;
                        });

                      },

                      controller: controller,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: Column(children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 24,bottom: 30),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Private Contacts',
                                          style: TextStyle(
                                            color: Color(0xFFEFEFEF),
                                            fontSize: 20,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      listItem(context, 1),
                                      listItem(context, 2),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 24,bottom: 30),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'All Private Contacts',
                                          style: TextStyle(
                                            color: Color(0xFFEFEFEF),
                                            fontSize: 20,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],),
                              ),
                              Column(
                                children: [
                                  listItem2(context,1),
                                  listItem2(context,1),
                                  listItem2(context,1),
                                  listItem2(context,1),
                                  listItem2(context,1),
                                  listItem2(context,1),
                                  listItem2(context,1),
                                  listItem2(context,1),
                                  listItem2(context,1),
                                ],
                              )
                            ],
                          ),
                        ),

                        urChoiceContainer(),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],

        ),
      ),
    );
  }

  Widget listItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(top: 0,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Row(
            children: [
              Container(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                    child: Image.asset("assets/images/imageplaceholder.png", height: 32, width: 32,)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Muhammad Ali',
                      style: TextStyle(
                        color: Color(0xFFF7F7F7),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,

                      ),
                    ),
                    Opacity(
                      opacity: 0.70,
                      child: Text(
                        'Have you done the project?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                SvgPicture.asset("assets/images/vidcall_icon.svg"),
                SizedBox(width: 15,),
                Image.asset("assets/images/call_icon.png")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listItem2(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(top: 0,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Row(
            children: [
              Container(
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset("assets/images/imageplaceholder.png", height: 32, width: 32,)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Muhammad Ali',
                  style: TextStyle(
                    color: Color(0xFFF7F7F7),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,

                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget topBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile_Screen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: MemoryImage(base64Decode(UserRepo.userI.dp)

                    ),
                  )
              ),
              SizedBox(width: 10,),
              Text(
                UserRepo.userI.name,
                style: TextStyle(
                  color: Color(0xFFF8F8F8),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InviteNewContact_Screen()),
                    );
                    },
                  child: Image.asset("assets/images/invite_icon.png", height: 20,width: 20,)),
              SizedBox(width: 15,),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      _searchbar = !_searchbar;
                    });
                  },
                  child: SvgPicture.asset("assets/images/search_icon.svg", height: 20,width: 20,)),
            ],
          ),
        ),
      ],
    );
  }

  Widget urChoiceContainer(){
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'ur’',
                  style: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'Choice',
                  style: TextStyle(
                    color: Color(0xFFF9C612),
                    fontSize: 20,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return listItem3(context, index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget listItem3(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Row(
            children: [
              Container(
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset("assets/images/imageplaceholder.png", height: 32, width: 32,)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Muhammad Ali',
                      style: TextStyle(
                        color: Color(0xFFF7F7F7),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,

                      ),
                    ),
                    SizedBox(height: 5,),
                    Opacity(
                      opacity: 0.70,
                      child: Text(
                        'Have you done the project?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Follower 76',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Image.asset("assets/images/urChoiceFlag.png",height: 15,width: 15,),
          )
        ],
      ),
    );
  }

}