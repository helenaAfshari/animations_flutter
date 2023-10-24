
import 'package:flutter/material.dart';

class ExplicityAnimation extends StatefulWidget {
  const ExplicityAnimation({super.key});

  @override
  State<ExplicityAnimation> createState() => _ExplicityAnimationState();
}

class _ExplicityAnimationState extends State<ExplicityAnimation>with TickerProviderStateMixin {
  late AnimationController firstAnimationController;
  late AnimationController secondAnimationController;
  late CurvedAnimation firstCurveAnim;
  late CurvedAnimation secondCurveAnim;

  @override
  void initState() {
    firstAnimationController=AnimationController(vsync: this,duration: Duration(seconds: 4));
    secondAnimationController=AnimationController(vsync: this,duration: Duration(seconds: 4));
    //اینجا مودلی که میخواییم انیمیشن صورت بگیرد  حالت کرو بانسین هست 
    firstCurveAnim=CurvedAnimation(parent: firstAnimationController, curve: Curves.bounceIn);
    secondCurveAnim=CurvedAnimation(parent: secondAnimationController, curve: Curves.bounceInOut);
    //با ریپیت هم که شروع میکنه به اجرا انیمیشن
    firstAnimationController.repeat();
    secondAnimationController.repeat();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
        setState(() {
          //اینجا هم یک شرط گذاشتیم که  متوقف شود انیمیشن و ریپیت شود اجرا شود
          if(firstAnimationController.isAnimating&&secondAnimationController.isAnimating){
            firstAnimationController.stop();
            secondAnimationController.stop();
          }else {
             firstAnimationController.repeat();
            secondAnimationController.repeat();
          }
        });
      }, icon: Icon(Icons.apps_sharp,size: 32,color: Colors.blue,)),
      appBar: AppBar(title: Text("Explicity Animation"),),
      body: _animationView(),
    );
  }
  Widget _animationView()=>Container(
   width: MediaQuery.of(context).size.width,
   height: MediaQuery.of(context).size.height,
   color: Colors.lightGreen,
   child: Center(
    child: Row(
      children: [
        //اینجا هم از روتیشن استفاده کردیم  برای حالت انیمیشنش که شروع به چرخش میکند 
        RotationTransition(turns: Tween<double>(begin: 1,end:0 ).animate(firstCurveAnim),
        alignment: Alignment.center,
        child: Icon(Icons.settings,size: 200,color: Colors.deepPurple,),
        
        ),
          RotationTransition(turns: Tween<double>(begin: 0,end:1 ).animate(secondCurveAnim),
        alignment: Alignment.center,
        child: Icon(Icons.settings,size: 200,color: Colors.deepPurple,),
        
        )
      ],
    ),
   ),
  );
}