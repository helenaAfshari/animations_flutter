




import 'package:animations/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ScaleAnim extends StatefulWidget {
  const ScaleAnim({super.key});

  @override
  State<ScaleAnim> createState() => _ScaleAnimState();
}
class _ScaleAnimState extends State<ScaleAnim> {
  double scale =5;
  bool clicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
       child:Text("Run") ,
       onPressed: () {
        setState(() {
        if(clicked){
          clicked=false;
          scale -= 2;
        }else{
          clicked = true;
          scale+=2;
        }
       // left+=30;
        });
        },
       ),
      body: Stack(children: [
        Container(
          color: Colors.black87,
        ),
          AnimatedScale(
            curve:clicked? Curves.easeInBack:Curves.easeInBack,
            duration:Duration(seconds: 2) ,
            scale: scale,
          child: Center(child: Image.asset(Assets.images.download.path,height: 40,width: 40,)))
      ],),
    );
  }
}