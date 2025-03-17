import 'package:flutter/material.dart';

class Universities extends StatefulWidget {
  const Universities({super.key});

  @override
  State<Universities> createState() => _UniversitiesState();
}

class _UniversitiesState extends State<Universities> {
  List<Map<String, dynamic>> serviceList = [

      {
        "icon": "assets/img_2.png",
        "name": "Harvard \n University",
        "surname": "Massachusetts,USA"
      }, {
      "icon": "assets/img_15.png",
      "name": "Stanford \n University",
      "surname": "Stanford, California"
    }, {
      "icon": "assets/img_16.png",
      "name":" Chicago	\n University",
      "surname": "Massachusetts,USA"
    },  {
      "icon": "assets/img_19.png",
      "name": "Yale \n University",
      "surname": "United States"
    },
  ];
  List<Map<String, dynamic>> serviceList2 = [
    {
      "icon2": "assets/img_2.png",
      "name2": "Harward \n University",
      "surname2": "Massachusetts,USA"
    }, {
      "icon2": "assets/img_2.png",
      "name2": "Harward \n University",
      "surname2": "Massachusetts,USA"
    }, {
      "icon2": "assets/img_2.png",
      "name2": "Harward \n University",
      "surname2": "Massachusetts,USA"
    }, {
      "icon2": "assets/img_2.png",
      "name2": "Harward \n University",
      "surname2": "Massachusetts,USA"
    }, {
      "icon2": "assets/img_2.png",
      "name2": "Harward \n University",
      "surname2": "Massachusetts,USA"
    }, {
      "icon2": "assets/img_2.png",
      "name2": "Harward \n University",
      "surname2": "Massachusetts,USA"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        // backgroundColor: Colors.yellowAccent,
        toolbarHeight: 80,
        title: Text(
        "Explore Destination",
        style: TextStyle(
        color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    ),
    ),
        ),
    body: Padding(
    padding: const EdgeInsets.all(10),
    child: ListView(
    // mainAxisAlignment: MainAxisAlignment.center,
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Expanded(
    flex: 5,
    child: TextFormField(
    decoration: InputDecoration(
    hintText: "search university or course",
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
    borderSide:
    BorderSide(width: 1, color: Colors.black))),
    ),
    ),
    ],
    ),
      SizedBox(height:20),
      Text("Top Universities in United states",style: TextStyle(color:Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
      Row(
        children: [
          Expanded(
            child: GridView.builder(
              physics:
              NeverScrollableScrollPhysics(), // Prevents extra scrolling
              shrinkWrap: true,
              padding:
              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 10, // Space between columns
                mainAxisSpacing: 10, // Space between rows
                childAspectRatio: 0.75, // Adjusted for better image fit
              ),
              itemCount: serviceList.length,
              itemBuilder: (context, index) {
                return Container(
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
                        // borderRadius: BorderRadius.circular(10),
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
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      SizedBox(height: 4),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            serviceList[index]["surname"].toString(),
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[700]),
                            textAlign: TextAlign.left,
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      SizedBox(height:20),
      Text("Top Universities in United Kingdom",style: TextStyle(color:Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
      Row(
        children: [
          Expanded(
            child: GridView.builder(
              physics:
              NeverScrollableScrollPhysics(), // Prevents extra scrolling
              shrinkWrap: true,
              padding:
              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 10, // Space between columns
                mainAxisSpacing: 10, // Space between rows
                childAspectRatio: 0.75, // Adjusted for better image fit
              ),
              itemCount: serviceList2.length,
              itemBuilder: (context, index) {
                return Container(
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
                        // borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          serviceList2[index]["icon2"].toString(),
                          height: 140,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            serviceList2[index]["name2"].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      SizedBox(height: 4),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            serviceList2[index]["surname2"].toString(),
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[700]),
                            textAlign: TextAlign.left,
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )
    ],
    ),
    ),
    );
  }
}
