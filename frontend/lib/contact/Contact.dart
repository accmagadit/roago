import 'package:Roago/Chat/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Chat/ChatScreenAlone.dart';

void main(List<String> args) {
  runApp(Contact());
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  void setContact(String contact) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("contact", contact);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff005792),
            ),
            backgroundColor: Color(0xffffffff),
            body: Center(
              child: Container(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setContact("rao");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen()));
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/gambar/robot.png'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Text(
                          'Ngomong sama rao',
                          style: TextStyle(fontFamily: 'Alata'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setContact("sendiri");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreenAlone()));
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/gambar/profile.png'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Text(
                          'Ngomong sendiri',
                          style: TextStyle(
                              fontFamily: 'Alata', color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
