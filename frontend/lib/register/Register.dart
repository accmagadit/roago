import 'dart:async';

import 'package:Roago/login/Login.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(RegisterScreen());
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = true;
  String statusPassword = '';
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // void addUser() async {
  //   var url = Uri.parse("http://10.0.2.2:1234/users");

  //   print("dibawah uri register");

  //   // Ganti URL sesuai dengan alamat server Anda.
  //   var response = await http.post(
  //     url,
  //     body: {
  //       "username": _usernameController.text,
  //       "password": _passwordController.text,
  //       "name": "g",
  //       "age": "0",
  //       "gender": "g",
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     print(data);
  //     print("kode 200");
  //   } else {
  //     print("Gagal: ${response.reasonPhrase}");
  //   }
  // }

  Future<void> saveAccount(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> usernameList = prefs.getStringList("username") ?? [];
    List<String> passwordList = prefs.getStringList("password") ?? [];

    usernameList.add(username);
    passwordList.add(password);

    // Simpan list username dan password ke dalam local storage.
    prefs.setStringList("username", usernameList);
    prefs.setStringList("password", passwordList);

    for (var i = 0; i < usernameList.length; i++) {
      print(usernameList[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xff005792),
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: Wave(),
                      child: Container(
                        color: Color(0xff13334C),
                        height: 200,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
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
                                      fontSize: 18,
                                      color: Color(0xffF6F6E9)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Register',
                                style: TextStyle(
                                    fontFamily: 'Lalezar',
                                    fontSize: 80,
                                    height: 0.5,
                                    color: Color(0xffF6F6E9)),
                              ),
                              Text(
                                "Let's star with Register your Account!",
                                style: TextStyle(
                                    fontFamily: 'Lalezar',
                                    fontSize: 18,
                                    color: Color(0xffF6F6E9)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 450,
                          height: 450,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          padding: EdgeInsets.only(
                            top: 50,
                            left: 20,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffF6F6E9),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                width: 400,
                                height: 55,
                                padding: EdgeInsets.only(left: 20, top: 3),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xff005792), width: 2),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Username',
                                      style: TextStyle(
                                          fontFamily: 'KaiseiDecolRegular',
                                          fontSize: 10),
                                    ),
                                    Container(
                                      height: 28,
                                      width: 280,
                                      child: TextField(
                                        controller: _usernameController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 15)),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: 400,
                                height: 55,
                                padding: EdgeInsets.only(left: 20, top: 3),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xff005792), width: 2),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Password',
                                            style: TextStyle(
                                                fontFamily:
                                                    'KaiseiDecolRegular',
                                                fontSize: 10),
                                          ),
                                          Container(
                                            height: 28,
                                            width: 260,
                                            child: TextField(
                                              controller: _passwordController,
                                              obscureText: _isPasswordVisible,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          bottom: 15)),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible =
                                                !_isPasswordVisible;
                                          });
                                        },
                                        icon: Icon(_isPasswordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility))
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: 400,
                                height: 55,
                                padding: EdgeInsets.only(left: 20, top: 3),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xff005792), width: 2),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Confirm Password',
                                            style: TextStyle(
                                                fontFamily:
                                                    'KaiseiDecolRegular',
                                                fontSize: 10),
                                          ),
                                          Container(
                                            height: 28,
                                            width: 260,
                                            child: TextField(
                                              obscureText: _isPasswordVisible,
                                              controller:
                                                  _confirmPasswordController,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          bottom: 15)),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible =
                                                !_isPasswordVisible;
                                          });
                                        },
                                        icon: Icon(_isPasswordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility))
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: 380,
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff13334C),
                                      shape: StadiumBorder()),
                                  onPressed: () {
                                    if (_passwordController.text ==
                                        _confirmPasswordController.text) {
                                      setState(() {
                                        statusPassword = 'Registrasi Berhasil';
                                      });
                                      print("asdf");
                                      saveAccount(_usernameController.text,
                                          _passwordController.text);
                                      //addUser();
                                      Timer(Duration(seconds: 1), () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      });
                                    } else {
                                      setState(() {
                                        statusPassword =
                                            'Password dan Confirm Password tidak sama';
                                      });
                                    }
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontFamily: 'Lalezar', fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                statusPassword,
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(height: 10),
                              LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "have you already an account?",
                                        style: TextStyle(
                                          fontFamily: 'KaiseiDecolRegular',
                                          fontSize: constraints.maxWidth *
                                              0.04, // adjust font size
                                        ),
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth *
                                            0.02, // adjust spacing
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()),
                                          );
                                        },
                                        child: Text(
                                          'login',
                                          style: TextStyle(
                                            fontFamily: 'KaiseiDecolRegular',
                                            color: Color(0xff005792),
                                            fontSize: constraints.maxWidth *
                                                0.04, // adjust font size
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
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
