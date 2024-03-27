import 'package:Roago/contact/Contact.dart';
import 'package:flutter/material.dart';
import 'ChatBubble.dart';

void main(List<String> args) {
  runApp(ChatScreenAlone());
}

class ChatScreenAlone extends StatefulWidget {
  const ChatScreenAlone({super.key});

  @override
  State<ChatScreenAlone> createState() => _ChatScreenAloneState();
}

class _ChatScreenAloneState extends State<ChatScreenAlone> {
  List<String> messageList = [];
  final TextEditingController message = TextEditingController();
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
                        image: AssetImage('assets/gambar/profile.png'),
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
                      'Sendiri',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'Lalezar',
                          fontSize: 20,
                          height: 1),
                    ),
                    Text(
                      'Tempat menyimpan kerandoman',
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
                  return ChatBubbleAlone(
                    text: messageList[index],
                    sender: index
                        .isEven, // true for even indexes, false for odd indexes
                  );
                },
              ),
            ),
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
                          setState(() {
                            messageList.add(message.text);
                          });
                          print(messageList);
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
