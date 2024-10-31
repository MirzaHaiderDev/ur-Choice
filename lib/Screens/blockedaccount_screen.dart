import 'package:flutter/material.dart';

class BlockedAccount_Screen extends StatefulWidget {
  const BlockedAccount_Screen({Key? key}) : super(key: key);

  @override
  State<BlockedAccount_Screen> createState() => _BlockedAccount_ScreenState();
}

class _BlockedAccount_ScreenState extends State<BlockedAccount_Screen> {

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
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/back_button.png")),
                  Text(
                    'Blocked Accounts',
                    style: TextStyle(
                      color: Color(0xFFF8F7F7),
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 0.05,
                    ),
                  ),
                  SizedBox()
                ],
              ),



              Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return listItem(context, index);
                      },
                  )
              ),
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
                height: 32,
                width: 32,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/dummyhistoryimage.png",),
                ),
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
            width: 144,
            height: 38,
            decoration: ShapeDecoration(
              color: Color(0xFFFCE8A0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Center(
              child: Text(
                'Unblock Contact',
                style: TextStyle(
                  color: Colors.black,
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
    );
  }


}
