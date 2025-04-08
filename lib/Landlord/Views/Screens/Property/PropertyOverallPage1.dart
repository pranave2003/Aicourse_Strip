import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controller/Bloc/Property/Property/Property_auth_block.dart';
import '../../../../Controller/Bloc/Property/Property/Property_auth_state.dart';
import '../../../../Widget/Constands/Loading.dart';

class LandlordInfoWrapper extends StatelessWidget {
  const LandlordInfoWrapper({super.key, required this.propertyId});
  final String propertyId; // Specify the type

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PropertyAuthBlock>(
      create: (context) => PropertyAuthBlock()
        ..add(FetchPropertyDetailsById(Property_id: propertyId)),
      child: const Propertyoverallpage1(), // Use const for better performance
    );
  }
}

class Propertyoverallpage1 extends StatelessWidget {
  const Propertyoverallpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<PropertyAuthBlock, PropertyAuthState>(
        listener: (context, state) {
          if (state is RefreshProperty) {
            context
                .read<PropertyAuthBlock>()
                .add(FetchProperty(searchQuery: null));
          }
        },
        builder: (context, state) {
          if (state is Propertygetloading) {
            return const Center(child: Loading_Widget());
          } else if (state is Propertyfailerror) {
            return Center(child: Text(state.error.toString()));
          } else if (state is PropertyLoadedbyid) {
            final PropertyAuthState = state.Property; // Renamed for clarity
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "View Property Details",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  height: 100,
                                  width: 250,
                                  child: CarouselSlider(

                                    options: CarouselOptions(
                                      autoPlay: true,
                                      height: 100,
                                      viewportFraction: 1.0,
                                      enableInfiniteScroll: false,
                                      enlargeCenterPage: true,
                                    ),
                                    items: PropertyAuthState.propertyImageURL!.map((imageUrl) {
                                      return CachedNetworkImage(
                                        imageUrl: imageUrl,
                                        width: 500,
                                        height: 500,
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) => Container(
                                          width: 50,
                                          height: 50,
                                          color: Colors.grey[50],
                                          child: Center(child: Loading_Widget()),
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                          width: 50,
                                          height: 50,
                                          color: Colors.grey[300],
                                          child: Icon(Icons.image_not_supported,
                                              size: 50, color: Colors.grey[600]),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          buildRowFields(
                            "Property Name",
                            PropertyAuthState.propertyName.toString(),
                            "Property Address",
                            PropertyAuthState.propertyAddress.toString(),
                          ),
                          buildRowFields(
                            "Country",
                            PropertyAuthState.country.toString(),
                            "State",
                            PropertyAuthState.state.toString(),
                          ),
                          buildRowFields(
                            "City",
                            PropertyAuthState.city.toString(),
                            "Area",
                            PropertyAuthState.propertyArea.toString(),
                          ),

                          buildRowFields(
                            "About Property",
                            PropertyAuthState.aboutProperty.toString(),
                            "Room Type",
                            PropertyAuthState.roomTypes.toString(),
                          ),
                          buildReadOnlyField(
                            "Room Size",
                            PropertyAuthState.roomSizes.toString(),
                          ),
                          buildRowFields(
                            "Available From",
                            PropertyAuthState.availableFrom.toString(),
                            "Move In Date",
                            PropertyAuthState.moveInDate.toString(),
                          ),
                          buildRowFields(
                            "Bedroom",
                            PropertyAuthState.bedroom.toString(),
                            "Bathroom",
                            PropertyAuthState.bathroom.toString(),
                          ),
                          buildRowFields(
                            "Kitchen",
                            PropertyAuthState.kitchen.toString(),
                            "Furnishing Options",
                            PropertyAuthState.furnishingOptions.toString(),
                          ),
                          buildRowFields(
                            "Weekly Amount",
                            PropertyAuthState.propertyAmountWeek.toString(),
                            "Monthly Amount",
                            PropertyAuthState.propertyAmountMonth.toString(),
                          ),
                          buildRowFields(
                            "Token Amount",
                            PropertyAuthState.tokenAmount.toString(),
                            "Stay Durations",
                            PropertyAuthState.stayDurations.toString(),
                          ),
                          buildRowFields(
                            "Sexual Orientations",
                            PropertyAuthState.sexualOrientations.toString(),
                            "Minimum Stay",
                            PropertyAuthState.minimumStay.toString(),
                          ),
                          buildRowFields(
                            "Maximum Stay",
                            PropertyAuthState.maximumStay.toString(),
                            "Owner Name",
                            PropertyAuthState.ownerName.toString(),
                          ),
                          buildRowFields(
                            "Owner Phone",
                            PropertyAuthState.ownerPhone.toString(),
                            "Ownership Proof",
                            PropertyAuthState.ownershipProof.toString(),
                          ),
                          buildRowFields(
                            "Parking",
                            PropertyAuthState.parking.toString(),
                            "Bill Status",
                            PropertyAuthState.billStatus.toString(),
                          ),
                          buildRowFields(
                            "Pets Allowed",
                            PropertyAuthState.pets.toString(),
                            "Smoking Allowed",
                            PropertyAuthState.smoking.toString(),
                          ),
                          buildRowFields(
                            "Ban",
                            PropertyAuthState.ban.toString(),
                            "One Signal ID",
                            PropertyAuthState.oneSignalId.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox(); // Return an empty box if no state matches
        },
      ),
    );
  }

  Widget buildRowFields(
      String label1, String value1, String label2, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(child: buildReadOnlyField(label1, value1)),
          const SizedBox(width: 20),
          Expanded(child: buildReadOnlyField(label2, value2)),
        ],
      ),
    );
  }

  Widget buildReadOnlyField(String label, String value, {Widget? child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: value,
          ),
        ),
        if (child != null) child, // Add child widget if provided
      ],
    );
  }
}
