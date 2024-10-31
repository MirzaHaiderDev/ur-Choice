import 'package:flutter/material.dart';

class SwapPV extends StatefulWidget {
  const SwapPV({Key? key}) : super(key: key);

  @override
  _SwapPVState createState() => _SwapPVState();
}

class _SwapPVState extends State<SwapPV> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: controller,
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.green,
                ),
              ],
            ),



          ],
        ));
  }
}
