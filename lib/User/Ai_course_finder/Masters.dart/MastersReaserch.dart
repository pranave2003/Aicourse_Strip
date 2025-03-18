
import 'package:course_connect/User/Ai_course_finder/Masters.dart/MatersDetailsOverall.dart';
import 'package:flutter/material.dart';

class MastersResearch extends StatefulWidget {
  const MastersResearch({super.key});

  @override
  State<MastersResearch> createState() => _MastersResearchState();
}

class _MastersResearchState extends State<MastersResearch> {
  String? selectedOption;
  String? selectedJournal;
  bool showTooltipIndexed = false;
  bool showTooltipNonIndexed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/country/img_6.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Have you published any research paper?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0A1F52),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ["Yes", "No"].map((option) {
                  bool isSelected = selectedOption == option;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isSelected ? const Color(0xff0A1F52) : Colors.grey[300],
                        foregroundColor: isSelected ? Colors.white : Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedOption = option;
                          selectedJournal = null;
                        });
                      },
                      child: Text(option, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              if (selectedOption == "Yes") ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildJournalSelection("In an indexed journal", "Indexed", showTooltipIndexed, () {
                      setState(() {
                        showTooltipIndexed = !showTooltipIndexed;
                      });
                    }),
                    const SizedBox(height: 40),
                    _buildJournalSelection("In a non-indexed journal", "Non-Indexed", showTooltipNonIndexed, () {
                      setState(() {
                        showTooltipNonIndexed = !showTooltipNonIndexed;
                      });
                    }),
                  ],
                ),
              ],
              const Spacer(),
              InkWell(
                onTap: () {
                  if (selectedOption == "Yes" && selectedJournal == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select Indexed or Non-Indexed Journal.")),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MastersDetailsOverall()),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJournalSelection(String text, String value, bool showTooltip, VoidCallback onTapIcon) {
    bool isSelected = selectedJournal == value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.blue : Colors.blue[100],
                  foregroundColor: isSelected ? Colors.white : Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    selectedJournal = value;
                  });
                },
                child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: onTapIcon,
              child: const Icon(Icons.info_outline, size: 24, color: Colors.blue),
            ),
          ],
        ),
        if (showTooltip)
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value == "Indexed"
                  ? "An indexed journal is included in major academic databases like Scopus or Web of Science."
                  : "A non-indexed journal is not listed in major academic databases.",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
      ],
    );
  }
}

