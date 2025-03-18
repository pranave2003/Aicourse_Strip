import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controller/Bloc/User_Authbloc/auth_bloc.dart';

class Landloard_Splashpagewrapper extends StatelessWidget {
  const Landloard_Splashpagewrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(checkloginstateevent()),
      child: LandloardSplash(),
    );
  }
}

class LandloardSplash extends StatefulWidget {
  const LandloardSplash({super.key});

  @override
  State<LandloardSplash> createState() => _LandloardSplashState();
}

class _LandloardSplashState extends State<LandloardSplash> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is UnAuthenticated) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 413,
                  height: 283,
                )
              ],
            ),
          ),
        ));
  }
}
