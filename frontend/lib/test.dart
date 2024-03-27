import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatApp(),
    );
  }
}

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];

  String botResponse = ''; // Tambahkan variabel botResponse

  Future<void> sendMessage(String message) async {
    // Kirim permintaan ke API Flask dengan pesan dari pengguna
    final response = await http.get(
      Uri.parse('http://10.0.2.2:5000/get?msg=$message'), // Sesuaikan URL
    );

    if (response.statusCode == 200) {
      // Jika respons sukses
      String botResponse = jsonDecode(response.body);
      setState(() {
        messages.add('You: $message');
        messages.add('KadekBot: $botResponse');
        messageController.clear();
      });
    } else {
      // Jika ada kesalahan dalam permintaan ke server
      setState(() {
        messages.add('You: $message');
        messages.add('KadekBot: Error');
        messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with KadekBot'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          // Tambahkan widget Text untuk menampilkan jawaban bot
          Text(botResponse),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(labelText: 'Enter your message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = messageController.text;
                    sendMessage(message);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
