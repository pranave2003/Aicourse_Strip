import 'package:course_connect/User/Ai_course_finder/MBA_DetailsOverall.dart';
import 'package:course_connect/User/Ai_course_finder/MBA_work.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MBA_companytype extends StatefulWidget {
  const MBA_companytype({super.key});

  @override
  State<MBA_companytype> createState() => _MBA_companytypeState();
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MBA_companytype(),
    );
  }
}

class _MBA_companytypeState extends State<MBA_companytype> {
  String? _selectedValue; // Selected value
  List<String> items = ["Educational institution",
    "Government agency",
    "Non-profit",
    "Public company",
    "MNC/fortune 500 company",
    "Technology startup",
    "PE/VC",
    "Small Business"
  ];
  int selectedIndex = -1; // Track selected container index
  String? seletedEducation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back when tapped
          },
        ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/country/img_6.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Select the type of company where \nyou have the most significant work \nexperience",style: TextStyle(color: Color(0xff0A1F52),fontSize:20,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                  SizedBox(width: 10),
                  Text(
                    "Having significant work   experience \n increases your options multi-fold",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height:10),


              SizedBox(height:20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey, // Change button color to grey
                  borderRadius: BorderRadius.circular(20), // Optional: Rounded corners
                ),
                padding: EdgeInsets.symmetric(horizontal: 40), // Adds padding
                child: DropdownButton<String>(
                  value: _selectedValue,
                  hint: Text('Select from list'),
                  dropdownColor: Colors.grey[300], // Dropdown menu color
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                  underline: SizedBox(), // Removes the default underline
                ),
              ),

              SizedBox(height: 390
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MBA_work(),
                    ),
                  );
                },

                child: Container(
                  height: 51,
                  width: 231,
                  decoration: BoxDecoration(
                      color: blueColor,
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
              )



            ],
          ),
        ));
  }
}
















