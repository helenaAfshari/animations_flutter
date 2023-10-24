



import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TwinAnim extends StatefulWidget {
  const TwinAnim({super.key});

  @override
  State<TwinAnim> createState() => _TwinAnimState();
}

class _TwinAnimState extends State<TwinAnim> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late final Animation<double>_rotateAnim= Tween<double>(begin: 0,end: 10).animate(_animationController);
  late final Animation<double>_opacityAnim = Tween<double>(begin: 0.0,end: 1.0).animate(_animationController);
  late final Animation<double>_containerAnim = Tween<double>(begin: 10,end: 200).animate(_animationController);
  late final Animation<double>_borderRadiuseAnim = Tween<double>(begin: 0,end: 30).animate(_animationController);
  late final Animation<Color?>_colorAnim  = ColorTween(begin: Colors.pink,end: Colors.blueAccent).animate(_animationController);

   @override
  void initState() {
    super.initState();
    _animationController=AnimationController(vsync: this,duration: const Duration(seconds: 3));
    _animationController.repeat();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(
      child: AnimatedBuilder(
        animation: _animationController, 
        builder: (context, child) {
            return Transform.rotate(
              angle: _rotateAnim.value,
              child: Opacity(
                opacity: _opacityAnim.value,
                child: Container(
                  height: _containerAnim.value,
                  width: _containerAnim.value,
                  decoration:  BoxDecoration(
                    color: _colorAnim.value,
                    borderRadius: BorderRadius.circular(_borderRadiuseAnim.value),
                  ),
                ),),
              );
        },),
    ) ,));
  }
}