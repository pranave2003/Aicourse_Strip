import 'package:flutter/material.dart';

void main() {
  runApp(FilterPage());
}

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Filter Options")),
        body: FilterScreen(),
      ),
    );
  }
}

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> countries = ["Canada", "USA", "UK", "Australia", "Germany", "Ireland", "Norway"];
  List<String> provinces = ["Ontario", "British Columbia", "Quebec", "Alberta", "Manitoba"];
  List<String> studyLevels = ["Doctorate", "Postgraduate", "Undergraduate", "Vocational (VET)"];
  List<String> rankings = ["01 - 199", "200 - 399", "400 - 599"];
  List<String> universityTypes = ["Public", "Private"];
  List<String> scholarships = ["\$0 - \$5,000", "\$5,000 - \$10,000", "\$10,000+"];

  String? selectedCountry;
  String? selectedProvince;
  String? selectedStudyLevel;
  String? selectedRanking;
  String? selectedUniversityType;
  String? selectedScholarship;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFilterSection("Country", countries, (val) => setState(() => selectedCountry = val)),
          buildFilterSection("State/Province", provinces, (val) => setState(() => selectedProvince = val)),
          buildFilterSection("Study Level", studyLevels, (val) => setState(() => selectedStudyLevel = val)),
          buildFilterSection("University Type", universityTypes, (val) => setState(() => selectedUniversityType = val)),
          buildFilterSection("Scholarship Amount", scholarships, (val) => setState(() => selectedScholarship = val)),
          buildFilterSection("Ranking", rankings, (val) => setState(() => selectedRanking = val)),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("Reset Filter", () {
                setState(() {
                  selectedCountry = selectedProvince = selectedStudyLevel = selectedRanking = selectedUniversityType = selectedScholarship = null;
                });
              }),
              buildButton("Apply Filter", () {
                // Apply filter logic here
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFilterSection(String title, List<String> options, Function(String) onSelect) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: options.map((option) => filterChip(option, onSelect)).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget filterChip(String label, Function(String) onSelect) {
    bool isSelected = selectedCountry == label || selectedProvince == label || selectedStudyLevel == label ||
        selectedRanking == label || selectedUniversityType == label || selectedScholarship == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Colors.blue,
      onSelected: (selected) {
        onSelect(label);
      },
    );
  }
}
