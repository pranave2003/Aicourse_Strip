import 'package:flutter/material.dart';

class UniversityInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('University', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/University_of_Toronto_Soldiers%27_Tower.JPG/800px-University_of_Toronto_Soldiers%27_Tower.JPG',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'University Of Toronto',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Toronto, Canada',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'The University of Toronto is a public research university in Toronto, Ontario, Canada. It was founded by royal charter in 1827 as King\'s College.',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     _infoIcon(FontAwesomeIcons.university, 'Public'),
                  //     _infoIcon(FontAwesomeIcons.globe, 'QS 26'),
                  //     _infoIcon(FontAwesomeIcons.graduationCap, 'Est. 1827'),
                  //     _infoIcon(FontAwesomeIcons.dollarSign, 'Avg. Cost'),
                  //   ],
                  // ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Apply Now', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 16),
                  _infoSection('Admission', [
                    'Start Date: 21 June 2024',
                    'Application Due: 14 August 2024'
                  ]),
                  _infoSection('Tuition Fees', [
                    'Master\'s degree: CAD 65,078.63',
                    'Master\'s average: CAD 52.8k'
                  ]),
                  _infoSection('Scholarships', [
                    'Lester B. Pearson International Scholarships',
                    'Other: \$10,000 in the first year and \$5,000 for each year'
                  ]),
                  _infoSection('Eligibility', [
                    'IELTS Overall Score: 6.5'
                  ]),
                  _infoSection('Terms and Conditions', [
                    'To study in Canada, you need a study permit, which acts as a student visa. Proof of admission, financial support, and a clean background check are required.'
                  ]),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('I agree with the terms and conditions', style: TextStyle(color: Colors.white70))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.blue),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.white70))
      ],
    );
  }

  Widget _infoSection(String title, List<String> details) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ...details.map((detail) => Text(detail, style: TextStyle(fontSize: 14, color: Colors.white70))),
        ],
      ),
    );
  }
}