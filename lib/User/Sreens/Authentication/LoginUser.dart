import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import '../../../Widget/Constands/CustomTextfield.dart';
import '../../../Widget/Constands/Loading.dart';
import '../../../Widget/Constands/colors.dart';
import '../../Profile/Forgotpswd.dart';

import 'UserSignup.dart';

class UserLogin_auth extends StatefulWidget {
  const UserLogin_auth({super.key});

  @override
  State<UserLogin_auth> createState() => _UserLogin_authState();
}

class _UserLogin_authState extends State<UserLogin_auth> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  bool _isPasswordVisible = false;

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
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey, // Form key for validation
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 200),
                  Image.asset("assets/logo.png", width: 200),
                  SizedBox(height: 20),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        CustomTextForm(
                          controller: _emailController,
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter an email";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                                .hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        CustomTextForm(
                          controller: _passwordController,
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          obscureText: !_isPasswordVisible, // Toggle visibility

                          // suffixIcon: Icon(Icons.visibility_off_outlined),
                          // obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a password";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        Row(
                          children: [
                            // Checkbox(
                            //   activeColor: blueColor,
                            //   value: isChecked,
                            //   onChanged: (val) {
                            //     setState(() {
                            //       isChecked = !isChecked;
                            //     });
                            //   },
                            // ),
                            // Text("Remember Me?")
                          ],
                        ),
                        SizedBox(height: 20),
                        state is Authloading
                            ? Loading_Widget()
                            : InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    final authBloc =
                                        BlocProvider.of<AuthBloc>(context);
                                    authBloc.add(LoginEvent(
                                      Email: _emailController.text,
                                      Password: _passwordController.text,
                                    ));
                                  }
                                },
                                child: Container(
                                  height: 51,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Login",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Forgotpswd()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New to Course Connect AI ?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Usersignupwrapper()), // Navigate to SignUp page
                          );
                        },
                        child: Text("Sign Up"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
