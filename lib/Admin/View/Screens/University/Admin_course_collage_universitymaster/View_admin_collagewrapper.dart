import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_connect/Admin/View/Screens/Courses/Addcourses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Controller/Bloc/University_block/university_bloc.dart';
import '../../../../../User/Sreens/Home/Course.dart';
import '../../../../../Widget/Constands/Loading.dart';
import 'View_admin_course.dart';

class Admin_view_Collages_Wrapper extends StatelessWidget {
  const Admin_view_Collages_Wrapper(
      {super.key, this.university, this.Universityname});
  final university;
  final Universityname;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityBloc>(
      create: (context) => UniversityBloc()
        ..add(Fetchallcollage(
          University: university,
          searchQuery: null,
        )),
      child: Admin_view_collage(
        university: university,
      ),
    );
  }
}

class Admin_view_collage extends StatefulWidget {
  const Admin_view_collage({super.key, this.university});
  final university;
  @override
  State<Admin_view_collage> createState() => _Admin_view_collageState();
}

class _Admin_view_collageState extends State<Admin_view_collage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Colleges",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    onChanged: (value) {
                      context.read<UniversityBloc>().add(Fetchallcollage(
                          searchQuery: null, University: widget.university));
                    },
                    decoration: InputDecoration(
                        hintText: "search Colleges",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Text(
            //   "Top Universities in United states",
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 24,
            //       fontWeight: FontWeight.bold),
            // ),
            Row(
              children: [
                Expanded(
                  child: BlocConsumer<UniversityBloc, UniversityState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is UniversitysLoading) {
                        return Center(
                          child: Loading_Widget(),
                        );
                      } else if (state is Universitysfailerror) {
                        return Text(state.error.toString());
                      } else if (state is University_loaded) {
                        if (state.University.isEmpty) {
                          // Return "No data found" if txhe list is empty
                          return Center(
                            child: Text(
                              "No university courses available for the given name.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          );
                        }
                        return GridView.builder(
                          physics:
                              NeverScrollableScrollPhysics(), // Prevents extra scrolling
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5, // Two columns
                            crossAxisSpacing: 10, // Space between columns
                            mainAxisSpacing: 10, // Space between rows
                            childAspectRatio:
                                0.75, // Adjusted for better image fit
                          ),
                          itemCount: state.University.length,
                          itemBuilder: (context, index) {
                            final university = state.University[index];

                            return state.University.isEmpty
                                ? Text("data")
                                : InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Admin_Coursewrapper(
                                            university:
                                                university.Universityname,
                                            collage: university.Collegename,
                                          );
                                        },
                                      ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 5,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10),
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10), // Uncomment if needed
                                              child: CachedNetworkImage(
                                                imageUrl: university
                                                        .UniversityimageURL
                                                    .toString(),
                                                height: 140,
                                                width: 160,
                                                fit: BoxFit.cover,

                                                // Show a loading indicator while fetching the image
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child: Loading_Widget(),
                                                ),

                                                // Show an error icon if the image fails to load
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(
                                                  Icons.image_not_supported,
                                                  size: 50,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                          SizedBox(height: 8),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              child: Text(
                                                university.Collegename
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.left,
                                              )),
                                          SizedBox(height: 4),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              child: Text(
                                                university.collagecode
                                                    .toString()
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[700]),
                                                textAlign: TextAlign.left,
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                          },
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
