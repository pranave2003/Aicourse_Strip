import 'package:course_connect/Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: LandlordProfile(),
    debugShowCheckedModeBanner: false,
  ));
}

class LandlordProfile extends StatelessWidget {
  // Controllers initialized with default values

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<LandloardAuthBloc, LandloardAuthState>(
  builder: (context, state) {
    if (state is Landlordloading) {
    return const Center(child: CircularProgressIndicator());
    } else if (state is LandlordByidLoaded) {
      final user = state.Userdata;
       TextEditingController nameController = TextEditingController(text: user.name ?? '');
       TextEditingController emailController = TextEditingController(text: user.email ?? '');
       TextEditingController addressController = TextEditingController(text: user.Adress ?? '');

      return Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile/img_4.png'),
            ),
            SizedBox(height: 10),
            Text(
                '${user.name ?? ''}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            ElevatedButton.icon(
              onPressed: () {},

              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: blueColor,
                foregroundColor: Colors.white,

              // Adjust space at the bot
              ),
            ),
            buildInputField(Icons.person, '${user.name ?? ''}',nameController),
            buildInputField(Icons.email,'${user.email ?? ''}', emailController),
            buildInputField(Icons.home, '${user.Adress ?? ''}', addressController),
            SizedBox(height: 30),  // Adjust space at the bottom

            SizedBox(height: 30),
          ],
        ),
      );
    }
    return SizedBox();
  },
),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  // Static input fields without editing capability
  Widget buildInputField(IconData icon, String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),  // Increased padding for better spacing
      child: TextField(
        controller: controller,
        enabled: false,  // Disable editing
        style: TextStyle(fontSize: 16),  // Ensure text is readable
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: blueColor),
          labelText: title,
          labelStyle: TextStyle(fontSize: 16),  // Ensure label text is clear
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: blueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: blueColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: blueColor.withOpacity(0.5), width: 1),
          ),
        ),
      ),
    );
  }
}
Widget buildInfoContainer(String title, String content) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: blueColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}