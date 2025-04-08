
import 'package:course_connect/Landlord/Controller2/Property/Property_Auth/Property_Model/PropertyModel.dart';
import 'package:course_connect/Landlord/Controller2/Property/Property_auth_block.dart';
import 'package:course_connect/Landlord/Lanlordmain.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller2/Property/Property_auth_state.dart';

class PropertyEdit extends StatefulWidget {
  const PropertyEdit({
    super.key,
    required this.propertyName,
    required this.propertyAddress,
    required this.propertyArea,
    required this.country,
    required this.state,
    required this.city,
    required this.roomTypes,
    required this.roomSizes,
    required this.availableFrom,
    required this.moveInDate,
    required this.propertyImageURL,
    required this.aboutProperty,
    required this.bedroom,
    required this.bathroom,
    required this.kitchen,
    required this.propertyAmountWeek,
    required this.propertyAmountMonth,
    required this.tokenAmount,
    required this.minimumStay,
    required this.maximumStay,
    required this.ownerName,
    required this.ownerPhone,
    required this.ownershipProof,
    required this.parking,
    required this.billStatus,
    required this.pets,
    required this.oneSignalId,
    required this.furnishingOptions,
    required this.sexualOrientations,
    required this.smoking,
  });

  final String propertyName;
  final String propertyAddress;
  final String propertyArea;
  final String country;
  final String state;
  final String city;
  final String roomTypes;
  final String roomSizes;
  final String availableFrom;
  final String moveInDate;
  final String propertyImageURL;
  final String aboutProperty;
  final String bedroom;
  final String bathroom;
  final String kitchen;
  final String propertyAmountWeek;
  final String propertyAmountMonth;
  final String tokenAmount;
  final String minimumStay;
  final String maximumStay;
  final String ownerName;
  final String ownerPhone;
  final String ownershipProof;
  final String parking;
  final String billStatus;
  final String furnishingOptions;
  final String pets;
  final String oneSignalId;
  final String sexualOrientations;
  final String smoking;

  @override
  _PropertyEditState createState() => _PropertyEditState();
}

class _PropertyEditState extends State<PropertyEdit> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _propertyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _amountWeekController = TextEditingController();
  final TextEditingController _amountMonthController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _availableFromController = TextEditingController();
  final TextEditingController _moveinDateController = TextEditingController();
  final TextEditingController _selectedCityController = TextEditingController();
  final TextEditingController _moveInController = TextEditingController();
  final TextEditingController _aboutPropertyController = TextEditingController();
  final TextEditingController _tokenAmountController = TextEditingController();

  String? _selectedCountry;
  String? _selectedState;
  String? _selectedCity;
  String? _selectedRoomType;
  String? _selectedRoomSize;
  String? _selectedFurnishing;
  String? _selectedBedroom;
  String? _selectedBathroom;
  String? _selectedKitchen;
  String? _selectedTokenAmount;
  String? _selectedMinStay;
  String? _selectedMaxStay;
  String? _selectedSexualOrientation;

  DateTime? availableFrom;
  DateTime? moveInDate;

  bool parking = false;
  bool billsIncluded = false;
  bool petsAllowed = false;
  bool smokingAllowed = false;

  @override
  void initState() {
    super.initState();
    _propertyNameController.text = widget.propertyName;
    _amountWeekController.text = widget.propertyAmountWeek;
    _amountMonthController.text = widget.propertyAmountMonth;
    _areaController.text = widget.propertyArea;
    _addressController.text = widget.propertyAddress;
    _ownerNameController.text = widget.ownerName;
    _phoneController.text = widget.ownerPhone;
    _availableFromController.text = widget.availableFrom;
    _moveinDateController.text = widget.moveInDate;
    _selectedCityController.text = widget.city;
    _moveInController.text = widget.moveInDate;
    _aboutPropertyController.text = widget.aboutProperty;
    _tokenAmountController.text = widget.tokenAmount;
    _selectedCountry = widget.country;
    _selectedState = widget.state;
    _selectedCity = widget.city;
    _selectedRoomType = widget.roomTypes;
    _selectedRoomSize = widget.roomSizes;
    _selectedFurnishing = widget.furnishingOptions;
    _selectedBedroom = widget.bedroom;
    _selectedBathroom = widget.bathroom;
    _selectedKitchen = widget.kitchen;
    _selectedTokenAmount = widget.tokenAmount;
    _selectedMinStay = widget.minimumStay;
    _selectedMaxStay = widget.maximumStay;
    _selectedSexualOrientation = widget.sexualOrientations;
    parking = widget.parking == "Yes";
    billsIncluded = widget.billStatus == "Yes";
    petsAllowed = widget.pets == "Yes";
    smokingAllowed = widget.smoking == "Yes";

  }

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
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
              SizedBox(height: 30),
              BlocConsumer<PropertyAuthBlock, PropertyAuthState>(
                listener: (context, state) {
                  if (state is PropertyaddSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Property updated successfully!"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LandlordPage();
                      },
                    ));
                  }
                },
                builder: (context, state) {
                  return Padding(
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
                        if (_formKey.currentState!.validate()) {
                          Property_Model property = Property_Model(

                            propertyName: _propertyNameController.text,
                            propertyAddress: _addressController.text,
                            propertyArea: _areaController.text,
                            country: _selectedCountry,
                            state: _selectedState,
                            city: _selectedCityController.text,
                            roomTypes: _selectedRoomType,
                            roomSizes: _selectedRoomSize,
                            availableFrom: _availableFromController.text,
                            moveInDate: _moveInController.text,
                            propertyImageURL: "",
                            aboutProperty: _aboutPropertyController.text,
                            bedroom: _selectedBedroom,
                            bathroom: _selectedBathroom,
                            kitchen: _selectedKitchen,
                            furnishingOptions: _selectedFurnishing,
                            propertyAmountWeek: _amountWeekController.text,
                            propertyAmountMonth: _amountMonthController.text,
                            tokenAmount: _tokenAmountController.text,
                            stayDurations: _selectedMinStay,
                            sexualOrientations: _selectedSexualOrientation,
                            minimumStay: _selectedMinStay,
                            maximumStay: _selectedMaxStay,
                            ownerName: _ownerNameController.text,
                            ownerPhone: _phoneController.text,
                            ownershipProof: "",
                            parking: parking ? "Yes" : "No",
                            billStatus: billsIncluded ? "Yes" : "No",
                            pets: petsAllowed ? "Yes" : "No",
                            smoking: smokingAllowed ? "Yes" : "No",
                          );

                          context.read<PropertyAuthBlock>().add(
                              Property_Edit_Event( Property: property));
                        }
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 36),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: state is PropertyaddSuccess
                            ? Loading_Widget()
                            : Text(
                          "+Update",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  },
),
              SizedBox(height: 5),
              Divider(thickness: 2, color: Colors.black),
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
                          Expanded(child: _buildTextField("Property Name", _propertyNameController, (value) {
                            if (value!.isEmpty) {
                              return 'Please enter property name';
                            }
                            return null;
                          })),
                          SizedBox(width: 10),
                          Expanded(child: _buildTextField("Address", _addressController, (value) {
                            if (value!.isEmpty) {
                              return 'Please enter address';
                            }
                            return null;
                          })),
                        ],
                      ),
                      SizedBox(height: 10),
                      _buildTextField("Area", _areaController, (value) {
                        if (value!.isEmpty) {
                          return 'Please enter area';
                        }
                        return null;
                      }),
                      SizedBox(height: 10),
                      _buildDropdown("Country", ["India", "Canada", "United States", "United Kingdom"], _selectedCountry, (value) {
                        setState(() {
                          _selectedCountry = value;
                          _selectedState = null; // Reset state when country changes
                          _selectedCity = null; // Reset city when country changes
                        });
                      }, required: true),
                      SizedBox(height: 10),
                      _buildDropdown("State", _getStates(), _selectedState, (value) {
                        setState(() {
                          _selectedState = value;
                          _selectedCity = null; // Reset city when state changes
                        });
                      }, required: true),
                      SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: _buildDropdown("City", widget.city.split(','), _selectedCity, (value) {
                        setState(() => _selectedCity = value);
                      }, required: true)),
                ],
              ),
                      Divider(thickness: 2),
                      SizedBox(height: 10),

                      // Room Details
                      _buildSectionTitle("Room Details"),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(child: _buildDropdown("Room Type",["House", "Apartment", "Townhouse"], _selectedRoomType, (value) {
                            setState(() => _selectedRoomType = value);
                          }, required: true)),
                          SizedBox(width: 10),
                          Expanded(child: _buildDropdown("Room Size", ['Small', 'Medium', 'Large'], _selectedRoomSize, (value) {
                            setState(() => _selectedRoomSize = value);
                          },required: true)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: _buildDatePicker("Available From", availableFrom, (date) {
                            setState(() => availableFrom = date);
                          })),
                          SizedBox(width: 10),
                          Expanded(child: _buildDatePicker("Move-in Date", moveInDate, (date) {
                            setState(() => moveInDate = date);
                          })),
                        ],
                      ),
                      Divider(thickness: 2),
                      SizedBox(height: 10),
                      Text("Images:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      _buildImageContainer(),
                      SizedBox(height: 10),
                      _buildTextField("Description", _areaController, (value) {
                        if (value!.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      }),
                      Divider(thickness: 2),
                      // Pricing Details
                      _buildSectionTitle("Pricing Details"),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(child: _buildTextField("Amount /Week", _amountWeekController, (value) {
                            if (value!.isEmpty) {
                              return 'Please enter amount per week';
                            }
                            return null;
                          })),
                          SizedBox(width: 10),
                          Expanded(child: _buildTextField("Amount /Month", _amountMonthController, (value) {
                            if (value!.isEmpty) {
                              return 'Please enter amount per month';
                            }
                            return null;
                          })),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: _buildTextField("Token Amount", _tokenAmountController, (value) {
                            if (value!.isEmpty) {
                              return 'Please enter amount per month';
                            }
                            return null;
                          })),
                          SizedBox(width: 10),
                          Expanded(child: _buildDropdown("Sexual Orientation", ['Any', 'LGBTQ+ Friendly', 'Male Only', 'Female Only'], _selectedSexualOrientation, (value) {
                            setState(() => _selectedSexualOrientation = value);
                          },required:true)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: _buildDropdown("Minimum Stay", ['1', "2", "3", "4", "5", "6", "7", "8", "9", "10"], _selectedMinStay, (value) {
                            setState(() => _selectedMinStay = value);
                          },required:true)),
                          SizedBox(width: 10),
                          Expanded(child: _buildDropdown("Maximum Stay", ["6", "7", "8", "9", "10"], _selectedMaxStay, (value) {
                            setState(() => _selectedMaxStay = value);
                          },required:true)),
                        ],
                      ),
                      Divider(thickness: 2),
                      SizedBox(height: 10),

                      // Features (Radio Buttons)
                      _buildSectionTitle("Features"),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdown("Furnishing", ["Furnished", "Semi-Furnished", "Unfurnished"], _selectedFurnishing, (value) {
                              setState(() => _selectedFurnishing = value);
                            },required:true),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: _buildDropdown("Bedroom", ['1', '2', '3', '4', '5', '6 and above'], _selectedBedroom, (value) {
                              setState(() => _selectedBedroom = value);
                            },required:true),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdown("Bathroom", ['1', '2', '3', '4', '5', '6 and above'], _selectedBathroom, (value) {
                              setState(() => _selectedBathroom = value);
                            },required:true),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: _buildDropdown("Kitchen", ['1', '2', '3', '4', '5', '6 and above'], _selectedKitchen, (value) {
                              setState(() => _selectedKitchen = value);
                            },required:true),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Additional Preferences",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildCheckbox("Parking Available", parking, (value) {
                              setState(() => parking = value!);
                            }),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: _buildCheckbox("Bills Included", billsIncluded, (value) {
                              setState(() => billsIncluded = value!);
                            }),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildCheckbox("Pets Allowed", petsAllowed, (value) {
                              setState(() => petsAllowed = value!);
                            }),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: _buildCheckbox("Smoking Allowed", smokingAllowed, (value) {
                              setState(() => smokingAllowed = value!);
                            }),
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
                          Expanded(child: _buildTextField("Owner Name", _ownerNameController, (value) {
                            if (value!.isEmpty) {
                              return 'Please enter owner name';
                            }
                            return null;
                          })),
                          SizedBox(width: 10),
                          Expanded(child: _buildTextField("Phone Number", _phoneController, (value) {
                            if (value!.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          })),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text("Upload Ownership Proof:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      ElevatedButton(onPressed: () {}, child: Text("Upload Document")),
                      SizedBox(height: 10),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, String? Function(String?)? validator) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedValue, Function(String?) onChanged, {required bool required}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        value: selectedValue,
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
        validator: (value) => required && value == null ? 'Please select $label' : null,
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
          labelText: date == null ? label : "$label: ${date.toLocal()}".split(' ')[0],
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context, onDateSelected),
          ),
        ),
        validator: (value) => date == null ? 'Please select a date' : null,
      ),
    );
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

  List<String> _getStates() {
    switch (_selectedCountry) {
      case "India":
        return [
          "Andhra Pradesh",
          "Arunachal Pradesh",
          "Assam",
          "Bihar",
          "Chhattisgarh",
          "Goa",
          "Gujarat",
          "Haryana",
          "Himachal Pradesh",
          "Jharkhand",
          "Karnataka",
          "Kerala",
          "Madhya Pradesh",
          "Maharashtra",
          "Manipur",
          "Meghalaya",
          "Mizoram",
          "Nagaland",
          "Odisha",
          "Punjab",
          "Rajasthan",
          "Sikkim",
          "Tamil Nadu",
          "Telangana",
          "Tripura",
          "Uttar Pradesh",
          "Uttarakhand",
          "West Bengal"
        ];
      case "Canada":
        return [
          "Alberta",
          "British Columbia",
          "Manitoba",
          "New Brunswick",
          "Newfoundland and Labrador",
          "Nova Scotia",
          "Ontario",
          "Prince Edward Island",
          "Quebec",
          "Saskatchewan",
          "Northwest Territories",
          "Nunavut",
          "Yukon"
        ];
      case "United States":
        return [
          "Alabama",
          "Alaska",
          "Arizona",
          "Arkansas",
          "California",
          "Colorado",
          "Connecticut",
          "Delaware",
          "Florida",
          "Georgia",
          "Hawaii",
          "Idaho",
          "Illinois",
          "Indiana",
          "Iowa",
          "Kansas",
          "Kentucky",
          "Louisiana",
          "Maine",
          "Maryland",
          "Massachusetts",
          "Michigan",
          "Minnesota",
          "Mississippi",
          "Missouri",
          "Montana",
          "Nebraska",
          "Nevada",
          "New Hampshire",
          "New Jersey",
          "New Mexico",
          "New York",
          "North Carolina",
          "North Dakota",
          "Ohio",
          "Oklahoma",
          "Oregon",
          "Pennsylvania",
          "Rhode Island",
          "South Carolina",
          "South Dakota",
          "Tennessee",
          "Texas",
          "Utah",
          "Vermont",
          "Virginia",
          "Washington",
          "West Virginia",
          "Wisconsin",
          "Wyoming"
        ];
      case "United Kingdom":
        return [
          "England",
          "Scotland",
          "Wales",
          "Northern Ireland",
          "Guernsey",
          "Jersey",
          "Isle of Man",
          "Anguilla",
          "Bermuda",
          "British Antarctic Territory",
          "British Indian Ocean Territory",
          "British Virgin Islands",
          "Cayman Islands",
          "Falkland Islands",
          "Montserrat",
          "Pitcairn Islands",
          "Saint Helena, Ascension and Tristan da Cunha",
          "South Georgia and the South Sandwich Islands",
          "Sovereign Base Areas of Akrotiri and Dhekelia",
          "Turks and Caicos Islands"
        ];
      default:
        return [];
    }
  }

  List<String> _getCities() {
    // You can implement city fetching logic based on selected state if needed
    return ["City1", "City2", "City3"]; // Placeholder
  }
}