import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/Degree.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';

class ChooseCountry extends StatefulWidget {
  const ChooseCountry({super.key});

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  int? selectedIndex; // Track selected grid item index
  String? selectedcountry;

  final List<Map<String, String>> category = [
    {"name": "United States ", "image": "assets/Country/img_1.png"},
    {"name": "United Kingdom ", "image": "assets/Country/img.png"},
    {"name": "Australia", "image": "assets/Country/img_2.png"},
    {"name": "Canada", "image": "assets/Country/img_3.png"},
    {"name": "Europe", "image": "assets/Country/img_5.png"},
    {"name": "India", "image": "assets/Country/img_4.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/country/img_6.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: Center(
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50), //
                // Top spacing
                Text("Which country do you wish to \n  pursue your education in?",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0A1F52))),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    scrollDirection:
                        Axis.vertical, // Changed to vertical for better UX
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200, // Adjust for responsiveness
                      childAspectRatio: 0.9, // Height/Width ratio
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index; // Update selected index
                            selectedcountry = category[index]["name"];
                            print(selectedcountry);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: isSelected
                                  ? Color(0xff085AA2)
                                  : Colors.transparent,
                              width: 3,
                            ),
                            color: isSelected
                                ? Color(0xff085AA2)
                                : Color(0xffE4E4E4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                child: Container(
                                  height: 50,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image:
                                          AssetImage(category[index]["image"]!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                category[index]["name"]!,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),


                // SizedBox(height: 3),
                // InkWell(
                //   onTap: (
                //   {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => Degree(),
                //       ),
                //     );
                //   },
                //   ) {
                // print("object");
                //   },
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Degree(),
                  ),
                );
                print("object");
              },
              child: Container(
              height: 51,
              width: 231,
              decoration: BoxDecoration(
                  color:blueColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            ),

        ],


            ),
          ),
        ),
      ),
    );
  }
}
