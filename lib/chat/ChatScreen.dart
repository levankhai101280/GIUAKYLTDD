import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final List<ChatItem> chatItems = [
    ChatItem(
      name: "Tuan Tran",
      message: "It's a beautiful place",
      time: "10:30 AM",
      avatarUrl: "assets/guide1.jpg",
      unread: false,
    ),
    ChatItem(
      name: "Emmy",
      message: "We can start at 8am",
      time: "11:00 AM",
      avatarUrl: "assets/guide2.jpg",
      unread: true,
    ),
    ChatItem(
      name: "Khai Ho",
      message: "See you tomorrow",
      time: "11:30 AM",
      avatarUrl: "assets/guide2.jpg",
      unread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://example.com/header_image.jpg"), // Replace with actual image URL
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Chat",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatItems.length,
              itemBuilder: (context, index) {
                return ChatTile(chat: chatItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final ChatItem chat;

  const ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(chat.avatarUrl),
      ),
      title: Text(chat.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(chat.message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chat.time,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          if (chat.unread)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.red,
              ),
            ),
        ],
      ),
      onTap: () {
        // Navigate to detailed chat screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedChatScreen(chat: chat),
          ),
        );
      },
    );
  }
}

class DetailedChatScreen extends StatelessWidget {
  final ChatItem chat;

  const DetailedChatScreen({required this.chat});

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
              backgroundImage: AssetImage(chat.avatarUrl),
            ),
            SizedBox(width: 8),
            Text(
              chat.name,
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
                  text: "hi, this is ${chat.name}",
                  time: chat.time,
                ),
                ChatBubble(
                  isSender: false,
                  text: chat.message,
                  time: chat.time,
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

class ChatItem {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool unread;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.unread,
  });
}
