import 'package:animations/explicity_anim.dart';
import 'package:animations/move_anim.dart';
import 'package:animations/rotation_anim.dart';
import 'package:animations/scale_anim.dart';
import 'package:animations/show_or_hid_anim.dart';
import 'package:flutter/material.dart';

import 'container_boxdecoration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  ExplicityAnimation(),
    );
  }
}

