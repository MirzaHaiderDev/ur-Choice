import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Shop_Screen extends StatefulWidget {
  const Shop_Screen({Key? key}) : super(key: key);

  @override
  State<Shop_Screen> createState() => _Shop_ScreenState();
}

class _Shop_ScreenState extends State<Shop_Screen> {
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
                  Image.asset("assets/images/back_button.png", height: 20, width: 20, color: Color(0xFFF9C612) ,),

                  Text(
                    'Shop',
                    style: TextStyle(
                      color: Color(0xFFF9C612),
                      fontSize: 24,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 0.05,
                    ),
                  ),


                  SvgPicture.asset("assets/images/vidcall_icon.svg", height: 20,width: 20, color: Color(0xFFF9C612),)




                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Gems ',
                      style: TextStyle(
                        color: Color(0xFFF9C612),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0.08,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/public/daimond_icon.png", height: 20, width: 20 ,),
                        SizedBox(width: 10,),
                        Opacity(
                          opacity: 0.80,
                          child: Text(
                            '10',
                            style: TextStyle(
                              color: Color(0xFFF9C612),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0.08,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),

                decoration: ShapeDecoration(
                  color: Color(0xFF2E2E2E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),


                child : Column(
                  children: [
                    Image.asset("assets/images/public/daimond_icon.png", height: 24, width: 24 ,),
                    SizedBox(height: 10,),
                    Opacity(
                      opacity: 0.80,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'ur’',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,

                              ),
                            ),
                            TextSpan(
                              text: 'Choice',
                              style: TextStyle(
                                color: Color(0xFFF9C612),
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,

                              ),
                            ),
                            TextSpan(
                              text: ' offer you an absolutley free scope like no other  similar app These gemstones help you achieve many    advantages in the app. In everyswipe you choose who you want to give more gems to and who doesn’t swipe ur’',
                              style: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,

                              ),
                            ),
                            TextSpan(
                              text: 'Choice',
                              style: TextStyle(
                                color: Color(0xFFF9C612),
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,

                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  daimondItem(),
                  daimondItem(),
                  daimondItem(),
                ],
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  daimondItem(),
                  daimondItem(),
                  daimondItem(),
                ],
              ),




              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      'More Features coming soon',
                      style: TextStyle(
                        color: Color(0xFFF9C612),
                        fontSize: 18,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0.07,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,right: 80),
                    child: Text(
                      'New Functions such as roulette  group chat (max 4 people/swipe) several filters and many more. In the upcoming version you may also get gems with payment.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }

  Widget daimondItem(){
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: 110.33,
      height: 133.25,
      decoration: ShapeDecoration(
        color: Color(0xFF272727),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Stack(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/public/daimond_icon.png", height: 55, width: 55 ,),
              Text(
                '6580',
                style: TextStyle(
                  color: Color(0xFFF9C612),
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                ),
              ),

              Container(
                height: 30,
                decoration: ShapeDecoration(
                  color: Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Center(
                  child: Text(
                    '\$5.89',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF9C612),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
          Center(child: Image.asset("assets/images/cross.png", height: 90, width: 90 ,)),

        ],
      ),
    );
  }
}
