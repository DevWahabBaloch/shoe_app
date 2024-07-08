import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoe_screen_practice/shoe_ordering_ui.dart';

class ShoeScreen extends StatefulWidget {
  const ShoeScreen({super.key});

  @override
  State<ShoeScreen> createState() => _ShoeScreenState();
}

double end = 0.0;

class _ShoeScreenState extends State<ShoeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _slideTopAnimation;
  final slideTween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
  final slideTopTween = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0));
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            animationController.forward();
          }
        },
      );

    _slideAnimation = slideTween.animate(animationController);
    _slideTopAnimation = slideTopTween.animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SlideTransition(
                position: _slideTopAnimation,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios, size: 25),
                      Icon(Icons.search, size: 25),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SlideTransition(
                position: _slideTopAnimation,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Shoes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SlideTransition(
                position: _slideTopAnimation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: const MaterialStatePropertyAll(
                          BorderSide(color: Colors.black),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(5),
                      ),
                      child: const Text(
                        'All',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: const MaterialStatePropertyAll(
                          BorderSide(color: Colors.black),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(5),
                      ),
                      child: const Text(
                        'Loafers',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: const MaterialStatePropertyAll(
                          BorderSide(color: Colors.black),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(5),
                      ),
                      child: const Text(
                        'Sneakers',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: const MaterialStatePropertyAll(
                          BorderSide(color: Colors.black),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(5),
                      ),
                      child: const Text(
                        'Air Max',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: const MaterialStatePropertyAll(
                          BorderSide(color: Colors.black),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(5),
                      ),
                      child: const Text(
                        'Jorden',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                end = end == 0.0 ? 2 * pi : 0.0;
                              });
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ShoeOrderScreen(),
                                  transitionDuration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Container(
                                height: height * 0.3,
                                width: width * 0.65,
                                color: Colors.transparent,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: height * 0.3,
                                      width: width * 0.5,
                                      decoration: BoxDecoration(
                                        color: Colors.lime,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 20,
                                              spreadRadius: 1,
                                              offset: Offset(5, 20)),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Alpha Savage',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              '\$800.09',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height * 0.15,
                                                    width: width * 0.003,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 50,
                                      right: -0,
                                      child: Hero(
                                        tag: 'shoe 1',
                                        child: Image.asset(
                                          'assets/colored nike 1.png',
                                          height: height * 0.22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // 2nd stack

                      Stack(
                        children: [
                          SlideTransition(
                            position: _slideAnimation,
                            child: Container(
                              height: height * 0.3,
                              width: width * 0.65,
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  Container(
                                    height: height * 0.3,
                                    width: width * 0.5,
                                    decoration: BoxDecoration(
                                      color: Colors.amber[600],
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 20,
                                            spreadRadius: 1,
                                            offset: Offset(5, 20)),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Alpha Savage',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Text(
                                            '\$800.09',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 10),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: height * 0.15,
                                                  width: width * 0.003,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    right: -5,
                                    child: Image.asset(
                                      'assets/1.png',
                                      height: height * 0.25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // 3rd stack
                      Stack(
                        children: [
                          SlideTransition(
                            position: _slideAnimation,
                            child: Container(
                              height: height * 0.3,
                              width: width * 0.65,
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  Container(
                                    height: height * 0.3,
                                    width: width * 0.5,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[700],
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 20,
                                            spreadRadius: 1,
                                            offset: Offset(5, 20)),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Alpha Savage',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Text(
                                            '\$800.09',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 10),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: height * 0.15,
                                                  width: width * 0.003,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 55,
                                    right: -15,
                                    child: Image.asset(
                                      'assets/2.png',
                                      height: height * 0.25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          SlideTransition(
                            position: _slideAnimation,
                            child: Container(
                              height: height * 0.3,
                              width: width * 0.65,
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  Container(
                                    height: height * 0.3,
                                    width: width * 0.5,
                                    decoration: BoxDecoration(
                                      color: Colors.teal[500],
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 20,
                                            spreadRadius: 1,
                                            offset: Offset(5, 20)),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Alpha Savage',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Text(
                                            '\$800.09',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 10),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: height * 0.15,
                                                  width: width * 0.003,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 60,
                                    right: -10,
                                    child: Transform.rotate(
                                      angle: 150,
                                      child: Image.asset(
                                        'assets/3.png',
                                        height: height * 0.18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          SlideTransition(
                            position: _slideAnimation,
                            child: Container(
                              height: height * 0.3,
                              width: width * 0.65,
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  Container(
                                    height: height * 0.3,
                                    width: width * 0.5,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 20,
                                            spreadRadius: 1,
                                            offset: Offset(5, 20)),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Alpha Savage',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Text(
                                            '\$800.09',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 10),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: height * 0.15,
                                                  width: width * 0.003,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -15,
                                    right: -5,
                                    child: Transform.flip(
                                      flipX: true,
                                      child: Transform.rotate(
                                        angle: 126,
                                        child: Image.asset(
                                          'assets/4.png',
                                          height: height * 0.3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SlideTransition(
                position: _slideTopAnimation,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        'Collection',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: height * 0.2,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: const Offset(4, 4)),
                                const BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: Offset(-4, -4)),
                              ],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.red,
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/11.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: height * 0.2,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: const Offset(4, 4)),
                                const BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: Offset(-4, -4)),
                              ],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.orange,
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/5.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: height * 0.2,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: const Offset(4, 4)),
                                const BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: Offset(-4, -4)),
                              ],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/12.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: height * 0.2,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: const Offset(4, 4)),
                                const BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: Offset(-4, -4)),
                              ],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/13.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: height * 0.2,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade600,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: const Offset(4, 4)),
                                const BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: Offset(-4, -4)),
                              ],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.yellow.shade600,
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/14.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: _slideTopAnimation,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        'Aesthetic Wear',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SlideTransition(
                position: _slideAnimation,
                child: Container(
                  height: height * 0.12,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[350],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(4, 4)),
                      const BoxShadow(
                          color: Colors.white,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(-4, -4)),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/14.png'),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Undercover React Persto',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              '''\$800.09''',
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    height: height * 0.12,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[350],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(4, 4)),
                        const BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(-4, -4)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/3.png'),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '''Air Zoom 37''',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '''\$800.09''',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    height: height * 0.12,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[350],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(4, 4)),
                        const BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(-4, -4)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/10.png'),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Aesthetic React Persto',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '''\$800.09''',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    height: height * 0.12,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[350],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(4, 4)),
                        const BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(-4, -4)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/6.png'),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '''Cover React green''',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '''\$800.09''',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    height: height * 0.12,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[350],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(4, 4)),
                        const BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(-4, -4)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/3.png'),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '''Air Jorden Blue''',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '''\$800.09''',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
