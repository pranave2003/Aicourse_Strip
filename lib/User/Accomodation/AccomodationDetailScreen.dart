import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_block.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Widget/Constands/Loading.dart';

class PropertyWrapper extends StatelessWidget {
  const PropertyWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PropertyAuthBlock>(
      create: (context) => PropertyAuthBlock()
        ..add(FetchProperty(
          searchQuery: null,
        )),
      child: AccommodationDetailScreen(),
    );
  }
}

class AccommodationDetailScreen extends StatefulWidget {
  const AccommodationDetailScreen({super.key});
  @override
  State<AccommodationDetailScreen> createState() =>
      _AccommodationDetailScreenState();
}

class _AccommodationDetailScreenState extends State<AccommodationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Text(
          "Finding Perfect Home for You",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search by university or property",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Student housing near Yale University",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: BlocConsumer<PropertyAuthBlock, PropertyAuthState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is PropertyLoading) {
                        return Center(
                          child: Loading_Widget(),
                        );
                      } else if (state is Propertyfailerror) {
                        return Text(state.error.toString());
                      } else if (state is PropertyLoaded) {
                        if (state.Property.isEmpty) {
                          // Return "No data found" if txhe list is empty
                          return Center(
                            child: Text(
                              "No property is available for the given name.",
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
                            crossAxisCount: 2, // Two columns
                            crossAxisSpacing: 10, // Space between columns
                            mainAxisSpacing: 10, // Space between rows
                            childAspectRatio:
                                0.75, // Adjusted for better image fit
                          ),
                          itemCount: state.Property.length,
                          itemBuilder: (context, index) {
                            final property = state.Property[index];

                            // return InkWell(
                            //   onTap: () {
                            //     Navigator.push(context,
                            //         MaterialPageRoute(
                            //           builder: (context) {
                            //             return Collages_Wrapper(
                            //                 university: university
                            //                     .Universityname);
                            //           },
                            //         ));
                            //   },
                            //   child:
                            return Container(
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10),
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          10), // Uncomment if needed
                                      child: CachedNetworkImage(
                                        imageUrl: property.propertyImageURL
                                            .toString(),

                                        // imageUrl: university
                                        //         .UniversityimageURL
                                        //     .toString(),
                                        height: 140,
                                        width: 160,
                                        fit: BoxFit.cover,

                                        // Show a loading indicator while fetching the image
                                        placeholder: (context, url) => Center(
                                          child: Loading_Widget(),
                                        ),

                                        // Show an error icon if the image fails to load
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                          Icons.image_not_supported,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      )),
                                  SizedBox(height: 8),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        property.propertyName.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      )),
                                  SizedBox(height: 4),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        property.city.toString().toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700]),
                                        textAlign: TextAlign.left,
                                      )),
                                ],
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
          ],
        ),
      ),
    );
  }
}
