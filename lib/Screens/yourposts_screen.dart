import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourPosts_Screen extends StatefulWidget {
  const YourPosts_Screen({Key? key}) : super(key: key);

  @override
  State<YourPosts_Screen> createState() => _YourPosts_ScreenState();
}

class _YourPosts_ScreenState extends State<YourPosts_Screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50, right: 20,left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/back_button.png"),
                  Text(
                    'Your Posts',
                    style: TextStyle(
                      color: Color(0xFFFCFCFC),
                      fontSize: 24,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox()
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset("assets/images/dp_icon.png",height: 24,width: 24,),
                          SizedBox(width: 10,),
                          Text(
                            'Muhammad Bilal',
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
                      child:  Image.asset("assets/images/profile/delete_icon.png" , height: 15, width: 15,),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                  child: Image.asset("assets/images/dummypost.png")),

              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1 Likes',
                      style: TextStyle(
                        color: Color(0xFF4FC3F7),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Text(
                      '24 Oct 2023',
                      style: TextStyle(
                        color: Color(0xFFF9C612),
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
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: 0.70,
                      child: Text(
                        'A boy enjoying the sunshine',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
