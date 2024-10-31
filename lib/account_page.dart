import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _activityStatus = "Online";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF38094D), // Background color
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/user.png'), // Placeholder profile image
                  ),
                  SizedBox(height: 10),
                  Text(
                    "User Name",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color for better visibility
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "+1 234 567 890",
                    style: TextStyle(color: Colors.grey[400]), // Lighter grey for contrast
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Divider(color: Colors.white54), // Lighter divider color
            SizedBox(height: 10),
            Text(
              "Status",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Activity Status: $_activityStatus",
                      style: TextStyle(color: Color(0xFF38094D)), // Dark Purple for text
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: DropdownButton<String>(
                      value: _activityStatus,
                      dropdownColor: Colors.white, // Background for dropdown
                      items: ["Online", "Offline", "Busy"].map((status) {
                        return DropdownMenuItem(value: status, child: Text(status));
                      }).toList(),
                      onChanged: (newStatus) {
                        setState(() {
                          _activityStatus = newStatus!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.white54),
            SizedBox(height: 10),
            Text(
              "Account Settings",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            _buildSettingsTile(Icons.lock, "Privacy", () {
              // Navigate to privacy settings
            }),
            _buildSettingsTile(Icons.notifications, "Notifications", () {
              // Navigate to notifications settings
            }),
            _buildSettingsTile(Icons.security, "Security", () {
              // Navigate to security settings
            }),
            SizedBox(height: 20),
            Divider(color: Colors.white54),
            SizedBox(height: 10),
            Text(
              "About",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            _buildSettingsTile(null, "Terms and Privacy Policy", () {
              // Open terms and privacy policy
            }),
            ListTile(
              title: Text(
                "App Version: 1.0.0",
                style: TextStyle(color: Colors.grey[400]), // Lighter grey for contrast
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(IconData? icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Colors.white) : null,
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: onTap,
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
