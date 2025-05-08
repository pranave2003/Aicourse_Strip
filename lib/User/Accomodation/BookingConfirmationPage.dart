import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_connect/Admin/Model/Universitymodel/Bookingsmodel.dart';
import 'package:course_connect/Controller/Bloc/Booking/BookingAuthEvent.dart';
import 'package:course_connect/Controller/Bloc/Booking/BookingState.dart';
import 'package:course_connect/Controller/Bloc/Booking/Booking_authblock.dart';
import 'package:course_connect/Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'package:course_connect/User/Accomodation/sucess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controller/Bloc/Booking/Booking_model/BookingModel.dart';
import '../../Controller/Bloc/Property/Property/Property_auth_block.dart';
import '../../Controller/Bloc/Property/Property/Property_auth_state.dart';
import '../../Controller/Bloc/Strip/BlocLayer/payment_bloc.dart';
import '../../Controller/Bloc/Strip/BlocLayer/payment_event.dart';
import '../../Controller/Bloc/Strip/BlocLayer/payment_state.dart';
import '../../Widget/Constands/Loading.dart';
import 'DonePayment.dart';

String _formattedCurrentDate() {
  final now = DateTime.now();
  return "${_monthName(now.month)} ${now.day}, ${now.year}";
}

String _monthName(int month) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  return months[month - 1];
}

// Wrapper Widget with BlocProvider
class BookingConfirmformpageScreenWrapper extends StatelessWidget {
  // const  BookingConfirmformpage({super.key, required this.booking});
  // final Bookingmodel booking;
  const BookingConfirmformpageScreenWrapper({
    super.key,
    required this.propertyName,
    required this.tokenAmount,
    required this.country,
    required this.city,
    required this.propertyImageURL,
    required this.propertyId,
    required this.state,
    required this.propertyTotal,
    required this.checkindate,
    required this.checkoutdate,
    required this.Landloard_id,
    required this.landloardname,
    required this.landloardphone,
    required this.username,
    required this.userphonenumber,
    required this.useremail,
    required this.userid_global,
    required this.propertyAddress,
    required this.owneremail,
  });

  final String userid_global;
  final String propertyName;
  final String tokenAmount;
  final String propertyImageURL;
  final String country;
  final String city;
  final String state;

  final String propertyId;
  final String propertyTotal;
  final String checkindate;
  final String checkoutdate;
  final String Landloard_id;
  final String landloardname;
  final String landloardphone;
  final String username;
  final String userphonenumber;
  final String useremail;
  final String propertyAddress;
  final String owneremail;

  @override
  Widget build(BuildContext context) {
    final booking = Bookingmodel(
      propertyId: propertyId,
      propertyName: propertyName,
      tokenamount: tokenAmount,
      checkindate: checkindate,
      userid: userid_global,
      landlordId: Landloard_id,
      landlordname: landloardname,
      landlordphone: landloardphone,
      useremail: useremail,
      propertyImageURL: propertyImageURL,
      propertyTotal: propertyTotal,
      username: username,
      userphonenumber: userphonenumber,
      bookingdate: DateTime.now().toString(),
      bookingtime: DateTime.now().toString(),
      propertystate: this.state, // ✅ This is the actual property state string

      propertycountry: country,
      propertycity: city,
      propertyaddress: propertyAddress,
      // owneremail: owneremail,
      checkoutdate: checkoutdate, // ✅ fixed from checkindate
      status: "0",
      ban: "0",
    );
    return BlocProvider<PropertyAuthBlock>(
      create: (context) => PropertyAuthBlock()
        ..add(FetchPropertyDetailsById(Property_id: propertyId)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
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
                                  imageUrl: propertyImageURL.toString(),
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
                          propertyName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.blue, size: 14),
                            SizedBox(width: 4),
                            Text(
                              "${city},${state}\n${country}",
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              tokenAmount ?? '',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                  Expanded(
                      child: _buildDateTile(
                          "Booking From", _formattedCurrentDate())),
                  SizedBox(width: 12),
                  Expanded(
                    child: _buildDateTile("Booking To", checkoutdate),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Fee Details
            Text("Fee & Tax Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildFeeDetailRow("Total Amount", "${propertyTotal}"),
            _buildFeeDetailRow("Token Amount", "${tokenAmount}"),
            // Divider(),
            // _buildFeeDetailRow("Total", "2815", isBold: true),

            Spacer(),

            // Pay Button

            BlocConsumer<PaymentBloc, PaymentState>(
              listener: (context, state) async {
                if (state is PaymentSuccess) {
                  context.read<BookingAuthblock>().add(
                        Booking_Add_event(Booking: booking),
                      );

                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Donepayment()),
                  );
                } else if (state is PaymentFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Booking failed: ${state.error}')),
                  );
                }
              },
              builder: (context, state) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<PaymentBloc>().add(
                            MakePaymentEvent(amount: "5000", currency: "USD"),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff0A71CB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: state is PaymentProcessing
                        ? Loading_Widget()
                        : Text(
                            "Pay Token Amount",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                  ),
                );
              },
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

  Widget _buildFeeDetailRow(String label, String amount,
      {bool isBold = false}) {
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
