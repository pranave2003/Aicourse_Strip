import 'package:course_connect/User/Sreens/Home/homepage.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SuccessScreen(),
  ));
}

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 60,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Congratulations",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Your application to Toronto University is successful. You will get a notification after the confirmation.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 220),
              SizedBox(
                width: 350,
                height: 50,
                // child: ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(25),
                //     ),
                //   ),
                //   onPressed: () {
                //     // Navigate to home screen
                //   },
                //   child: Text(
                //     "Go to Home",
                //     style: TextStyle(fontSize: 18, color: Colors.white),
                //   ),
                // ),
                child:InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ),
                    );

                  },
                  child: Container(
                    height: 51,
                    width: 231,
                    decoration: BoxDecoration(
                        color:blueColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                          "Go to Home",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
