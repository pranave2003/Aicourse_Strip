import 'package:course_connect/Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controller/Bloc/User_Authbloc/Userauthmodel/Usermodel.dart';
import '../../Widget/Constands/CustomTextfield.dart';

class EditProfilePage extends StatefulWidget {
  final String image;
  final String name;
  final String phone_number;
  final String uid;


  EditProfilePage({required this.image,required this.name,required this.phone_number,required this.uid});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? imagePath;


  bool isPasswordVisible = false;

  // ✅ Local mutable image URL
  late String imageUrl;


  @override
  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    phoneController.text = widget.phone_number;
    imageUrl = widget.image;
  }

  // void initState() {
  //   super.initState();
  //   nameController = TextEditingController(text: "Charlotte King");
  //   emailController = TextEditingController(text: "johnkinggraphics@gmail.com");
  //   phoneController = TextEditingController(text: "+91 6895312");
  //
  //   imageUrl = widget.image; // Initial image from widget
  // }

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
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.green),
            onPressed: () {
              // Save profile changes
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ProfileImageSuccess) {
            // ✅ Update the mutable local variable on success
            setState(() {
              imageUrl = state.image;
            });
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                          imageUrl, // ✅ Use the mutable imageUrl here
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return state is ProfileImageLoading
                                ? Loading_Widget()
                                : Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.zero,
                              ),
                              child: Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey[600],
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(PickAndUploadImageEvent());
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.camera_alt,
                                color: Colors.white, size: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state is ProfileImageLoading)
                  Column(
                    children: [
                      Loading_Widget(),
                      Text("Profile Updating....."),
                    ],
                  ),



                  SizedBox(height: 30), // Added space before form fields

                  // Form Fields
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                  children: [
                  CustomTextForm(
                  controller: nameController,
                  prefixIcon: Icon(Icons.house_rounded),
                  hintText: " Name",
                  ),
                  SizedBox(height: 10),
                  CustomTextForm(
                  controller: phoneController,
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Mobile Number",
                  ),
                  SizedBox(height: 70),

                  // Update Button
                  BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
          if (state is ProfileSuccess) {
          Navigator.of(context).pop();
          }
          },
          builder: (context, state) {
          return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
          onPressed: () {
          UserModel shop = UserModel(
          uid: widget.uid,
          name: nameController.text,
          phone: phoneController.text,
          );

          context.read<AuthBloc>().add(details());
          },
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          ),
          child: state is ProfileSuccess
          ? Loading_Widget()
              : Text(
          "Update",
          style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          ),
          ),
          color: blueColor,
          ),
          );
          },
          ),
          ],
            ),
          )]));
        },
      ),
    );
  }

  Widget buildEditableField(String label, TextEditingController controller, bool isPassword) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isPasswordVisible,
        onTap: () {
          if (controller.text != "") {
            controller.clear();
          }
        },
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
}
