
import 'package:course_connect/User/Accomodation/PropertyDetailsPage.dart';
import 'package:flutter/material.dart';
import 'PropertyDetailsPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AccommodationDetailScreen(),
  ));
}

class AccommodationDetailScreen extends StatefulWidget {
  const AccommodationDetailScreen({super.key});

  @override
  State<AccommodationDetailScreen> createState() => _AccommodationDetailScreenState();
}

class _AccommodationDetailScreenState extends State<AccommodationDetailScreen> {
  List<Map<String, dynamic>> serviceList = [
    {
      "icon": "assets/img_9.png",
      "name": "Portchester \n House",
      "surname": "New Jersey, USA",
      "screen": PropertyDetailsPage(),
    },
    {
      "icon": "assets/img_10.png",
      "name": "Wine Line \n House",
      "surname": "Massachusetts, USA",
      "screen": PropertyDetailsPage(),
    },
    {
      "icon": "assets/img_11.png",
      "name": "Stubs \n House",
      "surname": "Massachusetts, USA",
      "screen": PropertyDetailsPage(),
    },
    {
      "icon": "assets/img_12.png",
      "name": "Paddock \n House",
      "surname": "Massachusetts, USA",
      "screen": PropertyDetailsPage(),
    },
    {
      "icon": "assets/img_13.png",
      "name": "Victoria \n House",
      "surname": "Massachusetts, USA",
      "screen": PropertyDetailsPage(),
    },
    {
      "icon": "assets/img_9.png",
      "name": "Harvard \n House",
      "surname": "Massachusetts, USA",
      "screen": PropertyDetailsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Text(
          "Finding Perfect Home for You",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search by university or property",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Student housing near Yale University",
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: serviceList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => serviceList[index]["screen"]),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        ClipRRect(
                          child: Image.asset(
                            serviceList[index]["icon"].toString(),
                            height: 140,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            serviceList[index]["name"].toString(),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            serviceList[index]["surname"].toString(),
                            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
