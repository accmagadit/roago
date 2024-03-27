import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

Widget ChatBubbleRao({required String text, required bool sender}) {
  return Container(
    width: 300,
    padding: EdgeInsets.all(10),
    color: sender ? Color(0xffffffff) : Color(0xffEFEFEF),
    child: Column(
      children: [
        Align(
          alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
          child: sender
              ? Text(
                  text,
                  style: TextStyle(
                    color: Color(0xff000000),
                  ),
                )
              : AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      text,
                      textStyle: TextStyle(
                        color: Color(0xff000000),
                      ),
                      speed: Duration(milliseconds: 30),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: Duration(milliseconds: 100),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
        ),
        Align(
          alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: sender
                    ? AssetImage('assets/gambar/profile.png')
                    : AssetImage('assets/gambar/robot.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget ChatBubbleAlone({required String text, required bool sender}) {
  return Container(
    width: 300,
    padding: EdgeInsets.all(10),
    color: sender ? Color(0xffffffff) : Color(0xffEFEFEF),
    child: Column(
      children: [
        Align(
          alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
          child: sender
              ? Text(
                  text,
                  style: TextStyle(
                    color: Color(0xff000000),
                  ),
                )
              : AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      text,
                      textStyle: TextStyle(
                        color: Color(0xff000000),
                      ),
                      speed: Duration(milliseconds: 30),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: Duration(milliseconds: 100),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
        ),
        Align(
          alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: sender
                    ? AssetImage('assets/gambar/profile.png')
                    : AssetImage('assets/gambar/profile.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}