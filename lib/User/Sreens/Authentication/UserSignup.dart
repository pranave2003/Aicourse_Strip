import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/Bloc/User_Authbloc/Userauthmodel/Usermodel.dart';
import '../../../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import '../../../Widget/Constands/Loading.dart';
import '../../../Widget/Constands/colors.dart';
import '../../../Widget/Constands/CustomTextfield.dart';
import '../Authentication/LoginUser.dart';

class Usersignupwrapper extends StatelessWidget {
  const Usersignupwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: UserSignup(),
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

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController =
      TextEditingController(); // ✅ Email Controller
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose(); // ✅ Dispose email controller
    _mobileController.dispose();
    _countryController.dispose();
    _stateController.dispose();
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
          Country: _countryController.text,
          City: _cityController.text,
          state: _stateController.text);
      // Trigger the sign-up event
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

                    /// Full Name
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Full Name",
                      controller: _nameController,
                      validator: _validateName,
                    ),
                    const SizedBox(height: 15),

                    /// ✅ Email Field
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.email),
                      hintText: "Email",
                      controller: _emailController,
                      validator: _validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),

                    /// Mobile Number
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.phone),
                      hintText: "Mobile Number",
                      controller: _mobileController,
                      validator: _validateMobile,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15),

                    /// Country
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.place_sharp),
                      hintText: "Country",
                      controller: _countryController,
                      validator: (value) => _validateField(value, 'Country'),
                    ),
                    const SizedBox(height: 15),

                    /// State
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.place),
                      hintText: "State",
                      controller: _stateController,
                      validator: (value) => _validateField(value, 'State'),
                    ),
                    const SizedBox(height: 15),

                    /// City
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.place_outlined),
                      hintText: "City",
                      controller: _cityController,
                      validator: (value) => _validateField(value, 'City'),
                    ),
                    const SizedBox(height: 15),

                    /// Password
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.password),
                      hintText: "Password",
                      controller: _passwordController,
                      validator: _validatePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),

                    /// Confirm Password
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.password_sharp),
                      hintText: "Confirm Password",
                      controller: _confirmPasswordController,
                      validator: _validateConfirmPassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        height: 70,
                        child: Column(
                          children: [
                            state is Authloading ? Loading_Widget() : Text(""),
                          ],
                        )),

                    /// Sign Up Button
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
                    SizedBox(
                        height: 70,
                        child: Column(
                          children: [
                            state is Authloading ? Loading_Widget() : Text(""),
                          ],
                        )),

                    /// Navigate to Sign In
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
}
