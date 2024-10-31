import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InviteNewContact_Screen extends StatefulWidget {
  const InviteNewContact_Screen({Key? key}) : super(key: key);

  @override
  State<InviteNewContact_Screen> createState() => _InviteNewContact_ScreenState();
}

class _InviteNewContact_ScreenState extends State<InviteNewContact_Screen> {


  var list = ["Mirza","Haider", "Ali", "Flutter" , "Developer"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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

                    Row(
                      children: [
                        Image.asset("assets/images/back_button.png"),
                        SizedBox(width: 16,),
                        Text(
                          'Invite Friend',
                          style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),

                    SvgPicture.asset("assets/images/search_icon.svg", height: 20,width: 20,)
                    ,
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Select a Friend',
                        style: TextStyle(
                          color: Color(0xFFFAFAFA),
                          fontSize: 20,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),

                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Your contacts',
                        style: TextStyle(
                          color: Color(0xFFEFEFEF),
                          fontSize: 14,
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
                      return listItem(context, index, list[index]);
                    },

                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget listItem(BuildContext context, int index, String name){

    return Container(
      margin: EdgeInsets.only(top: 0,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Row(
            children: [
              Container(
                child: CircleAvatar(
                    backgroundColor: Color(0xFF404040),
                    child: Text('${name[0]}', style: TextStyle(color: Color(0xFFF9C612)),)
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  name,
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
}
