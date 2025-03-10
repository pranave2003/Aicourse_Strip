// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // //
// // // class BookingConfirmationPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         leading: IconButton(
// // //           icon: Icon(Icons.arrow_back),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: [
// // //             Icon(Icons.check_circle, color: Colors.green, size: 60),
// // //             SizedBox(height: 8),
// // //             Text("Booking Confirmed", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// // //             SizedBox(height: 16),
// // //             _buildPropertyCard(),
// // //             SizedBox(height: 16),
// // //             _buildBookingDetails(),
// // //             SizedBox(height: 20),
// // //               InkWell(
// // //                 onTap: () {
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(builder: (context) => BookingConfirmationPage()),
// // //                   );
// // //                 },
// // //                 child: Center(
// // //                   child: Container(
// // //                     height: 51,
// // //                     width: 231,
// // //                     decoration: BoxDecoration(
// // //                       color: Color(0xff0A71CB),
// // //                       borderRadius: BorderRadius.circular(30),
// // //                     ),
// // //                     child: Center(
// // //                       child: Text(
// // //                         "Book Now",
// // //                         style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildPropertyCard() {
// // //     return Row(
// // //       children: [
// // //         ClipRRect(
// // //           borderRadius: BorderRadius.circular(8),
// // //           child: Image.network(
// // //             "https://via.placeholder.com/80",
// // //             width: 80,
// // //             height: 80,
// // //             fit: BoxFit.cover,
// // //           ),
// // //         ),
// // //         SizedBox(width: 12),
// // //         Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text("Portchester House", style: TextStyle(fontWeight: FontWeight.bold)),
// // //             Text("£280/week"),
// // //           ],
// // //         ),
// // //       ],
// // //     );
// // //   }
// // //
// // //   Widget _buildBookingDetails() {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         _buildDetailRow("Booking From", "April 20, 2025"),
// // //         _buildDetailRow("Booking To", "April 30, 2025"),
// // //         Divider(),
// // //         _buildDetailRow("Property Price", "£2800"),
// // //         _buildDetailRow("Token Amount", "£10"),
// // //         _buildDetailRow("Tax", "£5"),
// // //         Divider(),
// // //         _buildDetailRow("Total", "£2815", isBold: true),
// // //       ],
// // //     );
// // //   }
// // //
// // //   Widget _buildDetailRow(String title, String value, {bool isBold = false}) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 4.0),
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //         children: [
// // //           Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
// // //           Text(value, style: TextStyle(fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// //
// // class BookingConfirmationPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 20),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Center(
// //               child: Column(
// //                 children: [
// //                   Container(
// //                     padding: EdgeInsets.all(12),
// //                     decoration: BoxDecoration(
// //                       color: Colors.green.shade100,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Icon(Icons.check, color: Colors.green, size: 50),
// //                   ),
// //                   SizedBox(height: 10),
// //                   Text(
// //                     "Booking Confirmed",
// //                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //
// //             // Property Details
// //             Container(
// //               padding: EdgeInsets.all(12),
// //               decoration: BoxDecoration(
// //                 color: Colors.grey.shade100,
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               child: Row(
// //                 children: [
// //                   ClipRRect(
// //                     borderRadius: BorderRadius.circular(8),
// //                     child: Image.network(
// //                       "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=600",
// //
// //                       width: 80,
// //                       height: 80,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                   SizedBox(width: 12),
// //                   Expanded(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           "Portchester House",
// //                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                         ),
// //                         Row(
// //                           children: [
// //                             Icon(Icons.location_on, color: Colors.blue, size: 14),
// //                             SizedBox(width: 4),
// //                             Text(
// //                               "9 no road, United Kingdom",
// //                               style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
// //                             ),
// //                           ],
// //                         ),
// //                         SizedBox(height: 4),
// //                         Text(
// //                           "£280 / Per week",
// //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //
// //             // Booking Dates
// //             // Row(
// //             //   children: [
// //             //     Expanded(child: _buildDateTile("Booking From", "April 20, 2025")),
// //             //     SizedBox(width: 10),
// //             //     Expanded(child: _buildDateTile("Booking To", "April 30, 2025")),
// //             //   ],
// //             // ),
// //
// //     Row(
// //     children: [
// //     Expanded(child: _buildDateTile("Booking From", "April 20, 2025")),
// //     SizedBox(width: 12), // Adjust spacing for better alignment
// //     Expanded(child: _buildDateTile("Booking To", "April 30, 2025")),
// //     ],
// //     ),
// //
// //     SizedBox(height: 20),
// //
// //             // Fee & Tax Details
// //             Text("Fee & Tax Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //             SizedBox(height: 10),
// //             _buildFeeDetailRow("Property price", "£2800"),
// //             _buildFeeDetailRow("Token Amount", "£10"),
// //             _buildFeeDetailRow("Tax", "£5"),
// //             Divider(),
// //             _buildFeeDetailRow("Total", "£2815", isBold: true),
// //
// //             Spacer(),
// //
// //             // Pay Button
// //             Center(
// //               child: ElevatedButton(
// //                 onPressed: () {},
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Color(0xff0A71CB),
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
// //                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
// //                 ),
// //                 child: Text("Pay Token Amount", style: TextStyle(fontSize: 18, color: Colors.white)),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Booking Date Tile
// //   Widget _buildDateTile(String label, String date) {
// //     return Container(
// //       padding: EdgeInsets.all(12),
// //       decoration: BoxDecoration(
// //         color: Colors.grey.shade100,
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(label, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
// //           SizedBox(height: 4),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(date, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
// //               Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Fee & Tax Detail Row
// //   Widget _buildFeeDetailRow(String label, String amount, {bool isBold = false}) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(label, style: TextStyle(fontSize: isBold ? 16 : 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
// //           Text(amount, style: TextStyle(fontSize: isBold ? 16 : 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
//
// class BookingConfirmationPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.green.shade100,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(Icons.check, color: Colors.green, size: 50),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Booking Confirmed",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Property Details (Added at line 203)
//             Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.network(
//                       "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=600",
//                       width: 80,
//                       height: 80,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Portchester House",
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                         Row(
//                           children: [
//                             Icon(Icons.location_on, color: Colors.blue, size: 14),
//                             SizedBox(width: 4),
//                             Text(
//                               "9 no road, United Kingdom",
//                               style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           "£280 / Per week",
//                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Booking Dates
//             Row(
//               children: [
//                 Expanded(child: _buildDateTile("Booking From", "April 20, 2025")),
//                 SizedBox(width: 12),
//                 Expanded(child: _buildDateTile("Booking To", "April 30, 2025")),
//               ],
//             ),
//
//             SizedBox(height: 20),
//
//             // Fee & Tax Details
//             Text("Fee & Tax Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             _buildFeeDetailRow("Property price", "£2800"),
//             _buildFeeDetailRow("Token Amount", "£10"),
//             _buildFeeDetailRow("Tax", "£5"),
//             Divider(),
//             _buildFeeDetailRow("Total", "£2815", isBold: true),
//
//             Spacer(),
//
//             // Pay Token Amount Button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xff0A71CB),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                 ),
//                 child: Text("Pay Token Amount", style: TextStyle(fontSize: 18, color: Colors.white)),
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Booking Date Tile
//   Widget _buildDateTile(String label, String date) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
//           SizedBox(height: 4),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(date, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//               Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Fee & Tax Detail Row
//   Widget _buildFeeDetailRow(String label, String amount, {bool isBold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: isBold ? 16 : 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//           Text(amount, style: TextStyle(fontSize: isBold ? 16 : 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
//         ],
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';

class BookingConfirmationPage extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: Colors.green, size: 50),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Booking Confirmed",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
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
                    child: Image.network(
                      "https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=600",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Portchester House",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.blue, size: 14),
                            SizedBox(width: 4),
                            Text(
                              "9 no road, United Kingdom",
                              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "£280 / Per week",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Booking Date Section
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFEEF7FF), // Light Pink Background
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

            // Fee & Tax Details
            Text("Fee & Tax Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildFeeDetailRow("Property price", "£2800"),
            _buildFeeDetailRow("Token Amount", "£10"),
            _buildFeeDetailRow("Tax", "£5"),
            Divider(),
            _buildFeeDetailRow("Total", "£2815", isBold: true),

            Spacer(),

            // Pay Button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0A71CB),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                child: Text("Pay Token Amount", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
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
            color: Color(0xFF7D4C4C), // Darker Shade for Title
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
          Text(label, style: TextStyle(fontSize: isBold ? 16 : 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(amount, style: TextStyle(fontSize: isBold ? 16 : 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

