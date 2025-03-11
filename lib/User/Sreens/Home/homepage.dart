
import 'package:carousel_slider/carousel_slider.dart';
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
  List images = ["img_3.png", "bro.png", "splash.png"];
  List<Map<String, dynamic>> serviceList = [
    {
      "icon": "assets/img_2.png",
      "name": "Harward \n University",
      "surname": "Massachusetts,USA"
    }, {
      "icon": "assets/img_2.png",
      "name": "Harward \n University",
      "surname": "Massachusetts,USA"
    }, {
      "icon": "assets/img_2.png",
      "name": "Harward \n University",
      "surname": "Massachusetts,USA"
    }, {
      "icon": "assets/img_2.png",
      "name": "Harward \n University",
      "surname": "Massachusetts,USA"
    }, {
      "icon": "assets/img_2.png",
      "name": "Harward \n University",
      "surname": "Massachusetts,USA"
    }, {
      "icon": "assets/img_2.png",
      "name": "Harward \n University",
      "surname": "Massachusetts,USA"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.yellowAccent,
          toolbarHeight: 120,
          title: Text(
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
                onTap: () {},
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
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
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFB9DDDB)),
                      child: Image.asset("assets/img_1.png",height:10),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
                items: images.map((imagePath) {
                  return Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxHeight: 180, maxWidth: double.infinity),
                      child: CarouselView(
                        backgroundColor: Color(0xFFB9DDDB),
                        itemExtent: MediaQuery.of(context).size.width,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          images.length,
                          (index) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Top Ranking Universities",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(height: 14),
                                          Text(
                                              "Explore top ranking universities \nand find your destination "),
                                        ],
                                      ),
                                      SizedBox(
                                          width: 88,
                                          height:41,
                                          child: CustomButton(
                                              onPressed: () {},
                                              label: "Explore",))
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset(images[index]))
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      height: index == 0 ? 10 : 11,
                      width: index == 0 ? 40 : 11,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: index == 0
                            ? blueColor
                            : Colors.black.withOpacity(0.4),
                        border: index == 0
                            ? null
                            : Border.all(color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                  );
                }),
              ),


              // CarouselSlider(
              //   options: CarouselOptions(
              //     height: 200,
              //     autoPlay: true,
              //     enlargeCenterPage: true,
              //     aspectRatio: 16 / 9,
              //     viewportFraction: 0.8,
              //     onPageChanged: (index, reason) {
              //       setState(() {
              //         _currentIndex = index; // Update index
              //       });
              //     },
              //   ),
              //   items: images.map((imagePath) {
              //     return Container(
              //       margin: EdgeInsets.symmetric(horizontal: 5),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         color: Color(0xFFB9DDDB),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(left: 10.0),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Top Ranking Universities",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 18,
              //                   ),
              //                 ),
              //                 SizedBox(height: 14),
              //                 Text("Explore top ranking universities \nand find your destination"),
              //                 SizedBox(
              //                   width: 88,
              //                   height: 41,
              //                   child: CustomButton(
              //                     onPressed: () {},
              //                     label: "Explore",
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Container(
              //             height: 100,
              //             width: 100,
              //             child: Image.asset(imagePath),
              //           ),
              //         ],
              //       ),
              //     );
              //   }).toList(),
              // ),
              //
              // SizedBox(height: 10),
              //
              // // Circle Indicators
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: List.generate(
              //     images.length,
              //         (index) {
              //       bool isActive = index == _currentIndex;
              //       return AnimatedContainer(
              //         duration: Duration(milliseconds: 300),
              //         margin: EdgeInsets.symmetric(horizontal: 4),
              //         height: 10,
              //         width: isActive ? 40 : 10,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: isActive ? Colors.blue : Colors.black.withOpacity(0.4),
              //           border: !isActive
              //               ? Border.all(color: Colors.black.withOpacity(0.4))
              //               : null,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height:10),
              Container(
                height: 84,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Color(0xB4B4B4),
                  // Background color
                  color: Colors.grey,
                  border: Border.all(
                    // Border settings
                    // color: Color(0xD8E9E8),
                    color: Color(0xFFD8E9E8),
                    // Border color
                    width: 2, // Border width
                  ),
                  borderRadius:
                      BorderRadius.circular(12), // Optional: Rounded corners
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.school,
                      size: 32,
                     color: Colors.black,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Choose a suitable University',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 84,
                    width: 190,
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
                  SizedBox(width: 10),
                  Container(
                    height: 84,
                    width: 190,
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
                                  height: 150,
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
        ));
  }

  CustomButton({required Null Function() onPressed, required String label}) {}
}
