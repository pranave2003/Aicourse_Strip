import 'package:flutter/material.dart';

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Colors.white,
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
              // Property Image
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Image.network(
              //     'https://via.placeholder.com/400x200', // Replace with actual image URL
              //     width: double.infinity,
              //     height: 200,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=600",
                    width: 370,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 12),

                  // Property Name, Location & Price
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
                        "£350\n/week",
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
                  const Text(
                    "Property Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Located in the heart of Boston’s vibrant community, 1027 Commonwealth Avenue offers premium accommodations designed for students and modern lifestyles...",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 16),

                  // Amenities Section
                  const Text(
                    "Amenities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    children: amenitiesList
                        .map((amenity) => _buildAmenityTile(amenity))
                        .toList(),
                  ),
                  const SizedBox(height: 16),

                  // Rent and Payment Details
                  const Text(
                    "Rent and Payment Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildDetailText("Amount per Week", "£350"),
                  _buildDetailText("Amount per Month", "£1500"),
                  _buildDetailText("Token Amount", "£300 (2 weeks rent)"),
                  _buildDetailText("Minimum Stay", "3 months"),
                  _buildDetailText("Maximum Stay", "12 months"),
                  const SizedBox(height: 16),

                  // Additional Details
                  const Text(
                    "Additional Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  const Text(
                    "Owner Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildDetailText("Owner Name", "Mr. David Thompson"),
                  _buildDetailText("Phone Number", "+44 7911 123456"),
                  _buildDetailText("Ownership Proof", "Title Deed (Verified)"),
                  const SizedBox(height: 20),

                  // Enquire Now Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Enquire Now",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }

  // Widget for Feature Chips (Bedrooms, Smoking, Pets)
  Widget _buildFeatureChip(Map<String, dynamic> feature) {
    return Chip(
      avatar: Icon(feature['icon'], size: 18, color: Colors.black),
      label: Text(feature['name'], style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.grey[200],
    );
  }

  // Widget for Amenities Grid
  Widget _buildAmenityTile(Map<String, dynamic> amenity) {
    return Column(
      children: [
        Icon(amenity['icon'], color: Colors.blue, size: 28),
        const SizedBox(height: 4),
        Text(amenity['name'],
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Widget for Rent, Additional, and Owner Details
  Widget _buildDetailText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        ],
      ),
    );
  }
}

// Property Features (Bedrooms, Smoking, Pets Allowed)
List<Map<String, dynamic>> featureList = [
  {"icon": Icons.bed, "name": "3 Bedroom"},
  {"icon": Icons.smoking_rooms, "name": "Smoking\n Allowed"},
  {"icon": Icons.pets, "name": "Pets\n Allowed"},
];

// Amenities List
List<Map<String, dynamic>> amenitiesList = [
  {"icon": Icons.wifi, "name": "Free WiFi"},
  {"icon": Icons.fitness_center, "name": "24-hour Fitness Centre"},
  {"icon": Icons.local_parking, "name": "Parking"},
  {"icon": Icons.tv, "name": "Fully Furnished"},
  {"icon": Icons.bathtub, "name": "Two Bathrooms"},
  {"icon": Icons.kitchen, "name": "Private Kitchen"},
];
