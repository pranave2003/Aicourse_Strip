import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_block.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_state.dart';
import 'package:course_connect/Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'package:course_connect/User/Accomodation/BookingFormPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Widget/Constands/Loading.dart';

int currentIndex = 0;

class PropertyInfoScreenWrapper extends StatelessWidget {
  const PropertyInfoScreenWrapper(
      {super.key, required this.propertyId, this.availableFrom});


  final propertyId;
  final availableFrom;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<PropertyAuthBlock>(
      create: (context) => PropertyAuthBlock()
        ..add(FetchPropertyDetailsById(Property_id: propertyId)),
      child: PropertyDetailsPage(),
    );
  }
}

class PropertyDetailsPage extends StatefulWidget {
  const PropertyDetailsPage({super.key});

  @override
  _PropertyDetailsPageState createState() => _PropertyDetailsPageState();
}

class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<String> imageUrls = [
    "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentIndex + 1) % imageUrls.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<PropertyAuthBlock, PropertyAuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PropertyLoading) {
            return Loading_Widget();
          }
          if (state is PropertyLoadedbyid) {
            final property = state.Property;

            // Define the serviceList here after university is available
            List<Map<String, dynamic>> serviceList = [
              {
                "icon": Icons.local_parking,
                "name": "Parking:${property.parking}"
              },

              {
                "icon": Icons.chair_alt_outlined,
                "name": "Furnishing: \n ${property.furnishingOptions}"
              },
              {
                "icon": Icons.bed_outlined,
                "name": "${property.bedroom} Bedroom"
              },
              {"icon": Icons.kitchen,  "name": "${property.kitchen} kitchen"},
              {"icon": Icons.bathtub, "name": "${property.bathroom} Bathroom" },
              {
                "icon": Icons.book,
                "name": "Bills included:\n  ${property.billStatus}"
              },
              // Add more services as needed
            ];
            List<Map<String, dynamic>> featureList = [
              {
                "icon": Icons.king_bed,
                "name": "${property.bedroom} Bedroom"
              },

              {
                "icon": Icons.smoke_free,
                "name": "Smoking Allowed:\n  ${property.smoking}"
              },
              {"icon": Icons.pets,  "name": "Pets Allowed:\n  ${property.pets}"},
            ];

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      width: 600,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 250, // Match the SizedBox height
                              autoPlay: true,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              pauseAutoPlayOnTouch:
                                  true, // This lets users control manually
                            ),
                            items: property.propertyImageURL!.map((imageUrl) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey[50],
                                    child: Center(child: Loading_Widget()),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Colors.grey[300],
                                    child: Icon(Icons.image_not_supported,
                                        size: 50, color: Colors.grey[600]),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              property.propertyName ?? 'Property Name',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.green, size: 18),
                                const SizedBox(width: 4),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${property.propertyAddress ?? 'Property Address'}, ${property.city ?? 'City'}",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    Text(
                                      "${property.state ?? 'State'}, ${property.country ?? 'Country'}",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
            //             ElevatedButton(
            //               onPressed: googleMapsUrl.isEmpty ? null : _launchURL, // Disable button if URL is not available
            //               style: ElevatedButton.styleFrom(
            //                 foregroundColor: Colors.white, backgroundColor: Colors.green, // Set text color to white
            //                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Add padding to button
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(8), // Rounded corners for the button
            //                 ),
            //               ), child: googleMapsUrl.isEmpty
            //                 ? CircularProgressIndicator() // Show loader until URL is fetched
            //           : Text('View Location'), // Button text
            // ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Features (3 bedroom, smoking, pets)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: featureList
                          .map((feature) => _buildFeatureChip(feature))
                          .toList(),
                    ),
                    const SizedBox(height: 16),

                    // Property Information
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Property Information",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    Text(
                      property.aboutProperty ?? 'Property Description',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),

                    const SizedBox(height: 16),

                    // Amenities Section
                    SingleChildScrollView(
                      // scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Amenities",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      children: serviceList
                          .map((service) => _buildInfoCard(service))
                          .toList(),
                    ),

                    // const SizedBox(height: 8),
                    // GridView.count(
                    //   shrinkWrap: true,
                    //   crossAxisCount: 3,
                    //   childAspectRatio: 2,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   children: serviceList
                    //       .map((amenity) => _buildAmenityTile(amenity))
                    //       .toList(),
                    // ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        const Text(
                          "Rent and Payment Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ), // Rent and Payment Details

                    const SizedBox(height: 8),
                    _buildDetailText("Amount per Week",
                        "${property.propertyAmountWeek ?? 'N/A'}"),
                    _buildDetailText("Amount per Week",
                        "${property.propertyAmountMonth ?? 'N/A'}"),
                    _buildDetailText(
                        "Token Amount", property.tokenAmount ?? 'N/A'),
                    _buildDetailText(
                        "propertyTotal", property.propertyTotal ?? 'N/A'),
                    _buildDetailText(
                        "Minimum Stay", property.minimumStay ?? 'N/A'),
                    _buildDetailText(
                        "Maximum Stay", property.maximumStay ?? 'N/A'),

                    const SizedBox(height: 16),

                    // Additional Details
                    Row(
                      children: [
                        const Text(
                          "Additional Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    _buildDetailText("Sexual Orientation",
                        "${property.sexualOrientations ?? 'N/A'}"),
                    // _buildDetailText("Bills Included", "${property.billStatus ?? 'N/A'}"),
                    _buildDetailText(
                        "Property Type", "${property.roomTypes ?? 'N/A'}"),
                    _buildDetailText(
                        "Room Size", "${property.roomSizes ?? 'N/A'}"),
                    _buildDetailText(
                        "Property Area", "${property.propertyArea ?? 'N/A'}"),
                    _buildDetailText(
                        "Available From", property.availableFrom ?? 'N/A'),
                    _buildDetailText(
                        "Move-in Date", property.moveInDate ?? 'N/A'),

                    const SizedBox(height: 16),

                    // Owner Details
                    Row(
                      children: [
                        const Text(
                          "Owner Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    _buildDetailText(
                        "Owner Name", "${property.ownerName ?? 'N/A'}"),
                    _buildDetailText(
                        "Phone Number", "${property.ownerPhone ?? 'N/A'}"),
                    _buildDetailText("Total Property Amount",
                        property.propertyTotal ?? 'N/A'),

                    const SizedBox(height: 20),

                    // Enquire Now Button
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookingformpageScreenWrapper(
                                propertyId: property.propertyId,
                                Landloard_id: property.LandlordId,
                                landloardname: property.ownerName,
                                landloardphone: property.ownerPhone,
                                propertyName: property.propertyName,
                                tokenAmount: property.tokenAmount,
                                propertyImageURL: property.propertyImageURL![0],
                                country: property.country,
                                state: property.state,
                                city: property.city,
                                propertyTotal: property.propertyTotal,
                                propertyAddress: property.propertyAddress,
                                    userid:userid_global,
                                    owneremail:property.owneremail,

                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 51,
                          width: 231,
                          decoration: BoxDecoration(
                            color: Color(0xff0A71CB),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Enquire Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

Widget _buildFeatureChip(Map<String, dynamic> feature) {
  return SizedBox(
    height: 44, // Increased height
    width: 123, // Increased width
    child: Chip(
      avatar: Icon(feature['icon'], size: 10, color: Colors.black),
      label: Text(feature['name'], style: const TextStyle(fontSize: 10)),
      backgroundColor: Colors.grey[200],
    ),
  );
}

Widget _buildAmenityTile(Map<String, dynamic> amenity) {
  return Container(
    height: 200,
    width: 400,
    padding: const EdgeInsets.all(8),
    // Increased padding
    constraints: const BoxConstraints(minWidth: 900, minHeight: 400),
    // Increased size
    child: Column(
      children: [
        Icon(amenity['icon'], color: Colors.blue, size: 80),
        // Increased icon size
        const SizedBox(height: 6),
        // Increased spacing
        Text(amenity['name'],
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
        // Increased font size
      ],
    ),
  );
}

// Widget for Feature Chips (Bedrooms, Smoking, Pets)
// Widget _buildFeatureChip(Map<String, dynamic> feature) {
//   return Chip(
//     avatar: Icon(feature['icon'], size: 18, color: Colors.black),
//     label: Text(feature['name'], style: const TextStyle(fontSize: 12)),
//     backgroundColor: Colors.grey[200],
//   );
// }
//
// // Widget for Amenities Grid
// Widget _buildAmenityTile(Map<String, dynamic> amenity) {
//   return Column(
//     children: [
//       Icon(amenity['icon'], color: Colors.blue, size: 70),
//       const SizedBox(height: 4),
//       Text(amenity['name'],
//           textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
//     ],
//   );
// }

// Widget for Rent, Additional, and Owner Details
Widget _buildDetailText(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        ],
      ),
    ),
  );
}

//

Widget _buildInfoCard(Map<String, dynamic> service) {
  return Container(
    height: 49,
    width: 40,
    padding: const EdgeInsets.all(8),
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 3,
        ),
      ],
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(service['icon'], size: 40, color: Colors.black),
          const SizedBox(height: 5),
          Text(
            service['name'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

// Property Features (Bedrooms, Smoking, Pets Allowed)

// Amenities List
