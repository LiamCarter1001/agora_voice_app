import 'package:agora_voice_app/chat_detail_page.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final List<Map<String, String>> chatData = [
    {"name": "Alice", "message": "Hello!", "time": "10:30 AM"},
    {"name": "Bob", "message": "How are you?", "time": "Yesterday"},
    {"name": "Charlie", "message": "Let’s catch up.", "time": "Yesterday"},
    {"name": "Diana", "message": "Are we still on for lunch?", "time": "Today"},
    {"name": "Ethan", "message": "Can you send me the report?", "time": "2:45 PM"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats",style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Color(0xFF38094D), // Dark Purple
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF38094D), // Dark Purple Background
        child: ListView.builder(
          itemCount: chatData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/user.png'), // Placeholder image
                ),
                title: Text(
                  chatData[index]["name"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF38094D),
                  ),
                ),
                subtitle: Text(
                  chatData[index]["message"]!,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      chatData[index]["time"]!,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4),
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 10,
                    ),
                  ],
                ),
                onTap: () {
                  // Navigate to chat detail
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailPage(userName: chatData[index]["name"]!),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
