import 'package:course_connect/Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import 'package:course_connect/Landlord/Views/Screens/Auth/Landloard_Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widget/Constands/Loading.dart';

class Landloardlogin extends StatefulWidget {
  @override
  _LandloardloginState createState() => _LandloardloginState();
}

class _LandloardloginState extends State<Landloardlogin> {
  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final authBloc = BlocProvider.of<LandloardAuthBloc>(context);
      authBloc.add(Landloard_LoginEvent(
        Email: _emailController.text,
        Password: _passwordController.text,
      ));
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) return "Enter a valid email";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandloardAuthBloc, LandloardAuthState>(
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
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  color: Colors.white,
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/logo.png", height: 80),
                          SizedBox(height: 15),
                          Text(
                            "WELCOME BACK!",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Login as a Landlord",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700])),
                          SizedBox(height: 25),
                          buildTextField("Email", Icons.person,
                              _emailController, validateEmail),
                          buildTextField("Password", Icons.lock,
                              _passwordController, validatePassword,
                              obscureText: true),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });
                                },
                                activeColor: Colors.blueAccent,
                              ),
                              Text("Remember me",
                                  style: TextStyle(fontSize: 14)),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text("Forgot password?",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 14)),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          state is Authloading
                              ? Loading_Widget()
                              : SizedBox(
                                  width: 600,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: _login,
                                    child: Text("Login",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                  ),
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
                                        builder: (context) => Signup()),
                                  );
                                },
                                child: Text("Sign Up"),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Image.asset("assets/Background/img_4.png",
                              height: 180, width: 250),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Background/login.jpg"),
                      fit: BoxFit.cover,
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

  Widget buildTextField(String label, IconData icon,
      TextEditingController controller, String? Function(String?) validator,
      {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 600,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon, color: Colors.blueAccent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}
