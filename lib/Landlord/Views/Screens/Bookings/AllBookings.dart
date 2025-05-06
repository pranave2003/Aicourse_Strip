import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_connect/Controller/Bloc/Booking/BookingAuthEvent.dart';
import 'package:course_connect/Controller/Bloc/Booking/BookingState.dart';
import 'package:course_connect/Controller/Bloc/Booking/Booking_authblock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import '../../../../Widget/Constands/Loading.dart';

class Pending_Booking_wrapper extends StatelessWidget {
  const Pending_Booking_wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingAuthblock>(
      create: (context) => BookingAuthblock()
        ..add(FetchBookings(searchQuery: null,landlordid:Lanloardid_global )),
      child: Bookingstate(),
    );
  }
}
String _getStatusText(String? status) {
  switch (status) {
    case '1':
      return 'Confirmed';
    case '2':
      return 'Rejected';
    case '0':
    default:
      return 'Pending';
  }
}

Color _getStatusColor(String? status) {
  switch (status) {
    case '1':
      return Colors.green;
    case '2':
      return Colors.red;
    case '0':
    default:
      return Colors.orange;
  }
}

class Bookingstate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Welcome ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("Landlord,",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0A71CB))),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          child: Icon(Icons.notification_add)),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 0.5, color: Colors.grey),
                        ),
                        child:  Row(
                          children: [
                            BlocBuilder<LandloardAuthBloc, LandloardAuthState>(
                              builder: (context, state) {
                                if (state is Landlordloading) {
                                  return const Center(child: CircularProgressIndicator());
                                } else if (state is LandlordByidLoaded) {
                                  final user = state.Userdata;
                                  TextEditingController nameController = TextEditingController(text: user.name ?? '');
                                  TextEditingController emailController = TextEditingController(text: user.email ?? '');
                                  TextEditingController phoneController = TextEditingController(text: user.phone_number ?? '');

                                  return Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.grey[300],
                                            backgroundImage: user.image != null && user.image!.isNotEmpty
                                                ? CachedNetworkImageProvider(user.image!)
                                                : null,
                                            child: user.image == null || user.image!.isEmpty
                                                ? const Icon(Icons.person, size: 50, color: Colors.white)
                                                : null,
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 4,
                                            child: GestureDetector(
                                              onTap: () {
                                                context.read<LandloardAuthBloc>().add(
                                                  PickAndUploadImageEvent(profile: user.uid!),
                                                );
                                              },

                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),

                            SizedBox(width: 10),
                            Text(
                              "Landlord",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Body with BLoC
            Expanded(
              child: BlocConsumer<BookingAuthblock, BookingState>(
                listener: (context, state) {
                  // if (state is Acceptorrejectstate) {
                  //   context.read<BookingAuthblock>().add(
                  //       FetchBookings(searchQuery: null));
                  // }
                },
                builder: (context, state) {
                  if (state is BookingLoading) {
                    return Center(child: Loading_Widget());
                  } else if (state is Bookingfailerror) {
                    return Center(child: Text("${state.error.toString()}"));
                  } else if (state is BookingLoaded) {
                    if (state.booking.isEmpty) {
                      return Center(
                        child: Text(
                          "No pending bookings found.",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.grey.shade300),
                          columnSpacing: 45,
                          dataRowMaxHeight: 100,
                          columns: [
                            _buildColumn('S/NO'),
                            _buildColumn('User Details'),
                            // _buildColumn('Payment Details'),
                            _buildColumn('Property Images'),

                            _buildColumn('Property Details'),
                            _buildColumn('Booking date and time'),
                            _buildColumn('Action'),
                          ],
                          rows: List.generate(state.booking.length, (index) {
                            final booking = state.booking[index];
                            return DataRow(
                              cells: [
                                DataCell(Text("${index + 1}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(
                            SizedBox(
                            width: 250,
                            child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                            Text(
                            booking.username.toString(),
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                            booking.useremail.toString(),
                            style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700]),
                            ), Text(
                            booking.userphonenumber.toString(),
                            style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700]),
                            ),
                            ],
                            ),
                            ),
                            ),
                                DataCell(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Container(
                                      height: 80,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            5), // Rounded corners for image
                                        child: CachedNetworkImage(
                                          imageUrl: booking.propertyImageURL
                                              .toString(),
                                          width: 100, // Adjusted width
                                          height: 50, // Adjusted height
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Container(
                                                width: 50,
                                                height: 50,
                                                color: Colors.grey[
                                                300], // Placeholder background
                                                child: Center(
                                                  child:
                                                  Loading_Widget(), // Loading indicator
                                                ),
                                              ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                                width: 50,
                                                height: 50,
                                                color: Colors.grey[
                                                300], // Placeholder background
                                                child: Icon(
                                                  Icons.image_not_supported,
                                                  size: 50,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),




                                // DataCell(
                                //   Padding(
                                //     padding: const EdgeInsets.symmetric(vertical: 10.0),
                                //     child: SizedBox(
                                //       height: 100,
                                //       width: 250,
                                //       child: (booking.propertyImageURL != null && booking.propertyImageURL!.isNotEmpty)
                                //           ? CarouselSlider(
                                //         options: CarouselOptions(
                                //           autoPlay: true,
                                //           height: 100,
                                //           viewportFraction: 1.0,
                                //           enableInfiniteScroll: false,
                                //           enlargeCenterPage: true,
                                //         ),
                                //         items: booking.propertyImageURL!.map((imageUrl) {
                                //           return CachedNetworkImage(
                                //             imageUrl: imageUrl,
                                //             width: 200,
                                //             height: 100,
                                //             fit: BoxFit.cover,
                                //             placeholder: (context, url) => Container(
                                //               width: 50,
                                //               height: 50,
                                //               color: Colors.grey[50],
                                //               child: const Center(child: Loading_Widget()),
                                //             ),
                                //             errorWidget: (context, url, error) => Container(
                                //               width: 50,
                                //               height: 50,
                                //               color: Colors.grey[300],
                                //               child: Icon(
                                //                 Icons.image_not_supported,
                                //                 size: 50,
                                //                 color: Colors.grey[600],
                                //               ),
                                //             ),
                                //           );
                                //         }).toList(),
                                //       )
                                //           : Container(
                                //         height: 100,
                                //         width: 250,
                                //         color: Colors.grey[200],
                                //         child: const Center(
                                //           child: Text("No images available"),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),


                                DataCell(
                                  SizedBox(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          booking.propertyName.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          booking.propertyaddress.toString(),
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[700]),
                                        ),
                                        Text(
                                          booking.propertycountry.toString(),
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[700]),
                                        ),Text(
                                          booking.tokenamount.toString(),
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          booking.bookingid.toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                             ),
                                        ),Text(
                                          booking.checkindate.toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                             ),
                                        ),Text(
                                          booking.checkoutdate.toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                             ),
                                        ),Text(
                                          booking.bookingdate.toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                             ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          booking.bookingtime.toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                                DataCell(
                                  Row(
                                    children: [
                                      booking.status == "1"
                                          ? Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.green[100],
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.check_circle, color: Colors.green),
                                            SizedBox(width: 6),
                                            Text(
                                              "Confirmed",
                                              style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                          : ElevatedButton.icon(
                                        onPressed: () {

                                          context.read<BookingAuthblock>().add(
                                            AcceptOrRejectBookings(
                                              bookingid: booking.bookingid,
                                              Status: "1", // Confirm status
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.check_circle_outline, size: 18),
                                        label: Text(
                                          'Confirm',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green[600], // Button color
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          elevation: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),



                              ],
                            );
                          }),
                        ),
                      ),
                    );
                  }
                  return SizedBox(); // fallback
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataColumn _buildColumn(String label) {
    return DataColumn(
      label: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}





//   /// **Table UI**
//   Widget _buildTable1() => SingleChildScrollView(
//
//     scrollDirection: Axis.horizontal,
//     child: DataTable(
//       headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300), // Grey color for the header
//
//       columnSpacing: 65,
//       dataRowMaxHeight: 160,
//       // columnSpacing: 20,
//       // // Adjust spacing
//       // dataRowMinHeight: 60,
//       // // Minimum row height
//       // dataRowMaxHeight: 100,
//
//       // Maximum row height
//       decoration: BoxDecoration(color: Colors.white),
//       columns: [
//         _buildColumn('S/NO'),
//         _buildColumn('Name'),
//         _buildColumn('Email'),
//         _buildColumn('Phone number'),
//         _buildColumn('Property Details'),
//         _buildColumn('Rental Period'),
//         // _buildColumn('ID proof'),
//         _buildColumn('Action'),
//       ],
//
//       rows: List.generate(
//         bookingsList.length,
//             (index) {
//           final landlord = bookingsList[index];
//           return DataRow(
//             cells: [
//               DataCell(Text(landlord.S_NO,
//                   style: TextStyle(fontWeight: FontWeight.bold))),
//               DataCell(Text(landlord.Name)),
//               DataCell(Text(landlord.Email)),
//               DataCell(Text(landlord.Phone_no)),
//               DataCell(
//                 SizedBox(
//                   width: 200, // Set a fixed width for better alignment
//                   child: Text(landlord.Property_Details, softWrap: true),
//                 ),
//               ),
//               DataCell(Text(landlord.Rental_Period)),
//               DataCell(Row(
//                 children: [
//                   OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(color: Colors.green, width: 2),
//                       // Green border
//                       padding: EdgeInsets.symmetric(
//                           vertical: 12, horizontal: 20),
//                     ),
//                     onPressed: () {
//                       // Handle Accept Action
//                     },
//                     child: Text(
//                       "Accept",
//                       style: TextStyle(color: Colors.green,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(color: Colors.red, width: 2),
//                       // Red border
//                       padding: EdgeInsets.symmetric(
//                           vertical: 12, horizontal: 20),
//                     ),
//                     onPressed: () {
//                       // Handle Reject Action
//                     },
//                     child: Text(
//                       "Reject",
//                       style: TextStyle(color: Colors.red,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               )),
//
//             ],
//           );
//         },
//       ),
//     ),
//   );
//
//
// }
// Widget _buildTable2() => SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: DataTable(
//     headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300), // Grey color for the header
//     columnSpacing: 70,
//     horizontalMargin: 2.0, // Adjust spacing
//     dataRowMinHeight: 60, // Minimum row height
//     dataRowMaxHeight: 150, // Maximum row height
//     columns: [
//       _buildColumn('S/NO'),
//       _buildColumn('Name'),
//       _buildColumn('Email'),
//       _buildColumn('Phone number'),
//       _buildColumn('Property_details'),
//       _buildColumn('Rental_Period'),
//       _buildColumn('Action'),
//     ],
//     rows: List.generate(
//       bookingsList.length,
//           (index) {
//         final landlord = bookingsList[index];
//         return DataRow(
//           cells: [
//             DataCell(Text(landlord.S_NO,
//                 style: TextStyle(fontWeight: FontWeight.bold))),
//             DataCell(Text(landlord.Name)),
//             DataCell(Text(landlord.Email)),
//             DataCell(Text(landlord.Phone_no)),
//             DataCell(
//               SizedBox(
//                 width: 200, // Set a fixed width for better alignment
//                 child: Text(landlord.Property_Details, softWrap: true),
//               ),
//             ),
//             DataCell(Text(landlord.Rental_Period)),
//             DataCell(Row(
//               children: [
//                 OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(color: Colors.green, width: 2), // Red border
//                     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10), // Rounded corners
//                     ),
//                   ),
//                   onPressed: () {
//                     // Handle Reject Action
//                   },
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.verified, color: Colors.green, size: 18), // Rejection Icon
//                       SizedBox(width: 8),
//                       Text(
//                         "Accepted",
//                         style: TextStyle(
//                           color: Colors.green,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//             )),
//           ],
//         );
//       },
//     ),
//   ),
// );
// Widget _buildTable3() => SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: DataTable(
//     headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300), // Grey color for the header
//     columnSpacing: 65,
//     // Adjust spacing
//     dataRowMinHeight: 60,
//     // Minimum row height
//     dataRowMaxHeight: 170,
//     // Maximum row height
//     decoration: BoxDecoration(color: Colors.white),
//     columns: [
//       _buildColumn('S/NO'),
//       _buildColumn('Name'),
//       _buildColumn('Email'),
//       _buildColumn('Phone number'),
//       _buildColumn('Property Details'),
//       _buildColumn('Rental Period'),
//       _buildColumn('Status'),
//     ],
//     rows: List.generate(
//       bookingsList.length,
//           (index) {
//         final landlord = bookingsList[index];
//         return DataRow(
//           cells: [
//             DataCell(Text(landlord.S_NO,
//                 style: TextStyle(fontWeight: FontWeight.bold))),
//             DataCell(Text(landlord.Name)),
//             DataCell(Text(landlord.Email)),
//             DataCell(Text(landlord.Phone_no)),
//             DataCell(Text(
//               "sqft: ${propertyName.toString() ?? 'N/A'}\n"
//                   "Rooms: ${property.bedroom ?? 'N/A'}\n"
//                   "Bathrooms: ${property.bathroom ?? 'N/A'}\n"
//                   "Furnishing: ${property.furnishingOptions ?? 'N/A'}\n"
//                   "Kitchen: ${property.kitchen ?? 'N/A'}",
//             )),
//             DataCell(Text(landlord.Rental_Period)),
//             DataCell(Row(
//               children: [
//                 OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(color: Colors.red, width: 2), // Red border
//                     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10), // Rounded corners
//                     ),
//                   ),
//                   onPressed: () {
//                     // Handle Reject Action
//                   },
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.verified, color: Colors.red, size: 18), // Rejection Icon
//                       SizedBox(width: 8),
//                       Text(
//                         "Rejected",
//                         style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )),
//
//           ],
//         );
//       },
//     ),
//   ),
// );
//
//
// // Helper function for styling the column headers
// DataColumn _buildColumn(String label) {
//   return DataColumn(
//     label: Text(
//       label,
//       style: TextStyle(fontWeight: FontWeight.bold), // Make header text bold
//     ),
//   );
// }
//
//
// /// **Sample Data (Replace with actual data from API or DB)**
//
// List<BookingsModel> bookingsList = [
//   BookingsModel(
//     S_NO: "1",
//     Name: "John Doe",
//     Email: "johndoe@gmail.com",
//     Phone_no: "+123456789",
//     Property_Details: "123 Main Street\nMarylebone\nLondon\nW1U 8EW\nUnited Kingdom",
//     Rental_Period: "1 month",
//     imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr09piP6jki0WLDGQnRLC2rmn5XHPtBZJ6Mg&s",
//   ),
//   BookingsModel(
//     S_NO: "2",
//     Name: "John Doe",
//     Email: "johndoe@gmail.com",
//     Phone_no: "+123456789",
//     Property_Details: "123 Main Street\nMarylebone\nLondon\nW1U 8EW\nUnited Kingdom",
//     Rental_Period: "1 month",
//     imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr09piP6jki0WLDGQnRLC2rmn5XHPtBZJ6Mg&s",
//   ),
// ];
//
//
// /// **Model Class for Landlord**
// class BookingsModel {
//   String S_NO, Name, Email, Phone_no, Property_Details, Rental_Period;
//
//   BookingsModel({
//     required this.S_NO,
//     required this.Name,
//     required this.Email,
//     required this.Phone_no,
//     required this.Property_Details,
//     required this.Rental_Period, required String imageUrl,
//   });
// }
//
//
//
//
// //
// // // Widget _buildLandlordTable2() => SingleChildScrollView(
// // //   scrollDirection: Axis.horizontal,
// // //   child: DataTable(
// // //     headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300),
// // //     columnSpacing: 20,
// // //     horizontalMargin:2.0,
// // //     // Adjust spacing
// // //     dataRowMinHeight: 60,
// // //     // Minimum row height
// // //     dataRowMaxHeight: 100,
// // //     // Maximum row height
// // //     decoration: BoxDecoration(color: Colors.white),
// // //     columns: [
// // //       _buildColumn('S/NO'),
// // //       _buildColumn('Name'),
// // //       _buildColumn('Email'),
// // //       _buildColumn('Phone number'),
// // //       _buildColumn('Address'),
// // //       _buildColumn('Gender'),
// // //       _buildColumn('ID proof'),
// // //       _buildColumn('Action'),
// // //     ],
// // import 'package:flutter/material.dart';
// //
// // import 'Tabs/Acceptedlandloards.dart';
// // import 'Tabs/Pending_landloard.dart';
// // import 'Tabs/RejectedLandloards.dart';
// //
// // class Landlord extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 3,
// //       child: Scaffold(
// //         backgroundColor: Colors.white,
// //         body: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             /// **Header Section**
// //             Padding(
// //               padding: const EdgeInsets.all(20.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Row(
// //                     children: [
// //                       Text("Welcome ",
// //                           style: TextStyle(
// //                               fontSize: 24, fontWeight: FontWeight.bold)),
// //                       Text("Landlord,",
// //                           style: TextStyle(
// //                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff0A71CB))),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                           backgroundColor: Color(0xffD9D9D9),
//                           child: Icon(Icons.notification_add)),
//                       SizedBox(width: 10),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 14, vertical: 6),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(width: 0.5, color: Colors.grey),
//                         ),
//                         child: Row(
//                           children: [
//                             const CircleAvatar(
//                               radius: 20,
//                               backgroundColor: Colors.grey,
//                               backgroundImage:
//                               AssetImage('assets/Profile/img.png'),
//                             ),
//                             const SizedBox(width: 10),
//                             const Text(
//                               "Landlord",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             /// **Tab Bar**
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TabBar(
//                 labelColor: Colors.black,
//                 indicatorColor: Colors.blue,
//                 tabs: [
//                   Tab(
//                       child: Text("New Bookings",
//                           style: TextStyle(fontWeight: FontWeight.bold))),
//                   Tab(
//                       child: Text("Accepted Bookings",
//                           style: TextStyle(fontWeight: FontWeight.bold))),
//                   Tab(
//                       child: Text("Rejected Bookings",
//                           style: TextStyle(fontWeight: FontWeight.bold))),
//                 ],
//               ),
//             ),
//
//             /// **Tab Content**
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   Pending_Bookings_wrapper(), // New Landlords
//                   Accept_Bookings_wrapper(), // New Landlords
//                   Reject_Bookings_wrapper(), // New Landlords
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// /// **Table UI**
// }
//
// // Helper function for styling the column headers
