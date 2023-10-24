

import 'package:flutter/material.dart';

class Anim extends StatefulWidget {
  const Anim({super.key});

  @override
  State<Anim> createState() => _AnimState();
}

class _AnimState extends State<Anim> {
  Color color = Colors.pink;
  double borderRadius = 30;
  double height = 100;
  double width = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
       child:Text("Run") ,
       onPressed: () {
        setState(() {
         color =Colors.green;
         borderRadius = 200;
         height = 300;
         width = 90;
        });
        },
      
       ),
   
      body: Center(
        child:
       AnimatedContainer(
     
        duration: Duration(seconds: 2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius)
        ),

      ),
      ),
    );
  }
}