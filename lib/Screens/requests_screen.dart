import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urchoice/Screens/invite_new_screen.dart';
import 'package:urchoice/Screens/profile_screen.dart';

import 'Utills/ExampleClass.dart';

class Requests_Screen extends StatefulWidget {
  const Requests_Screen({Key? key}) : super(key: key);

  @override
  State<Requests_Screen> createState() => _Requests_ScreenState();
}

class _Requests_ScreenState extends State<Requests_Screen> {
  PageController controller = PageController();
  int tabIndex = 1;
  var list = [1, 2, 3, 4, 5, 6, 7];

  var list2 = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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



                  Row(
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
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InviteNewContact_Screen()),
                          );
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/invite_icon.png", height: 20,width: 20,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
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
                            'Contacts',
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
                                'Recieved',
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
                            child: Text(
                              'Sent',
                              style: TextStyle(
                                color: tabIndex ==2 ? Color(0xFFF9C612) : Colors.white,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),



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
                        requestRecivedContainer(),
                        requestSentContainer()
                      ],
                    ),
                  )





                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget requestRecivedContainer(){
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '7 Requests(Recieved)',
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
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return listItemRRecieved(context, index);
            },

          ),
        ],
      ),
    );
  }
  Widget listItemRRecieved(BuildContext context, int index) {
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
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                Image.asset("assets/images/requests/cancel.png",height: 16,width: 16,),
                SizedBox(width: 15,),
                Image.asset("assets/images/requests/accept.png",height: 16,width: 16,)
              ],
            ),
          )
        ],
      ),
    );
  }



  Widget requestSentContainer(){
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '7 Requests(Sent)',
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
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: list2.length,
            itemBuilder: (BuildContext context, int index) {
              return listItemRSent(context, index);
            },

          ),
        ],
      ),
    );
  }
  Widget listItemRSent(BuildContext context, int index) {
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
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Image.asset("assets/images/requests/cancel.png",height: 16,width: 16,),
          )
        ],
      ),
    );
  }
}
