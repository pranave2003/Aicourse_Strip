import 'package:course_connect/Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controller/Bloc/User_Authbloc/Userauthmodel/Usermodel.dart';

class EditProfilePage extends StatefulWidget {
  final String image;
  final String name;
  final String phone_number;
  final String uid;

  const EditProfilePage({
    Key? key,
    required this.image,
    required this.name,
    required this.phone_number,
    required this.uid,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController phoneController;

  String? imageUrl;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone_number);
    imageUrl = widget.image.isNotEmpty ? widget.image : null;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, false); // Return false if cancelled
          },
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.green),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final profile = UserModel(
                  name: nameController.text,
                  phone_number: phoneController.text,
                  uid: widget.uid,
                );

                context.read<AuthBloc>().add(EditProfile(user: profile));
              }
            },
          ),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ProfileImageSuccess) {
            setState(() {
              imageUrl = state.image;
            });
          }
          if (state is ProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Profile updated successfully!"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context, true);
          }
          // if (state is ProfileLoading) {
          //   return const Center(child: Loading_Widget());
          // }

          if (state is ProfileUpdateLoading) {
            // Could optionally show a progress indicator in listener but also in builder
          }
        },
        builder: (context, state) {
          if (state is ProfileUpdateLoading) {
            return const Center(child: Loading_Widget());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: imageUrl != null
                              ? Image.network(
                            imageUrl!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _placeholderImage();
                            },
                          )
                              : _placeholderImage(),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              context.read<AuthBloc>().add(
                                  PickAndUploadImageEvent());
                            },
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.blue,
                              child:
                              Icon(Icons.camera_alt, color: Colors.white,
                                  size: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state is ProfileImageLoading) ...[
                    const SizedBox(height: 10),
                    const Loading_Widget(),
                    const Text(
                        "Profile Updating...", textAlign: TextAlign.center),
                  ],
                  const SizedBox(height: 30),

                  // Name field
                  buildTextField(
                    "Name",
                    controller: nameController,
                    validator: (value) =>
                    (value == null || value.isEmpty)
                        ? 'Name is required'
                        : null,
                  ),

                  // Phone field
                  buildTextField(
                    "Phone",
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                    (value == null || value.isEmpty)
                        ? 'Phone number is required'
                        : null,
                  ),

                  const SizedBox(height: 20),

                  // Update button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final profile = UserModel(
                          name: nameController.text,
                          phone_number: phoneController.text,
                          uid: widget.uid,
                        );

                        context.read<AuthBloc>().add(EditProfile(
                            user: profile)); // ✅ Use correct event
                      }
                    },
                    child: state is ProfileUpdateLoading
                        ? const Loading_Widget()
                        : const Text(
                      "Update",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTextField(String label, {
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  Widget _placeholderImage() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(60),
      ),
      child: const Icon(
        Icons.person,
        size: 50,
        color: Colors.grey,
      ),
    );
  }
}