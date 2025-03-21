import 'package:course_connect/Admin/View/Screens/Feedback/FeedbackView.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:course_connect/Admin/View/Screens/Courses/Addcourses.dart';
import 'package:course_connect/Admin/View/Screens/Courses/Courses.dart';
import 'package:course_connect/Admin/View/Screens/Courses/Editcourses.dart';
import 'package:course_connect/Admin/View/Screens/KnowledgeBank/CountryRules.dart';
import 'package:course_connect/Admin/View/Screens/Landlord/New_Landlords.dart';
import 'package:course_connect/Admin/View/Screens/University/AddUniversity.dart';
import 'package:course_connect/Admin/View/Screens/University/EditUniversity.dart';
import 'package:course_connect/Admin/View/Screens/University/Universitymain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import '../../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import '../../firebase_options.dart';
import '../View/Screens/House.dart/ViewHouses.dart';
import '../View/Screens/Payment.dart/Payment_View.dart';
import '../View/Screens/Users.dart/UserView.dart';

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
          create: (context) => AuthBloc()..add(FetchUsers(searchQuery: null)),
        ),
        BlocProvider<LandloardAuthBloc>(
          create: (context) => LandloardAuthBloc()
            ..add(FetchLandloards(searchQuery: null, status: "0")),
        ),
        BlocProvider<UniversityBloc>(create: (context) => UniversityBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Course Connect Admin',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AdminPage(),
      ),
    );
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Widget? _selectedPage;
  String? _selectedTile;
  String? _expandedTile;
  final Color mainExpansionSelectedColor = Colors.blue;
  final Color subExpansionSelectedColor = Colors.pink;
  @override
  void initState() {
    _selectedPage = Dashboard();
    _selectedTile = "Dashboard";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Sidebar Navigation
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
                const SizedBox(height: 50),
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
                  title: 'Universities',
                  icon: Icons.school_outlined,
                  children: [
                    _buildSubListTile("View University", University_main()),
                    _buildSubListTile("Add University", AddUniversity()),
                    _buildSubListTile("Edit University", EditUniversity()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Courses',
                  icon: Icons.book_outlined,
                  children: [
                    _buildSubListTile("View Courses", Courses_main()),
                    _buildSubListTile("Add Course", Addcourses()),
                    _buildSubListTile("Edit Course", Editcourses()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Landlord',
                  icon: Icons.people_alt_outlined,
                  children: [
                    _buildSubListTile("New Landlords", Landlord()),
                  ],
                ),
                _buildMainListTile('Houses', ViewHouses(),
                    icon: Icons.maps_home_work_outlined),
                _buildMainListTile('Payment', PaymentView(),
                    icon: Icons.payments_outlined),
                _buildMainListTile('Users', Userview(),
                    icon: Icons.supervised_user_circle_sharp),
                _buildMainListTile('Feedback', FeedbackView(),
                    icon: Icons.feedback),
                _buildMainListTile('Knowledge Bank', CountryRules(),
                    icon: Icons.my_library_books_rounded),
                _buildMainExpansionTile(
                  title: 'Account',
                  icon: Icons.person,
                  children: [
                    // SubListTile("Account", FeedbackView()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Settings',
                  icon: Icons.settings,
                  children: [
                    // SubListTile("Account", FeedbackView()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Log Out',
                  icon: Icons.login_outlined,
                  children: [
                    // SubListTile("Account", FeedbackView()),
                  ],
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
    var mainExpansionSelectedColor;
    var _expandedTile;
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
    var mainExpansionSelectedColor = blueColor;
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
