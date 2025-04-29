import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Controller/Bloc/University_block/university_bloc.dart';
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
  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1200)
      return 6; // Desktop
    else if (width >= 900)
      return 5; // Large tablet
    else if (width >= 600)
      return 4; // Tablet
    else
      return 2; // Mobile
  }

  double _getAspectRatio(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 600) return 0.8;
    return 0.75;
  }

  double _getImageHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 900) return 180;
    if (width >= 600) return 160;
    return 140;
  }

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
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            int crossAxisCount;
                            double aspectRatio;
                            double imageHeight;

                            if (constraints.maxWidth >= 1200) {
                              crossAxisCount = 5;
                              aspectRatio = 0.75;
                              imageHeight = 140;
                            } else if (constraints.maxWidth >= 800) {
                              crossAxisCount = 4;
                              aspectRatio = 0.7;
                              imageHeight = 130;
                            } else if (constraints.maxWidth >= 600) {
                              crossAxisCount = 3;
                              aspectRatio = 0.65;
                              imageHeight = 120;
                            } else {
                              crossAxisCount = 2;
                              aspectRatio = 0.6;
                              imageHeight = 110;
                            }

                            return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: aspectRatio,
                              ),
                              itemCount: state.University.length,
                              itemBuilder: (context, index) {
                                final university = state.University[index];

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return Admin_Coursewrapper(
                                          university: university.Universityname,
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
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: university
                                                .UniversityimageURL.toString(),
                                            height: imageHeight,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Center(child: Loading_Widget()),
                                            errorWidget:
                                                (context, url, error) => Icon(
                                              Icons.image_not_supported,
                                              size: 50,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            university.Collegename.toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            university.collagecode.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[700]),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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
