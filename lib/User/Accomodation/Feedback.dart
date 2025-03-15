import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Feedback());
}

class Feedback extends StatelessWidget {
  const Feedback({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedbackScreen(),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

            automaticallyImplyLeading:false,
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
          // icon: const Icon(Icons.arrow_back, color: Colors.black),
          // onPressed: () {},
        // ),
        // title: const Text(
        //   "Feedback",
        //   style: TextStyle(color: Colors.black),
        // ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/img_14.png', height: 200),
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
              "Give us your  feedback",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                starIcon(true),
                starIcon(true),
                starIcon(true),
                starIcon(true),
                starIcon(false),
              ],
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
                color: Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Please write here",
                  border: InputBorder.none,
                ),
                maxLines: 4,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {},
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
            ),
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

  Widget starIcon(bool isFilled) {
    return Icon(
      isFilled ? Icons.star : Icons.star_border,
      color: Colors.orange,
      size: 28,
    );
  }
}
