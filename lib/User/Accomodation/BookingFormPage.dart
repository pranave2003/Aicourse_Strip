import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_state.dart';
import 'package:course_connect/Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Controller/Bloc/Property/Property/Property_auth_block.dart';
import '../../Widget/Constands/Loading.dart';
import 'BookingConfirmationPage.dart';

class BookingformpageScreenWrapper extends StatelessWidget {
  const BookingformpageScreenWrapper({
    super.key,
    required this.propertyId,
    required this.propertyName,
    required this.userid_global,
    required this.tokenAmount,
    required this. propertyImageURL,
  });

  final propertyId;
  final userid_global;
  final propertyName;
  final tokenAmount;
  final propertyImageURL;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PropertyAuthBlock>(
      create: (context) => PropertyAuthBlock()
        ..add(FetchPropertyDetailsById(Property_id: propertyId)),
      child: BookingFormPage(propertyName: propertyName,tokenAmount: tokenAmount,propertyImageURL:propertyImageURL),
    );
  }


}


class BookingFormPage extends StatefulWidget {
  final String? propertyName;
  final String? tokenAmount;
  final String? propertyImageURL;

  const BookingFormPage({super.key,this.propertyName,this.tokenAmount, required this. propertyImageURL});

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  void initState() {
    // TODO: implement initState

    context.read<AuthBloc>()..add(FetchUserDetailsById());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(

        listener: (context, state) {},
        builder: (context, state) {
          if (state is PropertyLoading) {
            return Loading_Widget();
          }
          else if (state is UserByidLoaded) {
            final user = state.Userdata;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Thanks",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                      Text(' ${user.name ?? ''}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),


                  Text(
                      "Fasten the booking by filling out the details to reserve this property."),
                  SizedBox(height: 16),
                  _buildPropertyCard(),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNameDisplay(user.name.toString()),
                      _buildEmailDisplay(user.email.toString()),
                      _buildPhoneDisplay(user.phone.toString()),
                      _buildDatePickerField(context),
                    ],
                  ),

                  // Container(
                  //   padding: EdgeInsets.all(16),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.grey),
                  //     borderRadius: BorderRadius.circular(8),
                  //     color: Colors.grey[100],
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //   Text(' ${user.name ?? ''}',
                  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  //       SizedBox(height: 8),
                  //       Text(' ${user.email ?? ''}',
                  //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  //     ],
                  //   ),
                  // ),

                  // _buildInputField("Your Full Name"),
                  // _buildInputField("Your Email Address"),
                  // _buildDatePickerField(context),
                  // _buildPhoneField(),
                  SizedBox(height: 200),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingConfirmationPage()),
                      );
                    },
                    child: Center(
                      child: Container(
                        height: 51,
                        width: 231,
                        decoration: BoxDecoration(
                          color: Color(0xff0A71CB),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Book Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget _buildPropertyCard() {
    return Row(
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
                autoPlay: false, // Optional: disable auto play if only one image
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
                      child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey[600]),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.propertyName ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

Row(
  children: [

    Text(
      widget.tokenAmount ?? '',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text("/Week"),
  ],
)
                    ],
        ),
      ],
    );
  }
  Widget _buildNameDisplay(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          name.isNotEmpty ? name : 'Your Email Address',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildEmailDisplay(String email) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          email.isNotEmpty ? email : 'Your Email Address',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildPhoneDisplay(String phone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          phone.isNotEmpty ? phone : 'Your Phone Number',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildDatePickerField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Check-out Date",
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.calendar_today),
        ),
        readOnly: true,
        onTap: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030),
          );
        },
      ),
    );
  }

  Widget _buildPhoneField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Mobile Number",
          border: OutlineInputBorder(),
          prefixText: "+91 ",
        ),
        keyboardType: TextInputType.phone,
      ),
    );
  }
}

