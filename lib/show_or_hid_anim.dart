

import 'package:flutter/material.dart';

class ShowOrHideAnim extends StatefulWidget {
  const ShowOrHideAnim({super.key});

  @override
  State<ShowOrHideAnim> createState() => _ShowOrHideAnimState();
}

class _ShowOrHideAnimState extends State<ShowOrHideAnim> {
  double opacity =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
       child:Text("Run") ,
       onPressed: () {
        setState(() {
          if(opacity ==0){
          opacity=1;
          }else{
           opacity=0;
          }
        });
        },
      
       ),
   
      body: Center(
        child:
       AnimatedOpacity(
        duration: Duration(seconds: 5),
        opacity: opacity,
         child: Container(
          height: 100,
          width: 100,
          color: Colors.amber,),
       )),
    );
  }
}