import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import '../../Profile/AboutUs.dart';
import '../../Profile/ContactUs.dart';
import '../../Profile/EditProfilePage.dart';
import '../../Profile/TermsandConditions.dart';
import '../Authentication/LoginUser.dart';
import 'PrivacyPolicy.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<AuthBloc>()..add(FetchUserDetailsById());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile Header
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Userloading) {
                return const Center(child: Loading_Widget());
              } else if (state is UserByidLoaded) {
                final user = state.Userdata;
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            30), // Rounded corners for image
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: user.image.toString(),
                            width: 100, // Adjusted width
                            height: 100, // Adjusted height
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Container(
                              width: 100,
                              height: 100,
                              color:
                                  Colors.transparent, // Placeholder background
                              child: Center(
                                child: Loading_Widget(), // Loading indicator
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300], // Placeholder background
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
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(' ${user.email ?? ''}',
                          style: TextStyle(color: Colors.grey)),
                      Text(' ${user.phone ?? ''}',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage(
                                    image: state.Userdata.image)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Edit Profile"),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox();
            },
          ),

          // Profile Options (Each Separately)
          Expanded(
            child: ListView(
              children: [
                // About Us
                Container(
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
                    leading: Icon(Icons.info, color: Colors.blue, size: 24),
                    title: Text(
                      "About Us",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()),
                      );
                    },
                  ),
                ),

                // Contact Us
                Container(
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
                    leading: Icon(Icons.call, color: Colors.blue, size: 24),
                    title: Text(
                      "Contact Us",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      );
                    },
                  ),
                ),

                // Terms & Conditions
                Container(
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
                    leading:
                        Icon(Icons.description, color: Colors.blue, size: 24),
                    title: Text(
                      "Terms & Conditions",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsAndConditions()),
                      );
                    },
                  ),
                ),

                // Privacy Policy
                Container(
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
                    leading: Icon(Icons.lock, color: Colors.blue, size: 24),
                    title: Text(
                      "Privacy Policy",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyPolicy()),
                      );
                    },
                  ),
                ),

                // Remove Account
                Container(
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
                    leading:
                        Icon(Icons.remove_circle, color: Colors.red, size: 24),
                    title: Text(
                      "Remove Account",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      // Handle Remove Account action
                    },
                  ),
                ),

                // Log Out
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is UnAuthenticated) {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return UserLogin_auth();
                        },
                      ));
                    }
                  },
                  child: Container(
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
                      leading:
                          Icon(Icons.exit_to_app, color: Colors.red, size: 24),
                      title: Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        final Authbloc = BlocProvider.of<AuthBloc>(context);
                        Authbloc.add(SigOutEvent());
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return UserLogin_auth();
                        //   },
                        // ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
