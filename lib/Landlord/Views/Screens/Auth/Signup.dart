import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Signup(),
  ));
}

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  String? selectedUniversity;
  String? gender;
  List<String> universities = ["University A", "University B", "University C"];
  TextEditingController _dobController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background/new4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white.withOpacity(0.9),
                child: Container(
                  width: 900,
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "REGISTER HERE",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        buildShortTextField("Name"),
                        buildShortTextField("Email"),
                        buildShortTextField("Phone Number"),
                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Text("Gender: ", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Radio(
                                  value: "Male",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value as String?;
                                    });
                                  },
                                ),
                                Text("Male"),
                                Radio(
                                  value: "Female",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value as String?;
                                    });
                                  },
                                ),
                                Text("Female"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),

                        TextFormField(
                          controller: _dobController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "DOB",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () => _selectDate(context),
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 10),
                        buildShortTextField("Place"),
                        buildShortTextField("Postcode/Pincode"),
                        buildShortTextField("Password", obscureText: true),

                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: "Nearby University",
                            border: OutlineInputBorder(),
                          ),
                          value: selectedUniversity,
                          items: universities.map((String university) {
                            return DropdownMenuItem(
                              value: university,
                              child: Text(university),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedUniversity = value as String?;
                            });
                          },
                        ),
                        SizedBox(height: 10),

Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: 10),
    Text("  Government-issued ID (Passport, Driver’s License, etc.)"),

  ],
),
                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Choose File"),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                        SizedBox(height: 10),
                        const SizedBox(height: 20),

                        // Continue Button
                        InkWell(
                          onTap: () {
                          },
                          child: Container(
                            height: 51,
                            width: 231,
                            decoration: BoxDecoration(
                              color: Color(0xff0A71CB),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShortTextField(String label, {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 900,
        child: TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
