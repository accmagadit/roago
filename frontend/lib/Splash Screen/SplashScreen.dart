import 'dart:async';
import 'package:flutter/material.dart';
import '../login/Login.dart';

void main(List<String> args) {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashComponent(),
    );
  }
}

class SplashComponent extends StatefulWidget {
  const SplashComponent({super.key});

  @override
  State<SplashComponent> createState() => _SplashComponentState();
}

class _SplashComponentState extends State<SplashComponent> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    // Timer(Duration(milliseconds: 1500), () {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => LoginScreen()));
    //   });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double height = mediaQuery.height;
    double width = mediaQuery.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xff005792),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height / 2.5),
                child: Logo(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  FittedBox(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: width / 1.1,
                      height: height / 5,
                      constraints:
                          BoxConstraints(maxHeight: 420, maxWidth: 1000),
                      decoration: BoxDecoration(
                          color: Color(0xffF6F6E9),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width / 0.1),
                              topRight: Radius.circular(width / 0.1))),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: height / 1.05),
                child: Center(
                  child: Container(
                    height: height / 20,
                    width: width / 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width / 0.1),
                          topRight: Radius.circular(width / 0.1)),
                      color: Color(0xff005792),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'v.1.0.0',
                      style: TextStyle(
                          color: Color(0xffF6F6E9),
                          fontSize: height / 55,
                          fontFamily: 'Lalezar'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double height = mediaQuery.height;
    double width = mediaQuery.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 50,
                maxHeight: 60,
                maxWidth: 60,
              ),
              height: mediaQuery.height / 20,
              width: mediaQuery.height / 20,
              decoration: BoxDecoration(
                color: Color(0xffF6F6E9),
                borderRadius: BorderRadius.circular(300),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Roago',
                style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: mediaQuery.height / 18,
                    color: Color(0xffF6F6E9)),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Yuk Tanya-tanya!',
              style: TextStyle(
                fontFamily: 'Lalezar',
                fontSize: height / 60,
                color: Color(
                  0xffF6F6E9,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
