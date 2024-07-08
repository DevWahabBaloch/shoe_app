import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoe_screen_practice/shoe_screen_using_stack.dart';

class ShoeOrderScreen extends StatefulWidget {
  const ShoeOrderScreen({super.key});

  @override
  State<ShoeOrderScreen> createState() => _ShoeOrderScreenState();
}

class _ShoeOrderScreenState extends State<ShoeOrderScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context, ShoeScreen()),
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.13,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Image.asset(
                      'assets/Nike wm.png',
                      height: height * 0.05,
                    ),
                    Container(
                      height: height * 0.06,
                      width: width * 0.13,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/email 3.png',
                          height: height * 0.035,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Nike Air Max 270',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Man\'s shoes',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 25,
                                  sigmaY: 25,
                                ),
                                child: Opacity(
                                  opacity: 0.1,
                                  child: Image.asset(
                                    'assets/nike logo 2.png',
                                    height: height * 0.6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Swipe Down',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Hero(
                            tag: 'Shoe 1',
                            
                            child: Image.asset(
                              'assets/colored nike 1.png',
                              height: height * 0.35,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Size',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.13,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/nine.png',
                                      height: height * 0.015,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.13,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/eight.png',
                                      height: height * 0.019,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.13,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/seven.png',
                                      height: height * 0.015,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.13,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/six.png',
                                      height: height * 0.015,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.2,
                                ),
                                const Text(
                                  '\$170',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Price',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Fav',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.13,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/like.png',
                                      height: height * 0.025,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.3,
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.13,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: height * 0.05,
                                      width: width * 0.05,
                                      decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.13,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: height * 0.05,
                                      width: width * 0.05,
                                      decoration: const BoxDecoration(
                                        color: Colors.purple,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                const Text(
                                  'Color',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset(
                        'assets/shoe box.png',
                        height: height * 0.18,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: height * 0.10,
                      width: width * 0.13,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.expand_circle_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}