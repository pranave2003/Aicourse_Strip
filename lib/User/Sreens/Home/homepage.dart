
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_connect/User/Accomodation/AccomodationDetailScreen.dart';
import 'package:course_connect/User/Ai_course_finder/ChooseCountry.dart';
import 'package:course_connect/User/Sreens/BottomNavigation/Bottom_nav2.dart';
import 'package:course_connect/User/Sreens/auth/Notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Widget/Constands/Widget.dart';
import '../../../Widget/Constands/colors.dart';
import '../../../Widget/Constands/button.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> images = [ "img_5.png","img_6.png"];
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
    });}

  List<Map<String, dynamic>> serviceList = [
    {
      "icon": "assets/img_2.png",
      "name": "Harvard \n University",
      "surname": "Massachusetts,USA"
    }, {
      "icon": "assets/img_15.png",
      "name": "Stanford \n University",
      "surname": "Stanford, California"
    }, {
      "icon": "assets/img_16.png",
      "name":" Chicago	\n University",
      "surname": "Massachusetts,USA"
    }, {
      "icon": "assets/img_17.png",
      "name": "Toronto \n University",
      "surname": "Toronto,Canada"
    }, {
      "icon": "assets/img_19.png",
      "name": "Yale \n University",
      "surname": "United States"
    }, {
      "icon": "assets/img_20.png",
      "name": "Ota go\n University",
      "surname": "Dunedin, New Zealand"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 120,
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
                  // Navigate to Notifications Page
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
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "search university or course",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.black))),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child:
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[100], // Soft pink background
                          borderRadius: BorderRadius.circular(12),
                        ),

                      child:IconButton( icon: Icon(Icons.tune, color: Colors.brown),
                    onPressed: () {
                      // Filter button action
                    },
                    ),
                      ),
                  )
                ],
              ),
              SizedBox(height: 10),

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
    "assets/Homepageimages/${images[index]}",
    fit: BoxFit.cover,
    width: double.infinity,
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
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Container(
    height: 10,
    width: currentIndex == index ? 30 : 10,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: currentIndex == index ? Colors.blueAccent : Colors.black.withOpacity(0.4),
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
                    child:
                    Container(
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
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  ),
SizedBox(width:10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bottom_nav2(),
                        ),
                      );
                    },
                  child:Container(
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
                              fontSize: 16, fontWeight: FontWeight.bold),
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

              Row(
                children: [
                  Expanded(
                    child: GridView.builder(
                      physics:
                      NeverScrollableScrollPhysics(), // Prevents extra scrolling
                      shrinkWrap: true,
                      padding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two columns
                        crossAxisSpacing: 10, // Space between columns
                        mainAxisSpacing: 10, // Space between rows
                        childAspectRatio: 0.75, // Adjusted for better image fit
                      ),
                      itemCount: serviceList.length,
                      itemBuilder: (context, index) {
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
                                // borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  serviceList[index]["icon"].toString(),
                                  height: 120,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    serviceList[index]["name"].toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  )),
                              SizedBox(height: 4),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    serviceList[index]["surname"].toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[700]),
                                    textAlign: TextAlign.left,
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ))],
    )));
  }

  CustomButton({required Null Function() onPressed, required String label}) {}
}