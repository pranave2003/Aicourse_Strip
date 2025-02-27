import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bachelors_activities extends StatefulWidget {
  const Bachelors_activities({super.key});

  @override
  State<Bachelors_activities> createState() => _Bachelors_activitiesState();
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Bachelors_activities(),
    );
  }
}

class _Bachelors_activitiesState extends State<Bachelors_activities> {
  String? _selectedValue; // Selected value
  List<String> items = ['National  level representation',
    'State level','District level','inter school level','intra-school level'
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
                  Text("What is your most relevant level of \ninvolvement in extracurricular activities?",style: TextStyle(color: Color(0xff0A1F52),fontSize:20,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                  SizedBox(width: 10),
                  Text(
                    "Higher the level of representation better \n the impact on your profile.",
                    style: TextStyle(fontSize: 18),
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
                  print("object");
                },
                child: Container(
                  height: 51,
                  width: 231,
                  decoration: BoxDecoration(
                      color: Color(0xff0A71CB),
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


              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: "Percentage  %",
              //     hintStyle: TextStyle(color: Colors.black, fontSize: 18), // Adjust text style
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.black), // Bottom line color
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.black, width: 1.5), // Focused bottom line
              //     ),
              //   ),
              //   textAlign: TextAlign.center, // Centers the text
              //   style: TextStyle(color: Colors.black, fontSize: 18), // Input text style
              // )


              // DropdownButton<String>(
              //   value: _selectedValue,
              //   hint: Text('Select Board'),
              //   items: items.map((String item) {
              //     return DropdownMenuItem<String>(
              //       value: item,
              //       child: Text(item),
              //     );
              //   }).toList(),
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       _selectedValue = newValue;
              //     });
              //   },
              // ),
            ],
          ),
        ));
  }
}