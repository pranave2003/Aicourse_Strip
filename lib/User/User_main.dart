import 'package:course_connect/Controller/Bloc/Ai_coursefinder_block/coursefinder_block.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_block.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../../../firebase_options.dart';
import '../Controller/Bloc/Applycourse/application_bloc.dart';
import '../Controller/Bloc/Booking/Booking_authblock.dart';
import '../Controller/Bloc/Dropdown_university/dropdown_bloc.dart';
import '../Controller/Bloc/Strip/BlocLayer/payment_bloc.dart';
import '../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import '../Controller/Bloc/selection_cubit.dart';
import '../Service/Notification_onesignal/onesignal_service.dart';
import '../Service/Strip/keys.dart';
import '../Service/Strip/payment_repository.dart';
import 'Sreens/Authentication/LoginUser.dart';
import 'Sreens/Authentication/Spashview.dart';
import 'Sreens/BottomNavigation/Bottom_Nav.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   print("main() called");
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//   OneSignal.initialize("d9c1ddc3-bf3e-4f1f-9ab7-220a46ada041");
//   OneSignal.Notifications.requestPermission(true);
//   await initOneSignal();
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print("Firebase Initialization Error: $e");
  }

  // Initialize Stripe
  try {
    Stripe.publishableKey = Publishablekey;
    await Stripe.instance.applySettings();
  } catch (e) {
    print("//////////////////////////////  Stripe Initialization Error: $e");
  }

  // Initialize OneSignal
  try {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("d9c1ddc3-bf3e-4f1f-9ab7-220a46ada041");
    OneSignal.Notifications.requestPermission(true);
    await initOneSignal();
  } catch (e) {
    print("OneSignal Initialization Error: $e");
  }

  runApp(MyApp());
}

Future<void> initOneSignal() async {
  await Future.delayed(const Duration(seconds: 2));

  final id = OneSignal.User.pushSubscription.id;

  if (id != null) {
    print('✅ OneSignal Player ID: $id');
    OneSignalService().setPlayerId(id); // Store in the service
  } else {
    print("❌ Player ID is null. The user may not be subscribed yet......");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyApp build");
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PaymentBloc(paymentRepository: PaymentRepository()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<ApplicationBloc>(
          create: (context) => ApplicationBloc(),
        ),
        BlocProvider<CoursefinderBlock>(
          create: (context) => CoursefinderBlock(),
        ),
        BlocProvider<UniversityBloc>(
          create: (context) => UniversityBloc(),
        ),
        BlocProvider<PropertyAuthBlock>(
          create: (context) => PropertyAuthBlock(),
        ),
        BlocProvider<BookingAuthblock>(
          create: (context) => BookingAuthblock(),
        ),
        BlocProvider(
          create: (context) => SelectionCubit(),
        ),
        BlocProvider<DropdownBloc>(
          create: (context) => DropdownBloc()..add(Fetchcatogorybydropdown()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(backgroundColor: Colors.white)),
        routes: {
          '/': (context) => Splashpagewrapper(),
          '/home': (context) => BottomNavWrapper(),
          '/login': (context) => UserLogin_auth(),
        },
      ),
    );
  }
}
