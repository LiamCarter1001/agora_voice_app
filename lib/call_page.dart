import 'package:agora_voice_app/incoming_call.dart';
import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  final List<Map<String, String>> callData = [
    {"name": "Alice", "time": "Today, 11:00 AM", "type": "incoming"},
    {"name": "Bob", "time": "Yesterday, 4:00 PM", "type": "outgoing"},
    {"name": "Charlie", "time": "Today, 1:00 PM", "type": "incoming"},
    {"name": "Diana", "time": "Today, 2:00 PM", "type": "outgoing"},
    {"name": "Ethan", "time": "Yesterday, 6:00 PM", "type": "incoming"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF38094D), // Dark Purple Background
      appBar: AppBar(
        title: Text("Calls",style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Color(0xFF38094D),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: callData.length,
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
                    leading: Icon(
                      callData[index]["type"] == "incoming"
                          ? Icons.call_received
                          : Icons.call_made,
                      color: Colors.green,
                      size: 30,
                    ),
                    title: Text(
                      callData[index]["name"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF38094D),
                      ),
                    ),
                    subtitle: Text(
                      callData[index]["time"]!,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(Icons.phone, color: Colors.green),
                    onTap: () {
                      // Call detail functionality can go here
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IncomingCallPage(callerName: "User1"),
                  ),
                );
              },
              child: Text("Simulate Incoming Call"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
