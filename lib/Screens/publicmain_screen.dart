import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:urchoice/Screens/publicchat_screen.dart';
import 'package:urchoice/Screens/shop_screen.dart';

import 'Utills/ExampleClass.dart';
import 'contact_invitation_screen.dart';

class PublicMain_Screen extends StatefulWidget {
  const PublicMain_Screen({Key? key}) : super(key: key);

  @override
  State<PublicMain_Screen> createState() => _PublicMain_ScreenState();
}

class _PublicMain_ScreenState extends State<PublicMain_Screen> {
  PageController controller = PageController();
  int bnIndex = 2;

  @override
  Widget build(BuildContext context) {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Contact_Invitation_Screen()),
                  );
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
        child: Container(

            child: PageView(
              onPageChanged: (value){
                print(value);
              },
              controller: controller,

              children: [
                publicmainContainer(),
                otherPersonContainer(),
                groupChatContainer(),
              ],

            )

        ),
      ),
    );
  }

  Widget publicmainContainer(){
    return Stack(
      children: [
        Image.asset('assets/images/star_bg.png',fit: BoxFit.fill, height: double.maxFinite, width: double.maxFinite,),

        Container(
          margin: EdgeInsets.only(top: 50, right: 20,left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/public/micoff_icon.png", height: 40, width: 40,),
                        Image.asset("assets/images/public/cameraoff_icon.png", height: 40, width: 40,),
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/imageplaceholder.png"),

                        ),
                        Text(
                          UserRepo.userI.name,
                          style: TextStyle(
                            color: Color(0xFFF7F7F7),
                            fontSize: 14,
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
                        Image.asset("assets/images/logo.png",height: 40,width: 40,),

                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Shop_Screen()),
                              );
                            },
                            child: Image.asset("assets/images/public/daimond_icon.png", height: 24, width: 24,)),

                        SizedBox(width: 10,),
                        Image.asset("assets/images/public/genderchange_icon.png", height: 24, width: 24,),
                      ],
                    ),
                  )

                ],
              ),

              CircleAvatar(
                radius: 80,
                backgroundImage: MemoryImage(base64Decode(UserRepo.userI.dp)),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PublicChat_Screen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 120),
                  child: Text(
                    '+Chat With People',
                    style: TextStyle(
                      color: Color(0xFFF9C612),
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
        )
      ],
    );
  }

  Widget otherPersonContainer(){
    return Stack(
      children: [
        Container(
          color: Colors.black,
        ),

        Container(
          margin: EdgeInsets.only(top: 50, right: 20,left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/public/micoff_icon.png", height: 40, width: 40,),
                        Image.asset("assets/images/public/cameraoff_icon.png", height: 40, width: 40,),
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/imageplaceholder.png"),

                        ),
                        Text(
                          'M Ali',
                          style: TextStyle(
                            color: Color(0xFFF7F7F7),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Image.asset("assets/images/profile/id_icon.png", height: 40,width: 40,),
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/logo.png",height: 40,width: 40,),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Shop_Screen()),
                              );
                            },
                            child: Image.asset("assets/images/public/daimond_icon.png", height: 24, width: 24,)),
                        SizedBox(width: 10,),
                        Image.asset("assets/images/public/genderchange_icon.png", height: 24, width: 24,),
                      ],
                    ),
                  )

                ],
              ),


              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/public/photoplaceholder.png"),
              ),

              //Image.asset("assets/images/public/photoplaceholder.png", height: 160, width: 160,),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PublicChat_Screen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 120),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Image.asset("assets/images/public/photoplaceholder.png", height: 170, width: 148,),
                       ],
                      ),
                      Text(
                        '+Chat With People',
                        style: TextStyle(
                          color: Color(0xFFF9C612),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }


  var list = ["Mirza","Haider", "Ali", "Flutter" ];
  Widget groupChatContainer(){
    return Stack(

      children: [
        Image.asset('assets/images/star_bg.png',fit: BoxFit.fill, height: double.maxFinite, width: double.maxFinite,),

        Container(
          margin: EdgeInsets.only(top: 50, right: 20,left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    'Chat With People',
                    style: TextStyle(
                      color: Color(0xFFF9C612),
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),

                  Text(
                    'Group Chat',
                    style: TextStyle(
                      color: Color(0xFFEFEEED),
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/logo.png",height: 40,width: 40,),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Shop_Screen()),
                              );
                            },
                            child: Image.asset("assets/images/public/daimond_icon.png", height: 24, width: 24,)),
                        SizedBox(width: 10,),
                        Image.asset("assets/images/public/genderchange_icon.png", height: 24, width: 24,),
                      ],
                    ),
                  )

                ],
              ),

              Expanded(
                child: Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,  // The length Of the array
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ), // The size of the grid box
                    itemBuilder: (context, index) =>
                        gridItem(index),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

  Widget gridItem(int index){
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: 211,
      height: 352,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/public/dummy_groupVCall.png"),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          Column(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage("assets/images/public/photoplaceholder.png"),

              ),
              Text(
                'Ammar haider',
                style: TextStyle(
                  color: Color(0xFFF7F7F7),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Image.asset("assets/images/profile/id_icon.png", height: 40, width: 40,),
            ],
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/public/micoff_icon.png", height: 40, width: 40,),
              Image.asset("assets/images/public/cameraoff_icon.png", height: 40, width: 40,),
            ],
          )
        ],
      ),
    );
  }

}
