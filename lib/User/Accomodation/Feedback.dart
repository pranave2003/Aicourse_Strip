import 'package:course_connect/Controller/Bloc/Applycourse/application_bloc.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_block.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_auth_state.dart';
import 'package:course_connect/User/Sreens/BottomNavigation/Bottom_nav2.dart';
import 'package:course_connect/User/Sreens/Home/homepage.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Widget/Constands/Loading.dart';


class FeedbackApp extends StatelessWidget {
  final String propertyId;
  const FeedbackApp({super.key, required this.propertyId});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedbackScreen(id: propertyId),
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key, required this.id});
  final dynamic id;

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String rating = "0";
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/img_6.png', height: 200),
            const SizedBox(height: 10),
            const Text(
              "Share Your Feedback",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Please select a topic below and let’s us\nknow about your concern",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                emojiIcon(Icons.sentiment_dissatisfied),
                emojiIcon(Icons.sentiment_neutral),
                emojiIcon(Icons.sentiment_satisfied),
                emojiIcon(Icons.sentiment_very_satisfied),
                emojiIcon(Icons.favorite, isSelected: true),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Give us your house feedback",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      rating = (index + 1).toString();
                    });
                  },
                  icon: Icon(
                    int.parse(rating) > index
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.amber,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Write your feedback (Optional)",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: feedbackController,
                decoration: const InputDecoration(
                  hintText: "Please write here",
                  border: InputBorder.none,
                ),
                maxLines: 4,
              ),
            ),
            const SizedBox(height: 30),
            BlocConsumer<PropertyAuthBlock, PropertyAuthState>(
              listener: (context, state) {
                if (state is UserSendreviewandratingSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>HomepageWrapper(),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (rating == "0") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please give a star rating."),
                        ),
                      );
                      return;
                    }

                    context.read<PropertyAuthBlock>().add(
                      UserSendreviewandratingevent(
                        id: widget.id,
                        Review: feedbackController.text,
                        Ratingstatus: rating,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: state is UserSendreviewandratingloading
                      ? const Loading_Widget()
                      : const Text(
                    "Submit",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget emojiIcon(IconData icon, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        child: Icon(icon, color: isSelected ? Colors.white : Colors.orange),
      ),
    );
  }
}
