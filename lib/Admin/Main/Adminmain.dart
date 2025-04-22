import 'package:course_connect/Admin/View/Screens/ApplicationView/ViewApplications.dart';
import 'package:course_connect/Admin/View/Screens/Auth/AdminLogin.dart';
import 'package:course_connect/Admin/View/Screens/Feedback/FeedbackView.dart';
import 'package:course_connect/Controller/Bloc/Applycourse/application_bloc.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_block.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:course_connect/Admin/View/Screens/Landlord/New_Landlords.dart';
import 'package:course_connect/Admin/View/Screens/University/AddUniversity.dart';
import 'package:course_connect/Admin/View/Screens/University/Universitymain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Controller/Bloc/Dropdown_university/CollagemasterBloc/collagedropdown_bloc.dart';
import '../../Controller/Bloc/Dropdown_university/dropdown_bloc.dart';
import '../../Controller/Bloc/Landloard_auth/landloard_auth_bloc.dart';
import '../../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import '../../firebase_options.dart';
import '../View/Screens/University/AddUniversityname.dart';
import '../View/Screens/University/Addcollage.dart';
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
        BlocProvider<ApplicationBloc>(
          create: (context) =>
              ApplicationBloc()..add(FetchApplication(searchQuery: null)),
        ),
        BlocProvider<PropertyAuthBlock>(
          create: (context) =>
              PropertyAuthBlock()..add(FetchProperty(searchQuery: null)),
        ),
        BlocProvider<DropdownBloc>(
          create: (context) => DropdownBloc()..add(Fetchcatcollagebydropdown()),
        ),
        BlocProvider<CollagedropdownBloc>(
            create: (context) => CollagedropdownBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Course Connect Admin',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AdminPage();
            } else {
              return Adminlogin();
            }
          },
        ),
      ),
    );
  }
}

//dashboard

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
                  title: 'Courses',
                  icon: Icons.school_outlined,
                  children: [
                    _buildSubListTile("View Courses", Universitymainwrapper()),
                    _buildSubListTile("Add Courses", Fetchcolladropdowrapper()),
                    _buildSubListTile("Add Collage", Addcollage()),
                    _buildSubListTile("Add University's", Adduniversitywrapper()),
                    // _buildSubListTile("Edit Courses", EditUniversity(universityname: '', universityid: '', Collegename: '', Collegecode: '',  highestEducationpercentage: '', establishedDate: '', admissionEndDate: '', Admission_startdate: '', Terms_and_conditions: '', scholarshipFee: '', courseFee: '', Discription: '', AcadamicTest: '', AcadamicTestPercentage: '', highestEducation: '', Englishtest: '', Englishtestpercentage: '', )),
                  ],
                ),

                _buildMainExpansionTile(
                  title: 'Landlord',
                  icon: Icons.people_alt_outlined,
                  children: [
                    _buildSubListTile("New Landlords", Landlord()),
                  ],
                ),
                _buildMainListTile(
                    'Applications', Viewapplicationsmainwrapper(),
                    icon: Icons.book_online),
                _buildMainListTile('Houses', ViewHouses(),
                    icon: Icons.maps_home_work_outlined),
                _buildMainListTile('Payment', PaymentView(),
                    icon: Icons.payments_outlined),
                _buildMainListTile('Users', Userview(),
                    icon: Icons.supervised_user_circle_sharp),
                _buildMainListTile('Feedback', FeedbackView(),
                    icon: Icons.feedback),
                // _buildMainListTile('Knowledge Bank', CountryRules(),
                //     icon: Icons.my_library_books_rounded),
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
    return MaterialApp(
      title: 'Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      ),
      home: const AdminDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      Text("Admin, ",
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 0.5, color: Colors.grey),
                      ),
                      child: Row(
                        children: const [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                AssetImage('assets/Profile/img_4.png'),
                          ),
                          SizedBox(width: 10),
                          Text("Admin",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                SummaryCard(
                  title: 'Total Universities',
                  value: '12',
                  icon: Icons.account_balance,
                  color: Colors.indigo,
                ),
                SummaryCard(
                  title: 'Total Colleges',
                  value: '45',
                  icon: Icons.school,
                  color: Colors.deepPurple,
                ),
                SummaryCard(
                  title: 'Total Users',
                  value: '1080',
                  icon: Icons.people,
                  color: Colors.green,
                ),
                SummaryCard(
                  title: 'Total Landlords',
                  value: '56',
                  icon: Icons.person_pin,
                  color: Colors.blue,
                ),
                SummaryCard(
                  title: 'Payments Received',
                  value: '\$96,430',
                  icon: Icons.payment,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Admin Functionalities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            // Wrap(
            //   spacing: 16,
            //   runSpacing: 16,
            //   children: const [
            //     AdminTile(title: 'University Management', icon: Icons.account_balance),
            //     AdminTile(title: 'Course Management', icon: Icons.book),
            //     AdminTile(title: 'Document Verification', icon: Icons.verified_user),
            //     AdminTile(title: 'Manage Landlords', icon: Icons.people_alt),
            //     AdminTile(title: 'View Houses', icon: Icons.home_work),
            //     AdminTile(title: 'Approved Landlords', icon: Icons.verified),
            //     AdminTile(title: 'Payment Status', icon: Icons.payments),
            //     AdminTile(title: 'Manage Users', icon: Icons.supervised_user_circle),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.85), color.withOpacity(0.65)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black26,
                  offset: Offset(1, 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class AdminTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const AdminTile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Clicked on $title')),
        );
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
