import 'package:Roago/register/Register.dart';
import 'package:Roago/welcome/Welcome.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = true;
  String _checkAccount = '';
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // void loginPressed() async {
  //   // Menyiapkan URL server Anda
  //   var url = Uri.parse("http://10.0.2.2:1234/login");
  //   print("dibawah uri login");

  //   // Mengirim permintaan HTTP POST ke server
  //   var response = await http.post(
  //     url,
  //     body: {
  //       "username": _usernameController.text,
  //       "password": _passwordController.text,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     print(responseData);

  //     // Autentikasi berhasil, pindahkan ke halaman berikutnya
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => WelcomeScreen()));

  //     //simpan di shared preference
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString("username", _usernameController.text);

  //     setState(() {
  //       _checkAccount = 'Login Berhasil';
  //     });
  //   } else {
  //     print("Gagal: ${response.reasonPhrase}");
  //     // Autentikasi gagal, tampilkan pesan kesalahan
  //     setState(() {
  //       _checkAccount = 'Password Salah';
  //     });
  //   }
  // }

  void login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> usernameList = prefs.getStringList("username") ?? [];
    List<String> passwordList = prefs.getStringList("password") ?? [];

    int index = usernameList.indexOf(username);

    if (index != -1 &&
        index < passwordList.length &&
        passwordList[index] == password) {
      // Berhasil login.
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    } else if (index == -1) {
      // Username tidak tersedia.
      setState(() {
        _checkAccount = "Username tidak tersedia";
      });
    } else {
      // Password salah.
      setState(() {
        _checkAccount = "Password salah";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                          'Login',
                          style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: 80,
                              height: 0.5,
                              color: Color(0xffF6F6E9)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Please Login To Continue',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                          fontFamily: 'KaiseiDecolRegular',
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
                                                EdgeInsets.only(bottom: 15)),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  icon: Icon(_isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility))
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          width: 380,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff13334C),
                                shape: StadiumBorder()),
                            onPressed: () {
                              print("fasd");
                              login(_usernameController.text, _passwordController.text);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontFamily: 'Lalezar', fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _checkAccount,
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(height: 10),
                        // Text(
                        //   '------------------------  or with  -----------------------',
                        //   style: TextStyle(fontFamily: 'Lalezar', fontSize: 14),
                        // ),
                        SizedBox(height: 15),
                        SizedBox(height: 15),
                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  "doesn't have an account?",
                                  style: TextStyle(
                                    fontFamily: 'KaiseiDecolRegular',
                                    fontSize: constraints.maxWidth *
                                        0.04, // adjust font size
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()),
                                    );
                                  },
                                  child: Text(
                                    'register',
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
          ),
        ),
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
