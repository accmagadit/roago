import 'dart:convert';

import 'package:Roago/contact/Contact.dart';
import 'package:Roago/welcome/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(DataPribadiScreen());
}

class DataPribadiScreen extends StatefulWidget {
  const DataPribadiScreen({super.key});

  @override
  State<DataPribadiScreen> createState() => _DataPribadiScreenState();
}

class _DataPribadiScreenState extends State<DataPribadiScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  void _updateUser() async {
    var url = Uri.parse("http://10.0.2.2:1234/update");
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString("username");

    if (_genderController.text == 0) {
      _genderController.text = "Laki-laki";
    } else {
      _genderController.text = "Perempuan";
    }

    var response = await http.post(url, body: {
      "username": username,
      "name": _nameController.text,
      "gender": _genderController.text,
      "age": _ageController.text
    });

    if (response.statusCode == 200) {
      final responseData = jsonEncode(response.body);
      print(responseData);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Contact()));
    } else {
      print("Gagal: ${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ));
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color(0xff000000),
                ),
              )
            ],
          ),
          backgroundColor: Color(0xffffffff),
        ),
        backgroundColor: Color(0xffffffff),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(),
                  Container(
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/gambar/profile.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Text(
                              'Detail Kamu',
                              style: TextStyle(
                                  fontFamily: 'Allerta',
                                  fontSize: 20,
                                  color: Color(0xff000000)),
                            )
                          ],
                        ),
                        Text(
                          'Beritahu kami siapa kamu?',
                          style: TextStyle(
                              fontFamily: 'Lalezar',
                              color: Color(0xff005792),
                              fontSize: 30),
                        ),
                        Text(
                          'Biar kita asik aja gitu ngobrolnya \nhehe..',
                          style: TextStyle(
                              fontFamily: 'KaiseiDecolRegular',
                              color: Color(0xff000000),
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama',
                        style: TextStyle(
                            fontFamily: 'Lalezar',
                            color: Color(0xffC8C8C8),
                            fontSize: 30),
                      ),
                      Container(
                        width: 400,
                        height: 55,
                        padding: EdgeInsets.only(left: 20, top: 3),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xff005792), width: 2),
                            borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 28,
                              width: 280,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(bottom: 8)),
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 400,
                    height: 120,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jenis Kelamin',
                              style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  color: Color(0xffC8C8C8),
                                  fontSize: 30),
                            ),
                            Container(
                              width: 210,
                              height: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff005792), width: 2),
                                  borderRadius: BorderRadius.circular(40)),
                              child: ToggleSwitch(
                                minWidth: 100,
                                minHeight: 55,
                                cornerRadius: 50,
                                activeBgColor: [Color(0xff005792)],
                                activeFgColor: Colors.white,
                                inactiveBgColor: Colors.white,
                                inactiveFgColor: Color(0xffC8C8C8),
                                initialLabelIndex: 0,
                                totalSwitches: 2,
                                labels: ['Pria', 'Wanita'],
                                radiusStyle: true,
                                onToggle: (index) {
                                  print(index);
                                },
                              ),
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Container(
                            //       height: 28,
                            //       width: 280,
                            //       child: TextField(
                            //         decoration: InputDecoration(
                            //             border: InputBorder.none,
                            //             contentPadding: EdgeInsets.only(bottom: 8)),
                            //         style: TextStyle(fontSize: 25),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 400,
                    height: 120,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Umur',
                              style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  color: Color(0xffC8C8C8),
                                  fontSize: 30),
                            ),
                            Container(
                              width: 190,
                              height: 55,
                              padding: EdgeInsets.only(left: 20, top: 3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff005792), width: 2),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 28,
                                    width: 280,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              EdgeInsets.only(bottom: 8)),
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
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
                              builder: (context) => Contact(),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Continue',
                            style:
                                TextStyle(fontFamily: 'Lalezar', fontSize: 25),
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
        ),
      ),
    );
  }
}
