import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://example.com/profile-pic.jpg'), // Replace with a real image URL
            ),
            SizedBox(width: 8),
            Text(
              'Emmy',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              children: [
                ChatBubble(
                  isSender: false,
                  text: "hi, this is Emmy",
                  time: "10:30 AM",
                ),
                ChatBubble(
                  isSender: false,
                  text:
                      "It is a long established fact that a reader will be distracted by the",
                  time: "10:30 AM",
                ),
                ChatBubble(
                  isSender: true,
                  text: "as opposed to using 'Content here",
                  time: "10:31 AM",
                ),
                ChatBubble(
                  isSender: true,
                  text: "There are many variations of passages",
                  time: "10:31 AM",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.mic, color: Colors.grey),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.image, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String text;
  final String time;

  const ChatBubble(
      {required this.isSender, required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: isSender ? Colors.grey[300] : Colors.green[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(isSender ? 12 : 0),
                bottomRight: Radius.circular(isSender ? 0 : 12),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(color: isSender ? Colors.black : Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, bottom: 5),
            child: Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
