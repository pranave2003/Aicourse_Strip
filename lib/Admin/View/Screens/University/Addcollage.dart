import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Controller/Bloc/University_block/University_model/Universitycollage.dart';
import '../../../../Controller/Bloc/University_block/university_bloc.dart';
import '../../../../Widget/Constands/Loading.dart';
import '../../../Main/Adminmain.dart';

class Addcollage extends StatefulWidget {
  const Addcollage({super.key});

  @override
  State<Addcollage> createState() => _AddcollageState();
}

class _AddcollageState extends State<Addcollage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String? selectedCountry;
  int? selectedRank;
  DateTime? establishedDate;
  DateTime? admissionStartDate;
  DateTime? admissionEndDate;
  // education

  final TextEditingController establishedDateController =
      TextEditingController();
  final TextEditingController admissionStartDateController =
      TextEditingController();
  final TextEditingController admissionEndDateController =
      TextEditingController();
  final TextEditingController UniversitynameController =
      TextEditingController();
  final TextEditingController collegenamectrl = TextEditingController();
  final TextEditingController collegecodectrl = TextEditingController();

  // String university_image = '1';
  bool isImageMissing = false; // Define at the top of your state class
  String? university_image; // Your image URL variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          // Wrap the form fields in a Form widget
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Header Section**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Welcome ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("Admin,",
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
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20, // Ensure a proper radius is set
                              backgroundColor: Colors.grey, // Fallback color
                              backgroundImage: AssetImage(
                                  'assets/Profile/img.png'), // Corrected Path
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Admin",
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

              SizedBox(height: 20),
              BlocConsumer<UniversityBloc, UniversityState>(
                listener: (context, state) {
                  if (state is RefreshUniversity) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AdminPage();
                      },
                    ));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("University added successfully!"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "University Adding Page",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              {
                                Collagemodel university = Collagemodel(
                                    UniversityimageURL: university_image ??
                                        "https://firebasestorage.googleapis.com/v0/b/courseconnectai.firebasestorage.app/o/universitydummy%2F360_F_110530499_pjM3zKDTmbwdsUbduglVzAsl4HGVUzDA.jpg?alt=media&token=631596e2-7e4f-4bf1-ad30-9a2c8193f6ac",
                                    Country: selectedCountry,
                                    Admission_enddate:
                                        admissionEndDateController.text,
                                    Admission_startdate:
                                        admissionStartDateController.text,
                                    Established_date:
                                        establishedDateController.text,
                                    Universityname:
                                        UniversitynameController.text,
                                    Rank: selectedRank,
                                    Collegename: collegenamectrl.text,
                                    collagecode: collegecodectrl.text);
                                context.read<UniversityBloc>().add(
                                    Collage_Add_Event(collage: university));
                              }
                            }

                            if (university_image == null ||
                                university_image!.isEmpty) {
                              setState(() {
                                isImageMissing = true;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Please upload a university image."),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return; // Prevent form submission
                            }

                            // Proceed with the rest of the form submission
                          },
                          borderRadius: BorderRadius.circular(
                              8), // Smooth border effect on tap
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 36),
                            decoration: BoxDecoration(
                              color: Colors.blue, // Blue background
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                            ),
                            child: state is Collage_Add_Eventloading
                                ? Loading_Widget()
                                : Text(
                                    "+Add",
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

              /// **Divider Line**
              SizedBox(height: 5),
              Divider(thickness: 2, color: Colors.grey),

              SizedBox(height: 20),
              Row(
                children: [
                  // University Name Field
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 25),
                      child: TextFormField(
                        controller: UniversitynameController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: "University Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          final formatted = value
                              .split(' ')
                              .map((word) => word.isNotEmpty
                                  ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
                                  : '')
                              .join(' ');

                          if (value != formatted) {
                            UniversitynameController.value =
                                UniversitynameController.value.copyWith(
                              text: formatted,
                              selection: TextSelection.collapsed(
                                  offset: formatted.length),
                            );
                          }
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'University Name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  // University Image Upload Section
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 25, top: 8, bottom: 8),
                      child: BlocConsumer<UniversityBloc, UniversityState>(
                        listener: (context, state) {
                          if (state is Imageuploadedurl) {
                            university_image = state.Imageurl;
                            isImageMissing = false;
                            print("University image: $university_image");
                          }
                        },
                        builder: (context, state) {
                          String? imageUrl;

                          if (state is Imageuploadedurl) {
                            imageUrl = state.Imageurl;
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: state is Imageuploadedurl
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: imageUrl != null &&
                                                  imageUrl.isNotEmpty
                                              ? Image.network(
                                                  imageUrl,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Container(
                                                      width: 100,
                                                      height: 100,
                                                      color: Colors.grey[300],
                                                      child: Icon(
                                                        Icons
                                                            .image_not_supported,
                                                        size: 50,
                                                        color: Colors.grey[600],
                                                      ),
                                                    );
                                                  },
                                                )
                                              : Container(
                                                  width: 100,
                                                  height: 100,
                                                  color: Colors.grey[300],
                                                  child: Icon(
                                                    Icons.image,
                                                    size: 40,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context
                                              .read<UniversityBloc>()
                                              .add(UploadUniversityphoto());
                                        },
                                        child: state is ImageuploadLoading
                                            ? CircularProgressIndicator()
                                            : (state is Imageuploadedurl
                                                ? Text(
                                                    "Uploaded ✅",
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  )
                                                : Text("Upload Image")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (isImageMissing)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 8),
                                  child: Text(
                                    "University image is required",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 25),
                      child: TextFormField(
                        controller: collegenamectrl,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: "College Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          final formatted = value
                              .split(' ')
                              .map((word) => word.isNotEmpty
                                  ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
                                  : '')
                              .join(' ');

                          if (value != formatted) {
                            collegenamectrl.value =
                                collegenamectrl.value.copyWith(
                              text: formatted,
                              selection: TextSelection.collapsed(
                                  offset: formatted.length),
                            );
                          }
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'College Name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 25),
                      child: TextFormField(
                        controller: collegecodectrl,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: "College Code",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          final upper = value.toUpperCase();
                          if (value != upper) {
                            collegecodectrl.value =
                                collegecodectrl.value.copyWith(
                              text: upper,
                              selection:
                                  TextSelection.collapsed(offset: upper.length),
                            );
                          }
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'College Code is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),

              /// **Admission Type (Radio Buttons)**

              Row(
                children: [
                  Expanded(
                    child: buildDropdown(
                        "Country",
                        [
                          "United States",
                          "United Kingdom",
                          "Canada",
                          "India",
                        ],
                        selectedCountry, (value) {
                      setState(() => selectedCountry = value);
                    }, required: true),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildDatePicker("Established Date", establishedDate,
                        (date) {
                      setState(() {
                        establishedDate = date;
                        establishedDateController.text = "${date?.toLocal()}"
                            .split(' ')[0]; // Format the date
                      });
                    }, required: true),
                  ),
                ],
              ),

              // Admission Start & End Date in the Same Row
              Row(
                children: [
                  Expanded(
                    child: buildDatePicker(
                        "Admission Start Date", admissionStartDate, (date) {
                      setState(() {
                        admissionStartDate = date;
                        admissionStartDateController.text = "${date?.toLocal()}"
                            .split(' ')[0]; // Format the date
                      });
                    }, required: true),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildDatePicker(
                        "Admission End Date", admissionEndDate, (date) {
                      setState(() {
                        admissionEndDate = date;
                        admissionEndDateController.text = "${date?.toLocal()}"
                            .split(' ')[0]; // Format the date
                      });
                    }, required: true),
                  ),
                ],
              ),
              Container(
                height: 60,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "QS Rank",
                    hintText: "Enter QS Rank (e.g., 42)",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Only allow digits
                  ],
                  initialValue: selectedRank?.toString() ??
                      '', // Just for displaying initial value
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'QS Rank is required';
                    }
                    final intValue = int.tryParse(value.trim());
                    if (intValue == null) {
                      return 'Enter a valid integer';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    final intValue = int.tryParse(value.trim());
                    if (intValue != null) {
                      setState(() {
                        selectedRank = intValue; // ✅ Store as integer only
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker(
      String label, DateTime? selectedDate, ValueChanged<DateTime?> onChanged,
      {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: TextFormField(
        controller: selectedDate == establishedDate
            ? establishedDateController
            : selectedDate == admissionStartDate
                ? admissionStartDateController
                : admissionEndDateController,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            onChanged(pickedDate);
          }
        },
        validator: (value) =>
            required && selectedDate == null ? '$label is required' : null,
      ),
    );
  }

  Widget buildDropdown(String label, List<String> options,
      String? selectedValue, ValueChanged<String?> onChanged,
      {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: selectedValue,
        onChanged: onChanged,
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: (value) =>
            required && value == null ? '$label is required' : null,
      ),
    );
  }
}
