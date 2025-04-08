import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:course_connect/User/Ai_course_finder/ChooseCountry.dart';
import 'package:course_connect/User/Ai_course_finder/FilterPage.md';
import 'package:course_connect/User/Sreens/BottomNavigation/Bottom_nav2.dart';
import 'package:course_connect/User/Profile/Notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Widget/Constands/Loading.dart';
import 'Colleges.dart';

class HomepageWrapper extends StatelessWidget {
  const HomepageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityBloc>(
      create: (context) => UniversityBloc()
        ..add(FetchAllUniversites(
          searchQuery: null,
        )),
      child: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> images = [
    "assets/Homepageimages/img_5.png",
    "assets/Homepageimages/main.png",
    "assets/img_12.png",
    "assets/img_12.png",
  ];
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (currentIndex + 1) % images.length;
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          title: const Text(
            "Find Your\nDream Degree",
            style: TextStyle(
              color: Color(0xFF048063),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notifications()),
                  );
                },
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Icon(Icons.notifications),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Slider
                      SizedBox(
                        height: 200,
                        width: 400,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: double.infinity,
                                    height:
                                        100, // Set a fixed height to match the image
                                    color: Colors
                                        .grey[300], // Placeholder background
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                      color: Colors.grey[600],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Indicator (Blue Dots)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(images.length, (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              height: 10,
                              width: currentIndex == index ? 30 : 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: currentIndex == index
                                    ? Colors.blueAccent
                                    : Colors.black.withOpacity(0.4),
                              ),
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChooseCountry(),
                                ),
                              );
                            },
                            child: Container(
                              height: 84,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                border: Border.all(
                                  // Border settings
                                  color: Colors.grey, // Border color
                                  width: 2, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    12), // Optional: Rounded corners
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.school,
                                    size: 30,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'AI \nCourse Finder',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Bottom_nav2(),
                                ),
                              );
                            },
                            child: Container(
                              height: 84,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                border: Border.all(
                                  // Border settings
                                  color: Colors.grey, // Border color
                                  width: 2, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    12), // Optional: Rounded corners
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.house_outlined,
                                      size: 30, color: Colors.blue),
                                  SizedBox(width: 10),
                                  Text(
                                    'Get \nAccommodation',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Popular Universities",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      //search query
                      Container(
                        height: 40,
                        width: 400,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
                        child: TextField(
                          onChanged: (value) {
                            context.read<UniversityBloc>().add(FetchUniversity(searchQuery: value));
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black,)
                            ),
                            hintText: 'Search Universities',
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                          ),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Expanded(
                      //       flex: 5,
                      //       child: TextFormField(
                      //         decoration: InputDecoration(
                      //             hintText: "search university or course",
                      //             prefixIcon: Icon(Icons.search),
                      //             border: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                     width: 1, color: Colors.black))),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Expanded(
                      //       flex: 1,
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     FilterPage()), // Correct Navigation
                      //           );
                      //         },
                      //         child: Container(
                      //           height: 50,
                      //           width: 50,
                      //           decoration: BoxDecoration(
                      //             color:
                      //                 Colors.grey[100], // Soft pink background
                      //             borderRadius: BorderRadius.circular(12),
                      //           ),
                      //           child: Center(
                      //             // Ensuring proper alignment
                      //             child: Icon(
                      //               Icons.tune,
                      //               color: Colors.brown,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child:
                                BlocConsumer<UniversityBloc, UniversityState>(
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, // Two columns
                                      crossAxisSpacing:
                                          10, // Space between columns
                                      mainAxisSpacing: 10, // Space between rows
                                      childAspectRatio:
                                          0.75, // Adjusted for better image fit
                                    ),
                                    itemCount: state.University.length,
                                    itemBuilder: (context, index) {
                                      final university =
                                          state.University[index];

                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return Collages_Wrapper(
                                                  university: university
                                                      .Universityname);
                                            },
                                          ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
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
                                                    imageUrl: university.UniversityimageURL.toString(),

                                                    // imageUrl: university
                                                    //         .UniversityimageURL
                                                    //     .toString(),
                                                    height: 140,
                                                    width: 160,
                                                    fit: BoxFit.cover,

                                                    // Show a loading indicator while fetching the image
                                                    placeholder:
                                                        (context, url) =>
                                                            Center(
                                                      child:
                                                          Loading_Widget(),
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
                                                    university.Universityname
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.left,
                                                  )),
                                              SizedBox(height: 4),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  child: Text(
                                                    university.Country
                                                            .toString()
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Colors.grey[700]),
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
                    ],
                  ),
                ))
              ],
            )));
  }

  CustomButton({required Null Function() onPressed, required String label}) {}
}
