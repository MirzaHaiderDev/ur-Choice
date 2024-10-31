
import 'package:flutter/material.dart';

class AccountHistory_Screen extends StatefulWidget {
  const AccountHistory_Screen({Key? key}) : super(key: key);

  @override
  State<AccountHistory_Screen> createState() => _AccountHistory_ScreenState();
}

class _AccountHistory_ScreenState extends State<AccountHistory_Screen> {

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
                    'Acocunt History',
                    style: TextStyle(
                      color: Color(0xFFF8F7F7),
                      fontSize: 24,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      height: 0.05,
                    ),
                  ),
                  Image.asset("assets/images/profile/delete_icon.png",height: 20,width: 20,),
                ],
              ),


              Expanded(
                child: Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,  // The length Of the array
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ), // The size of the grid box
                    itemBuilder: (context, index) =>
                    gridItem(index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget gridItem(int index){
    return Container(
      padding: EdgeInsets.only(top: 10,right: 5,left: 5),
      decoration: ShapeDecoration(
        color: Color(0xFF201F1F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/profile/delete_icon.png",height: 18,width: 18,),
              Image.asset("assets/images/profile/id_icon.png",height: 30,width: 30,),
            ],
          ),
          Container(
            width: 140,
            height: 120,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dummyhistoryimage.png"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 10),
            child: Text(
              list[index],
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
                height: 0.08,
              ),
            ),
          ),
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
      ) ,
    );
  }

}
