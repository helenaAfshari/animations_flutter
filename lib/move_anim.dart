


import 'package:animations/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MoveAnim extends StatefulWidget {
  const MoveAnim({super.key});

  @override
  State<MoveAnim> createState() => _MoveAnimState();
}

class _MoveAnimState extends State<MoveAnim> {
  double bottom =0;
  double left =150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
       child:Text("Run") ,
       onPressed: () {
        setState(() {
        bottom += 50;
        //left+=30;
        });
        },
      
       ),
      body: Stack(children: [
        Container(
          color: Colors.black87,
        ),
          AnimatedPositioned(
            curve: Curves.linear,
            bottom: bottom,
            left: left,
            child: Image.asset(Assets.images.download.path,height: 40,width: 40,),
           duration: Duration(seconds: 4))
      ],),
    );
  }
}