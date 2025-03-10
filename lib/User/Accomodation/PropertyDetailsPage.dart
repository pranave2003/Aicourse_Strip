



import 'dart:async';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            imageUrls[index],
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(imageUrls.length, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: _currentIndex == index ? 12 : 8,
                            height: _currentIndex == index ? 12 : 8,
                            decoration: BoxDecoration(
                              color: _currentIndex == index ? Colors.blue : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
          SizedBox(height:20),
          Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Portchester House",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.green, size: 18),
                              SizedBox(width: 4),
                              Text(
                                "25 Sussex Street, May Mews, Leeds, UK",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "£350/week",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(
                    "Located in the heart of Boston’s vibrant community, 1027 Commonwealth Avenue offers premium accommodations designed for students and modern lifestyles...",
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
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  GridView(

                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),

                    children: serviceList.map((service) => _buildInfoCard(service)).toList(),
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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),// Rent and Payment Details

                  const SizedBox(height: 8),
                  _buildDetailText("Amount per Week", "£350"),
                  _buildDetailText("Amount per Month", "£1500"),
                  _buildDetailText("Token Amount", "£300 (2 weeks rent)"),
                  _buildDetailText("Minimum Stay", "3 months"),
                  _buildDetailText("Maximum Stay", "12 months"),
                  const SizedBox(height: 16),

                  // Additional Details
                  Row(
                    children: [
                      const Text(
                        "Additional Details",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  _buildDetailText("LGBTQ+ Friendly", "Yes"),
                  _buildDetailText(
                      "Bills Included", "Yes (Electricity, Wi-Fi, Hosting)"),
                  _buildDetailText("Bonus Ticket", "10ft x 10ft Storage"),
                  _buildDetailText("Available From", "April 1, 2025"),
                  _buildDetailText("Move-in Date", "Flexible"),
                  const SizedBox(height: 16),

                  // Owner Details
                  Row(
                     children: [
                       const Text(
                         "Owner Details",
                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                       ),
                     ],
                  ),


              const SizedBox(height: 8),
                  _buildDetailText("Owner Name", "Mr. David Thompson"),
                  _buildDetailText("Phone Number", "+44 7911 123456"),
                  _buildDetailText("Ownership Proof", "Title Deed (Verified)"),
                  const SizedBox(height: 20),

                  // Enquire Now Button
                  SizedBox(
                    width: double.infinity,
                    child:InkWell(
                      onTap: () {

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
    )
    );
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
      padding: const EdgeInsets.all(8), // Increased padding
      constraints: const BoxConstraints(minWidth: 900, minHeight: 400), // Increased size
      child: Column(
        children: [
          Icon(amenity['icon'], color: Colors.blue, size: 80), // Increased icon size
          const SizedBox(height: 6), // Increased spacing
          Text(amenity['name'],
              textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)), // Increased font size
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
}
//
List<Map<String, dynamic>> featureList = [
  {"icon": Icons.wifi, "name": "free wifi"},
  {"icon": Icons.smoke_free, "name": "smoking  allowed"},
  {"icon": Icons.pets, "name": "Pets Allowed"},
];


Widget _buildInfoCard(Map<String, dynamic> service) {
  return Container(
    height:49,
    width:40,
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
List<Map<String, dynamic>> serviceList  = [
  {"icon": Icons.fitness_center, "name": "24-hour Fitness Centre"},
  {"icon": Icons.local_parking, "name": "Parking"},
  {"icon": Icons.tv, "name": "Fully Furnished"},
  {"icon": Icons.bed_outlined, "name": "Two Bedroom"},
  {"icon": Icons.bathtub, "name": "Two Bathrooms"},
  {"icon": Icons.kitchen, "name": "Private Kitchen"},
];


