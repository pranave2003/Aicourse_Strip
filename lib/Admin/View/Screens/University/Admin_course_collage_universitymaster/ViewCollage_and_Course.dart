import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Controller/Bloc/University_block/university_bloc.dart';
import '../../../../../User/Sreens/Home/Colleges.dart';
import '../../../../../Widget/Constands/Loading.dart';
import 'View_admin_collagewrapper.dart';

class Viewcollagewrapper extends StatefulWidget {
  const Viewcollagewrapper({super.key});

  @override
  State<Viewcollagewrapper> createState() => _ViewcollagewrapperState();
}

class _ViewcollagewrapperState extends State<Viewcollagewrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityBloc>(
      create: (context) => UniversityBloc()
        ..add(FetchAllUniversites(
          searchQuery: null,
        )),
      child: ViewcollageAndCourse(),
    );
  }
}

class ViewcollageAndCourse extends StatefulWidget {
  const ViewcollageAndCourse({super.key});

  @override
  State<ViewcollageAndCourse> createState() => _ViewcollageAndCourseState();
}

class _ViewcollageAndCourseState extends State<ViewcollageAndCourse> {
  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1200)
      return 5;
    else if (width >= 900)
      return 5;
    else if (width >= 600)
      return 4;
    else
      return 2;
  }

  double _getAspectRatio(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 600) return 0.85;
    return 0.75;
  }

  double _getImageHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 900) return 160;
    if (width >= 600) return 140;
    return 120;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.yellowAccent,
        toolbarHeight: 80,
        title: Text(
          "Explore Destination",
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
                      context
                          .read<UniversityBloc>()
                          .add(FetchAllUniversites(searchQuery: value));
                    },
                    decoration: InputDecoration(
                        hintText: "search university or course",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Top Universities in United states",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
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

                            // Responsive rules based on maxWidth
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
                            } else if (constraints.maxWidth >= 300) {
                              crossAxisCount = 1;
                              aspectRatio = 0.65;
                              imageHeight = 120;
                            } else {
                              crossAxisCount = 1;
                              aspectRatio = 0.4;
                              imageHeight = 100;
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
                                        return Admin_view_Collages_Wrapper(
                                          university: university.Universityname,
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
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
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
                                            university.Universityname
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            university.Country.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[700]),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Rank ",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10)),
                                            Text("${university.Rank}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Icon(Icons.star,
                                                color: Colors.amber, size: 10),
                                          ],
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
