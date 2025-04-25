
import 'package:course_connect/User/Sreens/Authentication/LoginUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/Bloc/User_Authbloc/Userauthmodel/Usermodel.dart';
import '../../../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import '../../../Widget/Constands/Loading.dart';
import '../../../Widget/Constands/colors.dart';
import '../../../Widget/Constands/CustomTextfield.dart';

class Usersignupwrapper extends StatelessWidget {
  const Usersignupwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const UserSignup(),
    );
  }
}

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCountry;
  String? selectedState;
  String? selectedGender;

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      UserModel user = UserModel(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        phone: _mobileController.text,
        Country: selectedCountry ?? '',
        City: _cityController.text,
        state: selectedState ?? '',
        Gender: selectedGender ?? '',
      );
      context.read<AuthBloc>().add(SignupEvent(user: user));
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  String? _validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Widget buildDropdown(String hint, List<String> items, String? selectedValue,
      ValueChanged<String?> onChanged) {
    IconData getPrefixIcon(String hint) {
      switch (hint) {
        case "Gender":
          return Icons.person_outline;
        case "Country":
        case "State":
          return Icons.place;
        default:
          return Icons.list;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          prefixIcon: Icon(getPrefixIcon(hint)),
          hintText: hint,
          border: InputBorder.none,
        ),
        value: selectedValue,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select $hint' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
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
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo.png", width: 150),
                    const SizedBox(height: 20),
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Full Name",
                      controller: _nameController,
                      validator: _validateName,
                    ),
                    const SizedBox(height: 15),
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.email),
                      hintText: "Email",
                      controller: _emailController,
                      validator: _validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.phone),
                      hintText: "Mobile Number",
                      controller: _mobileController,
                      validator: _validateMobile,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15),
                    buildDropdown(
                        "Gender", ["Male", "Female", "Other"], selectedGender,
                        (value) {
                      setState(() {
                        selectedGender = value; // ✅ No reset here
                      });
                    }),
                    const SizedBox(height: 15),
                    buildDropdown(
                        "Country",
                        ["India", "Canada", "United States", "UK"],
                        selectedCountry, (value) {
                      setState(() {
                        selectedCountry = value;
                        selectedState = null;
                      });
                    }),
                    const SizedBox(height: 15),
                    if (selectedCountry != null)
                      buildDropdown(
                          "State",
                          _getStatesForCountry(selectedCountry!),
                          selectedState, (value) {
                        setState(() {
                          selectedState = value;
                        });
                      }),
                    const SizedBox(height: 15),
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.place_outlined),
                      hintText: "City",
                      controller: _cityController,
                      validator: (value) => _validateField(value, 'City'),
                    ),
                    const SizedBox(height: 15),
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.password),
                      hintText: "Password",
                      controller: _passwordController,
                      validator: _validatePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.password_sharp),
                      hintText: "Confirm Password",
                      controller: _confirmPasswordController,
                      validator: _validateConfirmPassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    if (state is Authloading) Loading_Widget(),
                    InkWell(
                      onTap: _registerUser,
                      child: Container(
                        height: 51,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: blueColor,
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserLogin_auth()),
                            );
                          },
                          child: const Text("Sign In"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<String> _getStatesForCountry(String country) {
    switch (country) {
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
      case "UK":
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
}
