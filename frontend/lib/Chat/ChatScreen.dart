import 'package:Roago/contact/Contact.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ChatBubble.dart';
import 'package:Roago/data/data.dart';

void main(List<String> args) {
  runApp(ChatScreen());
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messageList = [];
  TextEditingController message = TextEditingController();

  void handleQuestion(String inputQuestion) async {
    int index = question.indexOf(inputQuestion);

    if (index != -1 && index < answer.length) {
      setState(() {
        messageList.add(answer[index]);
      });
      // Simpan messageList ke local storage
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('message', messageList);
    } else {
      setState(() {
        messageList.add("Maaf, saya tidak tahu jawabannya.");
      });
    }
  }

  Future<List<String>?> getMessagesFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedMessages = prefs.getStringList('message');
    return storedMessages;
  }

  @override
  void initState() {
    super.initState();
    getMessagesFromLocalStorage().then((value) {
      setState(() {
        messageList = value!;
      });
    });
  }

  // Future<void> sendMessage(String message) async {
  //   // Kirim permintaan ke API Flask dengan pesan dari pengguna
  //   final response = await http.get(
  //     Uri.parse('http://10.0.2.2:5000/get?msg=${message}'), // Sesuaikan URL
  //   );

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       messageList.add(response.body);
  //     });
  //   } else {}
  // }

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
                          builder: (context) => Contact(),
                        ));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color(0xffffffff),
                  ),
                )
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/gambar/robot.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rao',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'Lalezar',
                          fontSize: 20,
                          height: 1),
                    ),
                    Text(
                      'Yuk tanya tanya',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'Alata',
                          fontSize: 10,
                          height: 1),
                    )
                  ],
                )
              ],
            ),
            backgroundColor: Color(0xff005792),
          ),
          body: Column(children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubbleRao(
                  text: messageList[index],
                  sender: index
                      .isEven, // true for even indexes, false for odd indexes
                );
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    padding: EdgeInsets.only(left: 20, top: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff005792), width: 2),
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: message,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(fontFamily: 'Alata'),
                                hintText: 'Kirim Pesan...',
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(bottom: 10, right: 30)),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff13334C)),
                    child: IconButton(
                        onPressed: () {
                          messageList.add(message.text);
                          handleQuestion(message.text);
                          message.clear();
                        },
                        icon: Icon(
                          Icons.send,
                          color: Color(0xffffffff),
                        )))
              ],
            ),
            SizedBox(
              height: 10,
            )
          ]),
        ));
  }
}
