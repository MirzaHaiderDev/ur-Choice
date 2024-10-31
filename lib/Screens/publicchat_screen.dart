import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urchoice/Screens/chat_screen.dart';

class PublicChat_Screen extends StatefulWidget {
  const PublicChat_Screen({Key? key}) : super(key: key);

  @override
  State<PublicChat_Screen> createState() => _PublicChat_ScreenState();
}

class _PublicChat_ScreenState extends State<PublicChat_Screen> {
  var list = ["Mirza","Haider", "Ali", "Flutter" , "Developer"];


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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/back_button.png", height: 20, width: 20,),
                      SizedBox(width: 10,),
                      Text(
                        'Public Chat',
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

                  Row(
                    children: [
                      Image.asset("assets/images/logo.png",height: 40,width: 40,),
                      Image.asset("assets/images/public/genderchange_icon.png", height: 20, width: 20,),
                      SizedBox(width: 10,),
                      SvgPicture.asset("assets/images/search_icon.svg", height: 20,width: 20,)
                    ],
                  )

                ],
              ),

              Container(
                margin: EdgeInsets.only(right: 100,top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                    opacity: 0.90,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'ur’',
                            style: TextStyle(
                              color: Color(0xFFF3EEEE),
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Choice\n',
                            style: TextStyle(
                              color: Color(0xFFF9C612),
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Region ',
                            style: TextStyle(
                              color: Color(0xFFF3EEEE),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Pakistan',
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
                    Image.asset("assets/images/public/gender_icon.png", height: 40, width: 40,),
                    SizedBox(height: 2,),
                  ],
                ),
              ),


              Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return listItem(context, index);
                    },

                  ))

            ],
          ),
        ),
      ),
    );
  }


  Widget listItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(top: 20,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chat_Screen()),
              );
            },
            child: Container(
              child: Row(
                children: [
                  Container(
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 15,
                        child: Image.asset("assets/images/imageplaceholder.png",)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          list[index],
                          style: TextStyle(
                            color: Color(0xFFF7F7F7),
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,

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
            ),
          ),
          Image.asset("assets/images/profile/id_icon.png", height: 40, width: 40,),
        ],
      ),
    );
  }
}
