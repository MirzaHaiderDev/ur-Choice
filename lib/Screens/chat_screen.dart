import 'package:flutter/material.dart';
import 'package:urchoice/Screens/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Chat_Screen extends StatefulWidget {
  const Chat_Screen({Key? key}) : super(key: key);

  @override
  State<Chat_Screen> createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(child: Image.asset('assets/images/star_bg.png',fit: BoxFit.fill, height: double.maxFinite, width: double.maxFinite,)),

        Scaffold(
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 15),
                padding: MediaQuery.of(context).viewInsets,
                color: Colors.transparent,

                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type a message',
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.white54),
                            ),
                          )),
                    ),

                    Image.asset("assets/images/public/chain_icon.png", height: 20, width: 20,),
                    SizedBox(width : 10),
                    Image.asset("assets/images/public/smile_icon.png", height: 20, width: 20,),
                    SizedBox(width : 10),
                    Image.asset("assets/images/public/send_icon.png", height: 20, width: 20,),
                    SizedBox(width : 10),
                    Image.asset("assets/images/public/micon_icon.png", height: 20, width: 20,),
                    SizedBox(width : 20),
                  ],
                )


            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                margin: EdgeInsets.only(top: 50, right: 20,left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/back_button.png", height: 20, width: 20,),
                              SizedBox(width: 10,),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Profile_Screen()),
                                    );
                                  },
                                  child: Image.asset("assets/images/dp_icon.png",height: 24,width: 24,)),
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
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/vidcall_icon.svg", height: 15,width: 15,),
                              SizedBox(width : 10),
                              Image.asset("assets/images/call_icon.png", height: 24, width: 24,),
                              Icon(Icons.more_vert_outlined,color: Colors.yellow, size: 30,)

                            ],
                          ),
                        ),
                      ],
                    )



                  ],
                ),
              ),
            )
        ),
      ],
    );
  }
}
