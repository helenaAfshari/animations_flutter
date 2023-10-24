
import 'package:animations/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  bool isLiked = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //vsync یک چک کننده ایی که ایا ما در صفحه هستیم یا نیستیم
    _animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 200));
    //_animationController.repeat();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Scaffold(
        body: Column(
          children: [
            Row(
             children: [
                Icon(Icons.arrow_back),
                Text("Post"),
             ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                     borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text("flutter.dev.hana"),
                ],
              ),
            ),
               SizedBox(
                width: double.infinity,
                child: Image(image: Image.asset(Assets.images.hln.path).image,)),
                Row(
                  children: [
                    AnimatedBuilder(
                      animation: CurvedAnimation(parent: _animationController,curve: Curves.bounceInOut), 
                    
                    builder: (context, child) {
                      return  IconButton(onPressed: () {
                        if (isLiked) {
                          isLiked=false;
                          _animationController.reverse();
                        } else {
                          isLiked=true;
                          //این شرط برای رفع باگ هست که به مشکل نخوریم 
                          if(!_animationController.isCompleted){
                             _animationController.forward();
                          }
                        }
                    }, icon: 
                    isLiked?
                    Opacity(
                      opacity: _animationController.value!=_animationController.lowerBound?_animationController.value:1,
                      child: Icon(CupertinoIcons.heart_fill,
                      color: Colors.red,size: _animationController.value!=_animationController.lowerBound?24*_animationController.value:24,))
                      :       Opacity(
                      opacity: _animationController.value!=_animationController.lowerBound?_animationController.value:1,
                      child: Icon(CupertinoIcons.heart,
                      color: Colors.black,size: _animationController.value!=_animationController.lowerBound?24*_animationController.value:24,)),
                      );
                    },),
                   
                    IconButton(onPressed: () {
                      
                    }, icon: Icon(CupertinoIcons.bubble_left,color: Colors.red,)),
                  ],
                ),
          ],
        ),
        ),
      ));
  }
}