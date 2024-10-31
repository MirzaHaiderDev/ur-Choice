import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urchoice/Screens/verify_phonenumber.dart';

class TermsOfService_Screen extends StatefulWidget {
  const TermsOfService_Screen({Key? key}) : super(key: key);

  @override
  State<TermsOfService_Screen> createState() => _TermsOfService_ScreenState();
}

class _TermsOfService_ScreenState extends State<TermsOfService_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 146,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
              decoration: ShapeDecoration(
                color: Color(0xFFEB0606),
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
                    'Decline',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      height: 0.12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyNumber_Screen()),
                );
              },
              child: Container(
                width: 145,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                decoration: ShapeDecoration(
                  color: Color(0xFFA4FDA8),
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
                      'Accept ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        height: 0.12,
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Terms of Service',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                child: const Column(
                  children: [
                    Opacity(
                      opacity: 0.80,
                      child: Text("Lorem ipsum dolor sit amet consectetur. Magna tempor egestas arcu eu risus ut. Justo id sed a et in quis at facilisis suspendisse. Consequat vel imperdiet sit nulla in. Pulvinar interdum a nunc mattis leo ullamcorper. Sit fermentum suspendisse ut nulla. Tristique bibendum nisl adipiscing ultrices mauris pellentesque ornare nam a. Nunc viverra facilisis accumsan lorem vitae. Vel tortor rhoncus interdum sapien mi lobortis interdum. Ultrices gravida accumsan eros et tellus erat sed at. Nullam pellentesque auctor dictum integer eget senectus velit. Nisi convallis pulvinar amet pellentesque. Sit feugiat faucibus auctor et. Ac accumsan ac eu integer tristique. Et lorem adipiscing fermentum accumsan sed scelerisque lobortis. Proin vitae mauris sit sollicitudin. Dignissim eget bibendum nam libero risus sit nibh mi. Posuere scelerisque risus pharetra habitant fames. Praesent tempor nullam est mattis sed id. Quis nulla ac id enim mauris feugiat." , style: TextStyle(
                        color: Color(0xFFFCFCFC),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w300,

                      ),),
                    ),
                    Opacity(
                      opacity: 0.80,
                      child: Text("Lorem ipsum dolor sit amet consectetur. Magna tempor egestas arcu eu risus ut. Justo id sed a et in quis at facilisis suspendisse. Consequat vel imperdiet sit nulla in. Pulvinar interdum a nunc mattis leo ullamcorper. Sit fermentum suspendisse ut nulla. Tristique bibendum nisl adipiscing ultrices mauris pellentesque ornare nam a. Nunc viverra facilisis accumsan lorem vitae. Vel tortor rhoncus interdum sapien mi lobortis interdum. Ultrices gravida accumsan eros et tellus erat sed at. Nullam pellentesque auctor dictum integer eget senectus velit. Nisi convallis pulvinar amet pellentesque. Sit feugiat faucibus auctor et. Ac accumsan ac eu integer tristique. Et lorem adipiscing fermentum accumsan sed scelerisque lobortis. Proin vitae mauris sit sollicitudin. Dignissim eget bibendum nam libero risus sit nibh mi. Posuere scelerisque risus pharetra habitant fames. Praesent tempor nullam est mattis sed id. Quis nulla ac id enim mauris feugiat." , style: TextStyle(
                        color: Color(0xFFFCFCFC),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w300,

                      ),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
