
import 'package:flutter/material.dart';

class PropertyEdit extends StatefulWidget {
  @override
  _PropertyEditState createState() => _PropertyEditState();
}
bool parking = false;
bool billsIncluded = false;
bool petsAllowed = false;
bool smokingAllowed = false;
 class _PropertyEditState extends State<PropertyEdit> {
  final TextEditingController _propertyNameController = TextEditingController(text: "My Property");
  final TextEditingController _addressController = TextEditingController(text: "123 Main Street");
  final TextEditingController _areaController = TextEditingController(text: "1200 sqft");
  final TextEditingController _amountWeekController = TextEditingController(text: "500");
  final TextEditingController _amountMonthController = TextEditingController(text: "2000");
  final TextEditingController _ownerNameController = TextEditingController(text: "John Doe");
  final TextEditingController _phoneController = TextEditingController(text: "123-456-7890");


   String? _selectedCountry = "USA";
  String? _selectedState = "California";
  String? _selectedCity = "Los Angeles";
  String? _selectedRoomType = "Apartment";
  String? _selectedRoomSize = "Medium";
  String? _selectedFurnishing = "Fully Furnished";
  String? _selectedBedroom = "2";
  String? _selectedBathroom = "1";
  String? _selectedKitchen = "1";
  String? _selectedTokenAmount = "\$1000";
  String? _selectedMinStay = "3 months";
  String? _selectedMaxStay = "1 year";
  String? _selectedSexualOrientation = "Any";
  String? _selectedParking = "No";
  String? _selectedBillsIncluded = "No";
  String? _selectedPetsAllowed = "No";
  String? _selectedSmokingAllowed = "No";

  final List<String> countries = ['USA', 'UK', 'India', 'Canada'];
  final List<String> states = ['New York', 'California', 'Texas'];
  final List<String> cities = ['Los Angeles', 'San Francisco', 'Houston'];
  final List<String> roomTypes = ['House', 'Apartment'];
  final List<String> roomSizes = ['Small', 'Medium', 'Large'];
  final List<String> furnishingOptions = ['Fully Furnished', 'Semi Furnished', 'Unfurnished'];
  final List<String> tokenAmounts = ['\$500', '\$1000', '\$1500'];
  final List<String> stayDurations = ['1 month', '3 months', '6 months', '1 year'];
  final List<String> sexualOrientations = ['Any', 'LGBTQ+ Friendly', 'Male Only', 'Female Only'];
  final List<String> Bedroom = ['1', '2', '3', '4','5','6 and above'];
  final List<String> Bathroom = ['1', '2', '3', '4','5','6 and above'];
  final List<String> Kitchen = ['1', '2', '3', '4','5','6 and above'];



  DateTime? availableFrom;
  DateTime? moveInDate;

  Future<void> _selectDate(BuildContext context, Function(DateTime) onDateSelected) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row (Welcome Text + Notification Icon)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Welcome Text
                Row(
                  children: [
                    Text(
                      "Welcome ",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Landlord,",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff0A71CB)),
                    ),
                  ],
                ),
                // Notification & Profile Section
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      child: Icon(Icons.notifications, color: Colors.black),
                    ),
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
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            backgroundImage: AssetImage('assets/Profile/img_3.png'),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Landlord",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Property Editing Page",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      // Add action here
                    },
                    borderRadius: BorderRadius.circular(8), // Smooth border effect on tap
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 36),
                      decoration: BoxDecoration(
                        color: Colors.blue, // Blue background
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      child: Text(
                        "+Save",
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height:5),

            Divider(thickness:2,color:Colors.black,),

            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Property Details
                    _buildSectionTitle("Property Details"),
                    SizedBox(height: 5),

                    Row(
                      children: [
                        Expanded(child: _buildTextField("Property Name", _propertyNameController)),
                        SizedBox(width: 10),
                        Expanded(child: _buildTextField("Address", _addressController)),
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildTextField("Area", _areaController),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: _buildDropdown("Country", countries, _selectedCountry, (value) => setState(() => _selectedCountry = value))),
                        SizedBox(width: 10),
                        Expanded(child: _buildDropdown("State", states, _selectedState, (value) => setState(() => _selectedState = value))),
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildDropdown("City", cities, _selectedCity, (value) => setState(() => _selectedCity = value)),

                    Divider(thickness: 2),
                    SizedBox(height: 10),

                    // Room Details
                    _buildSectionTitle("Room Details"),
                    SizedBox(height: 5),

                    Row(
                      children: [
                        Expanded(child: _buildDropdown("Room Type", roomTypes, _selectedRoomType, (value) => setState(() => _selectedRoomType = value))),
                        SizedBox(width: 10),
                        Expanded(child: _buildDropdown("Room Size", roomSizes, _selectedRoomSize, (value) => setState(() => _selectedRoomSize = value))),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: _buildDatePicker("Available From", availableFrom, (date) => setState(() => availableFrom = date))),
                        SizedBox(width: 10),
                        Expanded(child: _buildDatePicker("Move-in Date", moveInDate, (date) => setState(() => moveInDate = date))),
                      ],
                    ),

                    Divider(thickness: 2),
                    SizedBox(height: 10),
                    Text(" Images:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                    SizedBox(height: 20),
                    _buildImageContainer(),
                    SizedBox(height: 10),

                    _buildTextField("Description", _areaController),

                    Divider(thickness: 2,),
                    // Pricing Details
                    _buildSectionTitle(" Pricing Details"),
                    SizedBox(height: 5),

                    Row(
                      children: [
                        Expanded(child: _buildTextField("Amount /Week", _amountWeekController)),
                        SizedBox(width: 10),
                        Expanded(child: _buildTextField("Amount /Month", _amountMonthController)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: _buildDropdown("Token Amount", tokenAmounts, _selectedTokenAmount, (value) => setState(() => _selectedTokenAmount = value))),
                        SizedBox(width: 10),
                        Expanded(child: _buildDropdown("Sexual Orientation", sexualOrientations, _selectedSexualOrientation, (value) => setState(() => _selectedSexualOrientation = value))),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: _buildDropdown("Minimum Stay", stayDurations, _selectedMinStay, (value) => setState(() => _selectedMinStay = value))),
                        SizedBox(width: 10),
                        Expanded(child: _buildDropdown("Maximum Stay", stayDurations, _selectedMaxStay, (value) => setState(() => _selectedMaxStay = value))),
                      ],
                    ),

                    Divider(thickness: 2),
                    SizedBox(height: 10),

                    // Features (Radio Buttons)
                    _buildSectionTitle(" Features"),
                    SizedBox(height: 5),

// First Row (Furnishing & Bedroom)
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdown("Furnishing", furnishingOptions, _selectedFurnishing,
                                  (value) => setState(() => _selectedFurnishing = value)),
                        ),
                        SizedBox(width: 10), // Adds spacing
                        Expanded(
                          child: _buildDropdown("Bedroom", Bedroom, _selectedBedroom,
                                  (value) => setState(() => _selectedBedroom = value)),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

// Second Row (Bathroom & Kitchen)
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdown("Bathroom", Bathroom, _selectedBathroom,
                                  (value) => setState(() => _selectedBathroom = value)),
                        ),
                        SizedBox(width: 10), // Adds spacing
                        Expanded(
                          child: _buildDropdown("Kitchen", Kitchen, _selectedKitchen,
                                  (value) => setState(() => _selectedKitchen = value)),
                        ),
                      ],
                    ),


                    SizedBox(height: 10),


                    Text(
                      "Additional Preferences",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 10),

// First Row (Parking & Bills Included)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildCheckbox("Parking Available", parking,
                                  (value) => setState(() => parking = value!)),
                        ),
                        SizedBox(width: 10), // Adds spacing
                        Expanded(
                          child: _buildCheckbox("Bills Included", billsIncluded,
                                  (value) => setState(() => billsIncluded = value!)),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

// Second Row (Pets Allowed & Smoking Allowed)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildCheckbox("Pets Allowed", petsAllowed,
                                  (value) => setState(() => petsAllowed = value!)),
                        ),
                        SizedBox(width: 10), // Adds spacing
                        Expanded(
                          child: _buildCheckbox("Smoking Allowed", smokingAllowed,
                                  (value) => setState(() => smokingAllowed = value!)),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),


                    Divider(thickness: 2),
                    SizedBox(height: 10),

                    // Owner Details
                    _buildSectionTitle("👤 Owner Details"),
                    SizedBox(height: 5),

                    Row(
                      children: [
                        Expanded(child: _buildTextField("Owner Name", _ownerNameController)),
                        SizedBox(width: 10),
                        Expanded(child: _buildTextField("Phone Number", _phoneController)),
                      ],
                    ),

                    SizedBox(height: 10),

                    Text(" Upload Ownership Proof:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: () {}, child: Text("Upload Document")),

                    SizedBox(height: 10),



                    SizedBox(height: 20),

                    // Submit Button


                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        value: selectedValue,
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
      ),
    );
  }
  Widget _buildImageContainer() {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage("assets/Property/img.png"), // Replace with actual images
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, size: 24, color: Colors.black),
                Text("Edit images", textAlign: TextAlign.center, style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(label),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildDatePicker(String label, DateTime? date, Function(DateTime) onDateSelected) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: date == null ? label : "$label: \${date.toLocal()}".split(' ')[0],
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context, onDateSelected),
          ),
        ),
      ),
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}






















