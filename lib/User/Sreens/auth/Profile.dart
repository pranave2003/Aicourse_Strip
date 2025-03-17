import 'package:flutter/material.dart';
import 'EditProfilePage.dart'; // Import the Edit Profile Page

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile Header
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/profile/img_1.png.jpg"), // Profile image
                ),
                SizedBox(height: 10),
                Text(
                  "Charlotte King",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("@johnkinggraphics", style: TextStyle(color: Colors.grey)),
                Text("9845384854", style: TextStyle(color: Colors.grey)),

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text("Edit Profile"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Profile Options (Inside Containers)
          Expanded(
            child: ListView(
              children: [
                profileOption(Icons.info, "About Us", Colors.blue, () {}),
                profileOption(Icons.call, "Contact Us", Colors.blue, () {}),
                profileOption(Icons.description, "Terms & Conditions", Colors.blue, () {}),
                profileOption(Icons.lock, "Privacy Policies", Colors.blue, () {}),
                profileOption(Icons.remove_circle, "Remove Account", Colors.red, () {}), // Red Icon
                profileOption(Icons.exit_to_app, "Log Out", Colors.red, () {}), // Red Icon
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Profile Option with Container
  Widget profileOption(IconData icon, String title, Color iconColor, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 24), // Dynamic Icon Color
        title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
