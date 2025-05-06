import 'package:course_connect/Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controller/Bloc/Landloard_auth/LandloardModel/LandloardModel.dart';
import '../../../../Widget/Constands/Loading.dart';

class Landlordsignupwrapper extends StatelessWidget {
  const Landlordsignupwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandloardAuthBloc(),
      child: Signup(),
    );
  }
}
String idproofimage = '1';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  String? selectedUniversity;
  String? gender;
  List<String> universities = ["University A", "University B", "University C"];
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _nameController =
      TextEditingController(); // ✅ Email Controller

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose(); // ✅ Dispose email controller
    _phoneController.dispose();
    _placeController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      // Create a Landloard_Model instance
      Landloard_Model user = Landloard_Model(
        name: _nameController.text,
        email: _emailController.text,
        phone_number: _phoneController.text,
        gender: gender,
        DOB: _dobController.text,
        Place: _placeController.text,
        Adress: _addressController.text,
        password: passwordController.text,
        Universityname: selectedUniversity,
        idproofimage: idproofimage, // ✅ now the uploaded URL will be passed

      );

      // Trigger the sign-up event
      context.read<LandloardAuthBloc>().add(LandloardSignupEvent(user: user));
    }
  }

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

  // Validation function for email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) return "Enter a valid email";
    return null;
  }

  // Validation function for phone number
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return "Phone number is required";
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value))
      return "Enter a valid 10-digit phone number";
    return null;
  }

  // Validation function for password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password must be at least 6 characters long";
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Validation function for required fields
  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) return "This field is required";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandloardAuthBloc, LandloardAuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          });
        }
        if (state is AuthenticatedError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message.toString())),
          );
        }
      },
      builder: (context, state) {
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
                            buildTextField(
                                "Name", _nameController, validateRequired),
                            buildTextField(
                                "Email", _emailController, validateEmail),
                            buildTextField("Phone Number", _phoneController,
                                validatePhone),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text("Gender: ",
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(width: 5),
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
                            if (gender == null)
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Please select a gender",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  ),
                                ),
                              ),
                            SizedBox(height: 10),
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
                              validator: validateRequired,
                            ),
                            SizedBox(height: 10),
                            buildTextField(
                                "Place", _placeController, validateRequired),
                            buildTextField("Address", _addressController,
                                validateRequired),
                            buildTextField("Password", passwordController,
                                validatePassword,
                                obscureText: true),
                            buildTextField(
                                "Confirm Password",
                                confirmPasswordController,
                                _validateConfirmPassword,
                                obscureText: true),

                            SizedBox(height: 10),
                            BlocConsumer<LandloardAuthBloc, LandloardAuthState>(
                              listener: (context, state) {
                                if (state is Imageuploadedurl) {
                                  setState(() {
                                    idproofimage = state.Imageurl;
                                  });
                                }
                              },
                              builder: (context, state) {
                                String? imageUrl;
                                if (state is Imageuploadedurl) {
                                  imageUrl = state.Imageurl;
                                }

                                return Card(
                                  child: Container(
                                    height: 100,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: state is Imageuploadedurl ? Colors.green : Colors.red,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: imageUrl != null && imageUrl.isNotEmpty
                                                ? Image.network(
                                              imageUrl,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fill,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Container(
                                                  width: 100,
                                                  height: 100,
                                                  color: Colors.grey[300],
                                                  child: Icon(Icons.image_not_supported,
                                                      size: 50, color: Colors.grey[600]),
                                                );
                                              },
                                            )
                                                : Container(
                                              width: 100,
                                              height: 100,
                                              color: Colors.grey[300],
                                              child: Icon(Icons.image, size: 10, color: Colors.grey[600]),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.read<LandloardAuthBloc>().add(Uploadidproofphoto());
                                          },
                                          child: state is ImageuploadLoading
                                              ? Loading_Widget()
                                              : (state is Imageuploadedurl
                                              ? Text("Uploaded ✅", style: TextStyle(color: Colors.green))
                                              : Text("Upload id proof image")),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),

                            SizedBox(height: 20),
                            const SizedBox(height: 20),
                            const SizedBox(height: 20),
                            SizedBox(
                                height: 70,
                                child: Column(
                                  children: [
                                    state is Authloading
                                        ? Loading_Widget()
                                        : Text(""),
                                  ],
                                )),
                            InkWell(
                              onTap: () => _registerUser(),
                              child: Container(
                                height: 51,
                                width: 231,
                                decoration: BoxDecoration(
                                  color: Color(0xff0A71CB),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
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
      },
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      String? Function(String?) validator,
      {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}
