import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_block.dart';
import 'package:course_connect/Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controller/Bloc/Property/Property/Property_auth_state.dart';
import '../../../../Widget/Constands/Loading.dart';

class ViewHouses extends StatefulWidget {
  const ViewHouses({super.key});

  @override
  State<ViewHouses> createState() => _ViewHousesState();
}

class _ViewHousesState extends State<ViewHouses> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      "Welcome ",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Admin, ",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0A71CB)),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
                  SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.5, color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20, // Ensure a proper radius is set
                          backgroundColor: Colors.grey, // Fallback color
                          backgroundImage: AssetImage('assets/Profile/img.png'), // Corrected Path
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Admin",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Property View Page",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          BlocConsumer<PropertyAuthBlock, PropertyAuthState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is PropertyLoading) {
                  return Center(child: Loading_Widget());
                } else if (state is Propertyfailerror) {
                  return Text(state.error.toString());
                } else if (state is PropertyLoaded) {
                  if (state.Property.isEmpty) {
                    // Return "No data found" if txhe list is empty
                    return Center(
                      child: Text(
                        "No data found",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  return Expanded(
                    child: SingleChildScrollView(

                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(

                        scrollDirection: Axis.vertical,

                        child: DataTable(
                          // dividerThickness: 4.0,
                          headingRowColor: MaterialStateColor.resolveWith((
                              states) => Colors.grey.shade300),
                          horizontalMargin: 2.0,

                          columnSpacing: 50,
                          // Adjust spacing
                          dataRowMinHeight: 70,
                          // Minimum row height
                          dataRowMaxHeight: 180,

                          // columnSpacing: 15,
                          // dataRowHeight: 100,
                          decoration: BoxDecoration(color: Colors.white),

                          columns: [
                            _buildColumn('S/no'),
                            _buildColumn('Property Name'),
                            _buildColumn('Token Amount'),
                            _buildColumn('Image'),
                            _buildColumn('Address'),
                            _buildColumn('About Property'),
                            _buildColumn('Period'),
                            _buildColumn('Property Information'),

                          ],

                          rows: List.generate(
                          state.Property.length,
                              (index) {
                            final property = state.Property[index];

                            return DataRow(
                              cells: [
                                // Serial Number
                                DataCell(Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                )),

                                // Property Name
                                DataCell(Text(
                                  property.propertyName ?? "N/A",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                )),

                                // Property Price (e.g. monthly amount)
                                DataCell(Text(
                                  "${property.propertyAmountMonth ?? 'N/A'} ",
                                )),

                                // Property Image URL or Image (replace with Image.network for actual image)
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

                                // Full Address
                                DataCell(Text(
                                  "${property.propertyAddress ?? ''}\n${property.city ?? ''}, ${property.state ?? ''}, ${property.country ?? ''}",
                                )),

                                // Property Details
                                DataCell(Text(
                                  "sqft: ${property.propertyArea ?? 'N/A'}\n"
                                      "Rooms: ${property.bedroom ?? 'N/A'}\n"
                                      "Bathrooms: ${property.bathroom ?? 'N/A'}\n"
                                      "Furnishing: ${property.furnishingOptions ?? 'N/A'}\n"
                                      "Kitchen: ${property.kitchen ?? 'N/A'}",
                                )),

                                // Stay Duration
                                DataCell(Text(
                                  property.minimumStay != null
                                      ? "${property.minimumStay} Month"
                                      : "N/A",
                                )),

                                // About Property
                                DataCell(Text(
                                  property.aboutProperty ?? "N/A",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                )),
                              ],
                            );
                          },
                        ),

                        // Example thickness value

                        ),

                      ),


                    ),


                  );
                }
                return SizedBox();
  },
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
            fontSize: 16),
      ),
    );
  }

  DataRow _buildRow(String index) {
    return DataRow(
      cells: [
        DataCell(Text(index)),
        DataCell(Text("Portchester House")),
        DataCell(Text("300 Pounds")),
        DataCell(Text("img.jpg")),
        DataCell(Text(
            "25 Baker Street\nMarylebone\nLondon\nW1U 8EW\nUnited Kingdom")),
        DataCell(Text(
            "sqft: 1200\nRooms: 2\nBathrooms: 2\nFurnishing: Furnished\nKitchen: Yes")),
        DataCell(Text("1 Month")),
        DataCell(Text("Located near Boston University")),
      ],
    );

  }
  DataRow _buildRow2(String index) {
    return DataRow(
      cells: [
        DataCell(Text(index)),
        DataCell(Text("Victoria house")),
        DataCell(Text("300 Pounds")),
        DataCell(Text("img.jpg")),
        DataCell(Text(
            "25 Baker Street\nMarylebone\nLondon\nW1U 8EW\nUnited Kingdom")),
        DataCell(Text(
            "sqft: 1200\nRooms: 2\nBathrooms: 2\nFurnishing: Furnished\nKitchen: Yes")),
        DataCell(Text("1 Month")),
        DataCell(Text("Located near Boston University")),
      ],
    );

  }
}





