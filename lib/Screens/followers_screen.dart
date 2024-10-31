import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Followers_Screen extends StatefulWidget {
  const Followers_Screen({Key? key}) : super(key: key);

  @override
  State<Followers_Screen> createState() => _Followers_ScreenState();
}

class _Followers_ScreenState extends State<Followers_Screen> {

  var list = ["Mirza","Haider", "Ali", "Flutter" , "Developer"];


  int tabIndex = 1;

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/back_button.png"),
                ],
              ),
              
              Container(
                margin: EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                    onTap : (){
                      setState(() {
                        tabIndex =1;
                      });
                    },
                      child: Container(
                        child: Opacity(
                          opacity: 0.80,
                          child: Text(
                            '3 Followers',
                            style: TextStyle(
                              color: tabIndex == 1 ? Color(0xFFF9C612): Colors.white,
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
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

                    GestureDetector(
                      onTap : (){
                        setState(() {
                          tabIndex =2;
                        });
                      },
                      child: Container(
                        child: Text(
                          ' 3 Following',
                          style: TextStyle(
                            color: tabIndex == 2 ? Color(0xFFF9C612): Colors.white,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),



              Expanded(
                child: PageView(
                  onPageChanged: (value){
                    print(value);
                    setState(() {
                      tabIndex = value+1;
                    });
                  },

                  children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return listItem(context, index);
                      },

                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return listItem2(context, index);
                      },

                    )
                  ],
                ),
              )



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
          Container(
            width: 89,
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: ShapeDecoration(
              color: Color(0xFFFCE8A0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Unfollow',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget listItem2(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(top: 20,bottom: 20),
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
          Row(
            children: [
              Row(children: [
                Image.asset("assets/images/profile/id_icon.png", height: 30,width: 30,),
              ],),

              SizedBox(width: 15,),

              Container(
                width: 89,
                height: 38,
                decoration: ShapeDecoration(
                  color: Color(0xFFFCE8A0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}
