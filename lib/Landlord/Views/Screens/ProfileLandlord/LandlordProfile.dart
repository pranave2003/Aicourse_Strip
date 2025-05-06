import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_connect/Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widget/Constands/Loading.dart';
import 'EditProfile2.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<LandloardAuthBloc>().add(FetchLandlordDetailsById());
  }

  Future<void> _navigateToEditProfile(BuildContext context, state) async {
    // Await navigation and check for true result to refresh
    final bool? updated = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditProfile2(


              image: state.Userdata.image.toString(),

              name: state.Userdata.name.toString(),
              phone_number: state.Userdata.phone_number.toString(),
              uid: state.Userdata.uid.toString(),
            ),
      ),
    );
    if (updated == true) {
      // print("Profile updated, fetching user details again");
      context.read<LandloardAuthBloc>().add(FetchLandlordDetailsById());
    }
  }


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
                  TextEditingController nameController =
                  TextEditingController(text: user.name ?? '');
                  TextEditingController emailController =
                  TextEditingController(text: user.email ?? '');
                  TextEditingController phoneController =
                  TextEditingController(text: user.phone_number ?? '');

                  return Center(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: user.image.toString(),
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.transparent,
                                    child: const Center(
                                      child: Loading_Widget(),
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[300],
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${user.name ?? ''}',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),

                        ElevatedButton(
                          onPressed: () =>
                              _navigateToEditProfile(context, state),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Edit Profile"),
                        ),
                        buildInputField(
                          icon: Icons.person,
                          label: "Name",
                          initialValue: user.name ?? '',
                          controller: nameController,
                        ),
                        buildInputField(
                          icon: Icons.email,
                          label: "Email",
                          initialValue: user.email ?? '',
                          controller: emailController,
                          readOnly: true, // Email is typically not editable
                        ),
                        buildInputField(
                          icon: Icons.phone_android,
                          label: "Phone",
                          initialValue: user.phone_number ?? '',
                          controller: phoneController,
                        ),

                        SizedBox(height: 30), // Adjust space at the bottom

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
  Widget buildInputField({
    required IconData icon,
    required String label,
    required String initialValue,
    required TextEditingController controller,
    bool readOnly = false,
  }) {
    controller.text = initialValue; // Set initial value
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
      ),
    );
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
}
