import 'package:agora_voice_app/call_screen.dart';
import 'package:flutter/material.dart';

class IncomingCallPage extends StatelessWidget {
  final String callerName;

  IncomingCallPage({required this.callerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Color
          Container(
            color: Color(0xFF38094D), // Dark Purple Background
          ),
          // Incoming Call Details
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100), // Spacer for top margin
              Text(
                "Incoming Call",
                style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/user.png'), // Placeholder for caller's image
              ),
              SizedBox(height: 20),
              Text(
                callerName,
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
            ],
          ),
          // Call Action Buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Decline Button
                GestureDetector(
                  onTap: () => Navigator.pop(context), // Decline call
                  child: _buildButton(Icons.call_end, "Decline", Color(0xFFD32F2F)), // Red Color
                ),
                // Pick Up Button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CallScreen(callerName: callerName)),
                    );
                  },
                  child: _buildButton(Icons.call, "Pick Up", Color(0xFF388E3C)), // Green Color
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
