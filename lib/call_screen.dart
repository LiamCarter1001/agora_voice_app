import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  final String callerName;

  CallScreen({required this.callerName});

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
          // Call Details
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100), // Spacer for top margin
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/user.png'), // Placeholder for user's image
              ),
              SizedBox(height: 20),
              Text(
                callerName,
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "00:174",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          // Remaining time message at the top
          Positioned(
            top: 50, // Adjust as necessary for positioning
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(10),
            
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your call will end soon",
                    style: TextStyle(color: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add recharge logic here
                    },
                    child: Text("Recharge"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  ),
                ],
              ),
            ),
          ),
          // Call Action Buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Mute Button
                _buildActionButton(Icons.mic_off, Colors.white, () {
                  // Mute logic here
                }),
                // End Call Button
                _buildActionButton(Icons.call_end, Colors.red, () {
                  Navigator.pop(context); // End call action
                }),
                // Video Call Button
                _buildActionButton(Icons.videocam, Colors.white, () {
                  // Video call logic here
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xFF38094D), // Background color for buttons
        child: Icon(icon, color: color),
      ),
    );
  }
}
