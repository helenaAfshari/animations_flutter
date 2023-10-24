



import 'package:animations/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class RotationAnim extends StatefulWidget {
  const RotationAnim({super.key});

  @override
  State<RotationAnim> createState() => _RotationAnimState();
}

class _RotationAnimState extends State<RotationAnim> {
  double turns =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
       child:Text("Run") ,
       onPressed: () {
        setState(() {
        turns += 1;
      
        });
        },
      
       ),
      body: Stack(children: [
        Container(
          color: Colors.black87,
        ),
          AnimatedRotation(
            duration: Duration(seconds: 1),
           turns: turns,
            child: Center(child: Image.asset(Assets.images.download.path,height: 40,width: 40,)))
      ],),
    );
  }
}