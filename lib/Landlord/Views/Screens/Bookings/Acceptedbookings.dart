// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:course_connect/Controller/Bloc/Booking/BookingAuthEvent.dart';
// import 'package:course_connect/Controller/Bloc/Booking/BookingState.dart';
// import 'package:course_connect/Controller/Bloc/Booking/Booking_authblock.dart';
// import 'package:course_connect/Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
// import 'package:course_connect/Widget/Constands/Loading.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class Pending_Bookings_wrapper extends StatelessWidget {
//   const Pending_Bookings_wrapper({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<BookingAuthblock>(
//       create: (context) => BookingAuthblock()
//         ..add(
//           FetchBookings(searchQuery: null, status: "1"),
//         ),
//       child: Accept_Bookings(),
//     );
//   }
// }
//
// class Accept_Bookings extends StatefulWidget {
//   const Accept_Bookings({super.key});
//
//   @override
//   State<Accept_Bookings> createState() => _Accept_BookingsState();
// }
//
// class _Accept_BookingsState extends State<Accept_Bookings> {
//   @override
//   Widget build(BuildContext context) {
//     return _buildLandlordTable();
//   }
//
//   Widget _buildLandlordTable() =>
//       BlocConsumer<BookingAuthblock, BookingState>(
//         listener: (context, state) {
//           if (state is Acceptorrejectstate) {
//             context
//                 .read<BookingAuthblock>()
//                 .add(FetchBookings(searchQuery: null, status: "1"));
//           }
//         },
//         builder: (context, state) {
//           if (state is LandloardessLoading) {
//             return Center(child: Loading_Widget());
//           } else if (state is Landloardfailfailerror) {
//             return Text("${state.error.toString()}");
//           }
//           if (state is Landloaredloaded) {
//             if (state.landloareds.isEmpty) {
//               // Return "No data found" if txhe list is empty
//               return Center(
//                 child: Text(
//                   "No data found",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               );
//             }
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 headingRowColor: MaterialStateColor.resolveWith(
//                         (states) => Colors.grey.shade300),
//                 columnSpacing: 45,
//                 dataRowMaxHeight: 100,
//                 decoration: BoxDecoration(color: Colors.white),
//                 columns: [
//                   _buildColumn('S/NO'),
//                   _buildColumn('Name'),
//                   _buildColumn('Email'),
//                   _buildColumn('Phone number'),
//                   _buildColumn('Address'),
//                   _buildColumn('Gender'),
//                   _buildColumn('ID proof'),
//                   _buildColumn('Action'),
//                 ],
//                 rows: List.generate(
//                   state.landloareds.length,
//                       (index) {
//                     final landlord = state.landloareds[index];
//                     return DataRow(
//                       cells: [
//                         DataCell(Text("${index + 1}",
//                             style: TextStyle(fontWeight: FontWeight.bold))),
//                         DataCell(Text(landlord.name.toString())),
//                         DataCell(Text(landlord.email.toString())),
//                         DataCell(Text(landlord.phone.toString())),
//                         DataCell(SizedBox(
//                           width: 200,
//                           child:
//                           Text(landlord.Adress.toString(), softWrap: true),
//                         )),
//                         DataCell(Text(landlord.gender.toString())),
//                         DataCell(
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 10.0),
//                             child: Container(
//                               height: 80,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(
//                                     5), // Rounded corners for image
//                                 child: CachedNetworkImage(
//                                   imageUrl:landlord.idproofimage
//                                       .toString(),
//                                   width: 100, // Adjusted width
//                                   height: 50, // Adjusted height
//                                   fit: BoxFit.cover,
//                                   placeholder: (context, url) =>
//                                       Container(
//                                         width: 50,
//                                         height: 50,
//                                         color: Colors.grey[
//                                         300], // Placeholder background
//                                         child: Center(
//                                           child:
//                                           Loading_Widget(), // Loading indicator
//                                         ),
//                                       ),
//                                   errorWidget: (context, url, error) =>
//                                       Container(
//                                         width: 50,
//                                         height: 50,
//                                         color: Colors.grey[
//                                         300], // Placeholder background
//                                         child: Icon(
//                                           Icons.image_not_supported,
//                                           size: 50,
//                                           color: Colors.grey[600],
//                                         ),
//                                       ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),                           DataCell(Row(
//                           children: [
//                             OutlinedButton(
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.red, width: 2),
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 12, horizontal: 20),
//                               ),
//                               onPressed: () {
//                                 context.read<LandloardAuthBloc>().add(
//                                     AcceptOrRejectLandloard(
//                                         Landloaredid: landlord.uid,
//                                         Status: "2"));
//                               },
//                               child: Text(
//                                 "Reject",
//                                 style: TextStyle(
//                                     color: Colors.red,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         )),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             );
//           }
//           return SizedBox();
//         },
//       );
//
//   DataColumn _buildColumn(String label) {
//     return DataColumn(
//       label: Text(
//         label,
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }