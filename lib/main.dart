import 'package:flutter/material.dart';
import 'package:shoe_screen_practice/shoe_screen_using_stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoeScreen(),
    );
  }
}