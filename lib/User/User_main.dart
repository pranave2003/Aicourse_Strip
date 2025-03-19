import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../firebase_options.dart';
import '../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'Sreens/Authentication/LoginUser.dart';
import 'Sreens/Authentication/Spashview.dart';
import 'Sreens/BottomNavigation/Bottom_Nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        routes: {
          '/': (context) => Splashpagewrapper(),
          '/home': (context) => BottomNavWrapper(),
          '/login': (context) => UserLogin_auth(),
        },
      ),
    );
  }
}
