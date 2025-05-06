
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
    required this.tokenAmount,
    required this.country,
    required this.state,
    required this.city,
    required this.propertyImageURL,
    required this.propertyTotal,
    required this.Landloard_id,
    required this.landloardname,
    required this.landloardphone,  required this. propertyAddress, required this. owneremail, required this. userid,
  });

  final propertyId;
  final propertyName;
  final tokenAmount;
  final propertyImageURL;
  final propertyTotal;
  final country;
  final state;
  final city;
  final Landloard_id;
  final landloardname;
  final landloardphone;
  final propertyAddress;
  final owneremail;
  final userid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PropertyAuthBlock>(
      create: (context) => PropertyAuthBlock()
        ..add(FetchPropertyDetailsById(Property_id: propertyId)),
      child: BookingFormPage(
        propertyName: propertyName,
        tokenAmount: tokenAmount,
        propertyImageURL: propertyImageURL,
        country: country,
        state: state,
        city: city,
        propertyId: propertyId,
        propertyTotal: propertyTotal,
        Landloard_id: Landloard_id,
        landloardname: landloardname,
        landloardphone: landloardphone,
        propertyAddress: propertyAddress,
        owneremail:owneremail,
        userid:userid,
      ),
    );
  }
}

class BookingFormPage extends StatefulWidget {
  final String? propertyName;
  final String? tokenAmount;
  final String? propertyImageURL;
  final String? country;
  final String? state;
  final String? city;
  final String? propertyId;
  final String? propertyTotal;
  final String? propertyAddress;
  final String? Landloard_id;
  final String? landloardname;
  final String? owneremail;
  final String? landloardphone;
  final String? userid;

  const BookingFormPage({
    super.key,
    this.propertyName,
    this.tokenAmount,
    required this.propertyImageURL,
    required this.country,
    required this.state,
    required this.city,
    required this.propertyAddress,
    required this.propertyId,
    required this.propertyTotal,
    required this.Landloard_id,
    required this.landloardname,
    required this.landloardphone,
    required this.owneremail,
    required this.userid,
  });

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  TextEditingController checkin = TextEditingController();
  TextEditingController checkout = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>()..add(FetchUserDetailsById());
  }

  DateTime _parseDate(String dateStr) {
    List<String> parts = dateStr.split('/');
    return DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );
  }

  void validateAndProceed(user) {
    if (checkin.text.isEmpty || checkout.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select both check-in and check-out dates.")),
      );
      return;
    }

    DateTime checkinDate = _parseDate(checkin.text);
    DateTime checkoutDate = _parseDate(checkout.text);

    if (!checkoutDate.isAfter(checkinDate)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Check-out date must be after check-in date.")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmformpageScreenWrapper(
          propertyName: widget.propertyName.toString(),
          tokenAmount: widget.tokenAmount.toString(),
          propertyImageURL: widget.propertyImageURL.toString(),
          state: widget.state.toString(),
          country: widget.country.toString(),
          city: widget.city.toString(),
          propertyId: widget.propertyId.toString(),
          checkindate: checkin.text,
          checkoutdate: checkout.text,
          propertyTotal: widget.propertyTotal.toString(),
          Landloard_id: widget.Landloard_id.toString(),
          landloardname: widget.landloardname.toString(),
          landloardphone: widget.landloardphone.toString(),
          username: user.name.toString(),
          userphonenumber: user.phone_number.toString(),
          useremail: user.email.toString(),
          propertyAddress: widget.propertyAddress.toString(),
          owneremail: widget.owneremail.toString(),
          userid_global: userid_global,

        ),
      ),
    );
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
          } else if (state is UserByidLoaded) {
            final user = state.Userdata;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Thanks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(' ${user.name ?? ''}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text("Fasten the booking by filling out the details to reserve this property."),
                  SizedBox(height: 16),
                  _buildPropertyCard(),
                  SizedBox(height: 10),
                  _buildNameDisplay(user.name.toString()),
                  _buildEmailDisplay(user.email.toString()),
                  _buildPhoneDisplay(user.phone_number.toString()),

                  _buildDatePickerField(
                    controller: checkin,
                    label: "Check-in Date",
                  ),
                  _buildDatePickerField(
                    controller: checkout,
                    label: "Check-out Date",
                  ),

                  SizedBox(height: 80),
                  InkWell(
                    onTap: () => validateAndProceed(user),
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
            width: 160,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: false,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
              ),
              items: [
                CachedNetworkImage(
                  imageUrl: widget.propertyImageURL.toString(),
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Center(child: Loading_Widget()),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.image_not_supported,
                        size: 50, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.propertyName ?? '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text(widget.tokenAmount ?? '',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text("/Week"),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildNameDisplay(String name) => _buildDisplayField(name, 'Your Name');
  Widget _buildEmailDisplay(String email) => _buildDisplayField(email, 'Your Email Address');
  Widget _buildPhoneDisplay(String phone) => _buildDisplayField(phone, 'Your Phone Number');

  Widget _buildDisplayField(String value, String fallback) {
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
          value.isNotEmpty ? value : fallback,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildDatePickerField({required TextEditingController controller, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.calendar_today),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030),
          );
          if (pickedDate != null) {
            controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          }
        },
      ),
    );
  }
}
