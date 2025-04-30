import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:course_connect/Landlord/Views/Screens/Property/PropertyEdit.dart';
import 'package:course_connect/Landlord/Views/Screens/Property/PropertyOverallPage1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import '../../../../Controller/Bloc/Property/Property/Property_auth_block.dart';
import '../../../../Controller/Bloc/Property/Property/Property_auth_state.dart';
import '../../../../Widget/Constands/Loading.dart';

class Propertymainwrapper extends StatelessWidget {
  const Propertymainwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PropertyAuthBlock()..add(FetchProperty(searchQuery: null,landlordid: Lanloardid_global)),
      child: Property(),
    );
  }
}

class Property extends StatefulWidget {



  const Property({super.key});

  @override
  State<Property> createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: const [
                    Text("Welcome ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Landlord, ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0A71CB))),
                  ],
                ),
              ),
              Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      child: Icon(Icons.notification_add)),
                  const SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.5, color: Colors.grey),
                    ),
                    child: Row(
    //                   children: [
    // BlocBuilder<LandloardAuthBloc, LandloardAuthState>(
    // builder: (context, state) {
    // if (state is Landlordloading) {
    // return const Center(child: Loading_Widget());
    // } else if (state is LandlordByidLoaded) {
    // final user = state.;
    // return Padding(
    // padding: EdgeInsets.all(16.0),
    // child: Column(
    // children: [
    // ClipRRect(
    // borderRadius: BorderRadius.circular(
    // 30), // Rounded corners for image
    // child: Center(
    // child: CachedNetworkImage(
    // imageUrl: user.image.toString(),
    // width: 100, // Adjusted width
    // height: 100, // Adjusted height
    // fit: BoxFit.fill,
    // placeholder: (context, url) => Container(
    // width: 100,
    // height: 100,
    // color:
    // Colors.transparent, // Placeholder background
    // child: Center(
    // child: Loading_Widget(), // Loading indicator
    // ),
    // ),
    // errorWidget: (context, url, error) => Container(
    // width: 100,
    // height: 100,
    // color: Colors.grey[300], // Placeholder background
    // child: Icon(
    // Icons.image_not_supported,
    // size: 50,
    // color: Colors.grey[600],
    // ),
    // ),
    // ),
    // ),
    // ),
    // ],
    // ),
                      children: const [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              AssetImage('assets/Profile/img_3.png'),
                        ),
                        SizedBox(width: 10),
                        Text("Landlord",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Property Management",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocConsumer<PropertyAuthBlock, PropertyAuthState>(
              listener: (context, state) {
                if (state is RefreshProperty) {
                  context
                      .read<PropertyAuthBlock>()
                      .add(FetchProperty(searchQuery: null,landlordid: Lanloardid_global));
                }
              },
              builder: (context, state) {
                if (state is PropertyLoading) {
                  return Center(child: Loading_Widget());
                } else if (state is PropertyFailError) {
                  return Center(child: Text(state.error.toString()));
                } else if (state is PropertyLoaded) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      horizontalMargin: 2.0,
                      columnSpacing: 75,
                      dataRowMaxHeight: 120,
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey.shade300),
                      columns: [
                        _buildColumn('S/no'),
                        _buildColumn('Property\n Name'),
                        _buildColumn('Address'),
                        _buildColumn('Property\n Cost'),
                        _buildColumn('Available \nfrom'),
                        _buildColumn('Image'),
                        _buildColumn('Action'),
                      ],
                      rows: List.generate(
                        state.Property.length,
                        (index) {
                          final property = state.Property[index];
                          return DataRow(
                            cells: [
                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text((index + 1).toString(),
                                    style: const TextStyle(
                                        fontWeight:
                                            FontWeight.bold)), // Add S/no cell
                              )),
                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(property.propertyName ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              )),
                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(property.propertyAddress ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              )),
                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(property.tokenAmount ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              )),
                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(property.availableFrom ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              )),
                              DataCell(
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
                                      items: property.propertyImageURL!.map((imageUrl) {
                                        return CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          width: 200,
                                          height: 100,
                                          fit: BoxFit.cover,
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
                              ),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_red_eye,
                                        color: Colors.green),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LandlordInfoWrapper(
                                                  propertyId:
                                                      property.propertyId ??
                                                          ''),
                                        ),
                                      );
                                      print('View button pressed');
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PropertyEdit(
                                            propertyName:
                                                property.propertyName ?? '',
                                            propertyAddress:
                                                property.propertyAddress ?? '',
                                            propertyArea:
                                                property.propertyArea ?? '',
                                            country: property.country ?? '',
                                            state: property.state ?? '',
                                            city: property.city ?? '',
                                            roomTypes: property.roomTypes ?? '',
                                            roomSizes: property.roomSizes ?? '',
                                            availableFrom:
                                                property.availableFrom ?? '',
                                            moveInDate:
                                                property.moveInDate ?? '',
                                            propertyImageURL: property
                                                .propertyImageURL
                                                .toString(),
                                            aboutProperty:
                                                property.aboutProperty ?? '',
                                            bedroom: property.bedroom ?? '',
                                            bathroom: property.bathroom ?? '',
                                            kitchen: property.kitchen ?? '',
                                            propertyAmountWeek:
                                                property.propertyAmountWeek ??
                                                    '',
                                            propertyAmountMonth:
                                                property.propertyAmountMonth ??
                                                    '',
                                            tokenAmount:
                                                property.tokenAmount ?? '',
                                            minimumStay:
                                                property.minimumStay ?? '',
                                            maximumStay:
                                                property.maximumStay ?? '',
                                            ownerName: property.ownerName ?? '',
                                            ownerPhone:
                                                property.ownerPhone ?? '',
                                            propertyTotal:
                                                property.propertyTotal ?? '',
                                            parking: property.parking ?? '',
                                            billStatus:
                                                property.billStatus ?? '',
                                            pets: property.pets ?? '',
                                            oneSignalId:
                                                property.oneSignalId ?? '',
                                            furnishingOptions:
                                                property.furnishingOptions ??
                                                    '',
                                            smoking: property.smoking ?? '',
                                            sexualOrientations:
                                                property.sexualOrientations ??
                                                    '',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      _showDeleteConfirmationDialog(context,
                                          () {
                                        context.read<PropertyAuthBlock>().add(
                                              DeleteProperty(
                                                Property_id:
                                                    property.propertyId ?? '',
                                              ),
                                            );
                                      });
                                    },
                                  ),
                                ],
                              )),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  DataColumn _buildColumn(String title) {
    return DataColumn(
      label: Text(
        title,
        style: TextStyle(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Property"),
          content: const Text(
              "Are you sure you want to delete this property? This action cannot be undone."),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
              onPressed: () {
                onConfirm(); // Call the onConfirm callback
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
