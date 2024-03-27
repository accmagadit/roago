
import 'package:flutter/material.dart';

import '../Data Pribadi/DataPribadi.dart';

void main(List<String> args) {
  runApp(WelcomeScreen());
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 600) {
                return Stack(children: [
                  ClipPath(
                    clipper: Wave(),
                    child: Container(
                      color: Color(0xff005792),
                      height: 200,
                    ),
                  ),
                  Positioned(
                    child: Image.asset('assets/gambar/karakter.png'),
                    right: -100,
                    top: 10,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 130),
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff005792),
                                  borderRadius: BorderRadius.circular(300),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Roago',
                                  style: TextStyle(
                                      fontFamily: 'Lalezar',
                                      fontSize: 68,
                                      color: Color(0xffF005792)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 200),
                          Container(
                            width: 200,
                            child: Text(
                              'Welcome To Roago',
                              style: TextStyle(
                                height: 1,
                                fontFamily: 'Lalezar',
                                fontSize: 35,
                                color: Color(0xffF005792),
                              ),
                            ),
                          ),
                          Text(
                            'Kamu Bingung Udah Sampai Mana?',
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: 16,
                              color: Color(0xffF005792),
                            ),
                          ),
                          SizedBox(height: 50),
                          Container(
                            width: 450,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff005792),
                                  shape: StadiumBorder()),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DataPribadiScreen(),
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontFamily: 'Lalezar', fontSize: 25),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    size: 40,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]);
              } else {
                return Stack(children: [
                  ClipPath(
                    clipper: Wave(),
                    child: Container(
                      color: Color(0xff005792),
                      height: 200,
                    ),
                  ),
                  Positioned(
                    child: Image.asset('assets/gambar/karakter.png'),
                    left: constraints.maxWidth / 1.8,
                    bottom: 0,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 280),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Color(0xff005792),
                                borderRadius: BorderRadius.circular(300),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Roago',
                                style: TextStyle(
                                    fontFamily: 'Lalezar',
                                    fontSize: 100,
                                    color: Color(0xffF005792)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 130),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 400,
                              child: Text(
                                'Welcome To Roago',
                                style: TextStyle(
                                  height: 1,
                                  fontFamily: 'Lalezar',
                                  fontSize: 70,
                                  color: Color(0xffF005792),
                                ),
                              ),
                            ),
                            Text(
                              'Bingung mau ngapain?',
                              style: TextStyle(
                                fontFamily: 'Lalezar',
                                fontSize: 25,
                                color: Color(0xffF005792),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Container(
                          width: 400,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff005792),
                                shape: StadiumBorder()),
                            onPressed: () {
                               Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DataPribadiScreen(),
                                    ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontFamily: 'Lalezar', fontSize: 25),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]);
              }
            },
          ),
        ));
  }
}

class Wave extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement
    var path = Path();
    // Gambar bentuk gelombang di sini
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height * 0.75);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height / 2, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
