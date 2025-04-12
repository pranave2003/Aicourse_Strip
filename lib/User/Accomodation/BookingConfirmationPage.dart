import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controller/Bloc/Property/Property/Property_auth_block.dart';
import '../../Controller/Bloc/Property/Property/Property_auth_state.dart';
import '../../Widget/Constands/Loading.dart';

// Wrapper Widget with BlocProvider
class BookingConfirmformpageScreenWrapper extends StatelessWidget {
  const BookingConfirmformpageScreenWrapper({
    super.key,
    required this.propertyName,
    required this.tokenAmount,
    required this.country,
    required this.city,
    required this.propertyImageURL,
    required this.propertyId,
    required this.state,
    this.userid_global,
    required this.propertyTotal,
  });

  final userid_global;
  final String propertyName;
  final String tokenAmount;
  final String propertyImageURL;
  final String country;
  final String city;
  final String state;
  final String propertyId;
  final String propertyTotal;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<PropertyAuthBlock>(
      create: (context) =>
      PropertyAuthBlock()..add(FetchPropertyDetailsById(Property_id: propertyId)),
      child: BookingConfirmationPage(
        propertyName: propertyName,
        tokenAmount: tokenAmount,
        propertyId: propertyId,
        propertyImageURL: propertyImageURL,
        country: country,
        city: city,
        state: state,
        propertyTotal: propertyTotal,
      ),
    );
  }
}

// Main Booking Confirmation Page
class BookingConfirmationPage extends StatefulWidget {
  final String propertyName;
  final String tokenAmount;
  final String propertyImageURL;
  final String propertyId;
  final String country;
  final String city;
  final String state;
  final String propertyTotal;

  const BookingConfirmationPage({
    super.key,
    required this.propertyName,
    required this.tokenAmount,
    required this.propertyImageURL,
    required this.propertyId,
    required this.country,
    required this.city,
    required this.state,
    required this.propertyTotal,
  });


  @override
  State<BookingConfirmationPage> createState() => _BookingConfirmationPageState();
}

class _BookingConfirmationPageState extends State<BookingConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
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

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  // Property Details
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 250,
                            width: 200,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: 250,
                                    autoPlay: false,
                                    viewportFraction: 1.0,
                                    enableInfiniteScroll: false,
                                    enlargeCenterPage: false,
                                  ),
                                  items: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.propertyImageURL.toString(),
                                        width: 250,
                                        height: 250,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Container(
                                          color: Colors.grey[50],
                                          child: Center(child: Loading_Widget()),
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                          color: Colors.grey[300],
                                          child: Icon(
                                            Icons.image_not_supported,
                                            size: 50,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.propertyName,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: Colors.blue, size: 14),
                                  SizedBox(width: 4),
                                  Text(
                                    "${widget.city}, ${widget.country}",
                                    style: TextStyle(
                                        color: Colors.grey.shade700, fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [

                                  Text(
                                    widget.tokenAmount ?? '',
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Text("/Week"),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Booking Dates
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFEEF7FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: _buildDateTile("Booking From", "April 20, 2025")),
                        SizedBox(width: 12),
                        Expanded(child: _buildDateTile("Booking To", "April 30, 2025")),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Fee Details
                  Text("Fee & Tax Details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  _buildFeeDetailRow("Token Amount", "£${widget.propertyTotal}"),
                  _buildFeeDetailRow("Token Amount", "£${widget.tokenAmount}"),
                  Divider(),
                  _buildFeeDetailRow("Total", "£2815", isBold: true),

                  Spacer(),

                  // Pay Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Payment logic goes here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0A71CB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                      child: Text(
                        "Pay Token Amount (£${property.tokenAmount})",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),

                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          }

          return SizedBox(); // Default if state is not matched
        },
      ),
    );
  }

  Widget _buildDateTile(String label, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7D4C4C),
          ),
        ),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeeDetailRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: isBold ? 16 : 14,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(
                  fontSize: isBold ? 16 : 14,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
