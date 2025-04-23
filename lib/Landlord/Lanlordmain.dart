import 'package:course_connect/Controller/Bloc/Booking/BookingAuthEvent.dart';
import 'package:course_connect/Controller/Bloc/Booking/Booking_authblock.dart';
import 'package:course_connect/Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:course_connect/Landlord/Views/Screens/ProfileLandlord/LandlordProfile.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:course_connect/Landlord/Views/Screens/Bookings/AllBookings.dart';
import 'package:course_connect/Landlord/Views/Screens/Payments/ViewPayment.dart';
import 'package:course_connect/Landlord/Views/Screens/Property/Property.dart';
import 'package:course_connect/Landlord/Views/Screens/Property/PropertyAdd.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Controller/Bloc/Dropdown_university/dropdown_bloc.dart';
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
            ..add(
              FetchBookings(searchQuery: null),
            ),
        ),
        BlocProvider<PropertyAuthBlock>(
          create: (context) => PropertyAuthBlock(),
        ),
        BlocProvider<DropdownBloc>(
          create: (context) => DropdownBloc()..add(Fetchcatogorybydropdown()),
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
                // _buildMainListTile('Payment', ViewPayment(),
                //     icon: Icons.payments_outlined),
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
//dashboard

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: const [
                    Text("Welcome ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Landlord, ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0A71CB))),
                  ],
                ),
              ),
              Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      child: Icon(Icons.notification_add)),
                  const SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.5, color: Colors.grey),
                    ),
                    child: Row(
                      children: const [
                        // CircleAvatar(
                        //   radius: 20,
                        //   backgroundColor: Colors.grey,
                        //   backgroundImage:
                        //       AssetImage('assets/Profile/img_3.png'),
                        // ),
                        SizedBox(width: 10),
                        Text("Landlord",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              SummaryCard(title: 'Total Houses Listed', value: '34'),
              SummaryCard(title: 'Total Bookings', value: '128'),
              SummaryCard(title: 'Approved Bookings', value: '87'),
              SummaryCard(title: 'Payments Received', value: '\$12,540'),
              SummaryCard(title: 'Total Users', value: '256'),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Landlord Info',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          BlocBuilder<LandloardAuthBloc, LandloardAuthState>(
            builder: (context, state) {
              if (state is Landlordloading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LandlordByidLoaded) {
                final user = state.Userdata;
                TextEditingController nameController =
                    TextEditingController(text: user.name ?? '');
                TextEditingController emailController =
                    TextEditingController(text: user.email ?? '');
                TextEditingController addressController =
                    TextEditingController(text: user.Adress ?? '');

                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/profile/img_4.png'),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        user.name ?? '',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'I\'m a freelance landlord managing real estate assets.',
                        style: TextStyle(color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 20,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          buildInputField(Icons.person, '${user.name ?? ''}',
                              nameController),
                          buildInputField(Icons.email, '${user.email ?? ''}',
                              emailController),
                          buildInputField(Icons.home, '${user.Adress ?? ''}',
                              addressController),
                          SizedBox(height: 30), // Adjust space at the bottom
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blueColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 32),
          const Text('Recent Bookings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const BookingTile(
              name: 'John Doe',
              property: 'Green Villa',
              date: 'Apr 18',
              status: 'Confirmed',
              payment: 'Paid'),
          const BookingTile(
              name: 'Jane Smith',
              property: 'Ocean View',
              date: 'Apr 17',
              status: 'Pending',
              payment: 'Unpaid'),
        ],
      ),
    );
  }

  Widget landlordStat(IconData icon, String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: blueColor, size: 20),
        ),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }
}

// Static input fields without editing capability
Widget buildInputField(
    IconData icon, String title, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 12.0), // Increased padding for better spacing
    child: TextField(
      controller: controller,
      enabled: false, // Disable editing
      style: TextStyle(fontSize: 16), // Ensure text is readable
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: blueColor),
        labelText: title,
        labelStyle: TextStyle(fontSize: 16), // Ensure label text is clear
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: blueColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: blueColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: blueColor.withOpacity(0.5), width: 1),
        ),
      ),
    ),
  );
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 140,
        maxWidth: 180,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class BookingTile extends StatelessWidget {
  final String name;
  final String property;
  final String date;
  final String status;
  final String payment;

  const BookingTile({
    super.key,
    required this.name,
    required this.property,
    required this.date,
    required this.status,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: const CircleAvatar(
          backgroundColor: blueColor,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$property • $date'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(status,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color:
                        status == 'Confirmed' ? Colors.green : Colors.orange)),
            Text(payment,
                style: TextStyle(
                    color:
                        payment == 'Paid' ? Colors.green : Colors.redAccent)),
          ],
        ),
      ),
    );
  }
}
