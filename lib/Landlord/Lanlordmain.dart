import 'package:course_connect/Controller/Bloc/Booking/BookingAuthEvent.dart';
import 'package:course_connect/Controller/Bloc/Booking/Booking_authblock.dart';
import 'package:course_connect/Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import 'package:course_connect/Landlord/Views/Screens/ProfileLandlord/LandlordProfile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:course_connect/Landlord/Views/Screens/Bookings/AllBookings.dart';
import 'package:course_connect/Landlord/Views/Screens/Payments/ViewPayment.dart';
import 'package:course_connect/Landlord/Views/Screens/Property/Property.dart';
import 'package:course_connect/Landlord/Views/Screens/Property/PropertyAdd.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Controller/Bloc/Property/Property/Property_auth_block.dart';
import '../firebase_options.dart';
import 'Views/Screens/Auth/LandloardSplash.dart';
import 'Views/Screens/Auth/Landloard_Login.dart';

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
        BlocProvider<LandloardAuthBloc>(
          create: (context) => LandloardAuthBloc(),
        ),
        BlocProvider<BookingAuthblock>(
          create: (context) => BookingAuthblock()
            ..add(FetchBookings(searchQuery: null),
        ),
        ),
        BlocProvider<PropertyAuthBlock>(
          create: (context) => PropertyAuthBlock(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        routes: {
          '/': (context) => PropertyAdd(),
          '/': (context) => Landloard_Splashpagewrapper(),
          '/home': (context) => LandlordPageWrapper(),
          '/login': (context) => Landloardlogin(),
        },
      ),
    );
  }
}

class LandlordPageWrapper extends StatelessWidget {
  const LandlordPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandloardAuthBloc()..add(FetchLandlordDetailsById()),
      child: LandlordPage(),
    );
  }
}

class LandlordPage extends StatefulWidget {
  const LandlordPage({super.key});

  @override
  State<LandlordPage> createState() => _LandlordPageState();
}

class _LandlordPageState extends State<LandlordPage> {
  Widget? _selectedPage;
  String? _selectedTile;
  String? _expandedTile;

  final Color mainExpansionSelectedColor = Colors.blue;
  final Color subExpansionSelectedColor = Colors.pink;

  @override
  void initState() {
    _selectedPage = const Dashboard();
    _selectedTile = "Dashboard";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Left side: Sidebar Navigation
          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(topRight: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                  width: 30,
                ),
                Center(
                  child: Image.asset(
                    "assets/logo.png",
                    width: 160,
                    height: 122,
                  ),
                ),
                const SizedBox(height: 20),
                _buildMainListTile('Dashboard', const Dashboard(),
                    icon: Icons.dashboard),
                _buildMainExpansionTile(
                  title: 'Property',
                  icon: Icons.apartment,
                  children: [
                    _buildSubListTile("View Property", Propertymainwrapper()),
                    _buildSubListTile("Add Property", PropertyAdd()),
                    // _buildSubListTile("Edit Property", PropertyEdit()),
                  ],
                ),

                _buildMainListTile('Bookings', Pending_Booking_wrapper(),
                    icon: Icons.book_online),
                _buildMainListTile('Payment', ViewPayment(),
                    icon: Icons.payments_outlined),
                // _buildMainExpansionTile(
                //   title: 'Account',
                //   icon: Icons.person,
                //   children: [
                //     _buildSubListTile("View Profile", LandlordProfile()),
                //
                //   ],
                // ),
                _buildMainListTile('Account', LandlordProfile(),
                    icon: Icons.person),
                _buildMainExpansionTile(
                  title: 'Settings',
                  icon: Icons.settings,
                  children: [
                    // SubListTile("Account", FeedbackView()),
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    final Authbloc =
                        BlocProvider.of<LandloardAuthBloc>(context);
                    Authbloc.add(LandloardSigOutEvent());
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            ),
          ),
          // Right side: Display selected page
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: _selectedPage ??
                  const Center(
                    child: Text('Select a management option'),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainExpansionTile({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      textColor: mainExpansionSelectedColor,
      iconColor: mainExpansionSelectedColor,
      leading: Icon(icon),
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      title: Text(
        title,
        style: const TextStyle(fontSize: 17),
      ),
      initiallyExpanded: _expandedTile == title,
      onExpansionChanged: (isExpanded) {
        setState(() {
          _expandedTile = isExpanded ? title : null;
        });
      },
      children: children,
    );
  }

  Widget _buildMainListTile(String title, Widget page, {IconData? icon}) {
    return ListTile(
      leading: icon != null
          ? Icon(icon,
              color: _selectedTile == title
                  ? mainExpansionSelectedColor
                  : Colors.black)
          : null,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: _selectedTile == title
              ? mainExpansionSelectedColor
              : Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedPage = page;
          _selectedTile = title;
        });
      },
    );
  }

  Widget _buildSubListTile(String title, Widget page) {
    return ListTile(
      leading: const SizedBox(width: 40),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: _selectedTile == title ? Colors.blue[400] : Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedPage = page;
          _selectedTile = title;
        });
      },
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: const Center(child: Text("Dashboard")),
    );
  }
}
