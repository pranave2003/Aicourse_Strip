import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Maters_academic extends StatefulWidget {
  const Maters_academic({super.key});

  @override
  State<Maters_academic> createState() => _Maters_academicState();
}

class _Maters_academicState extends State<Maters_academic> {
  int? selectedIndex; // Track selected container index
  String? selectedTest; // Selected test name
  final TextEditingController verbalScoreController = TextEditingController();
  final TextEditingController quantScoreController = TextEditingController();

  // List of English language tests
  final List<String> englishTests = ["GRE", "GMAT", "TEST NOT TAKEN"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back when tapped
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Which Academic test have you \n taken OR planning to take?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0A1F52),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded,
                    color: Colors.yellowAccent, size: 24),
                SizedBox(width: 10),
                Text(
                  "Scoring high in language tests \nincreases your options multifold.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Dynamically generated list of test options
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: englishTests.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedTest = englishTests[index];
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? const Color(0xff0A1F52) : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          englishTests[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            if (selectedTest == "GRE")
              Column(
                children: [
                  const Text(
                    "Enter Your GRE scores",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            controller: verbalScoreController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Verbal score",
                              hintStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                              ),
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 30),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            controller: quantScoreController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Quant score",
                              hintStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                              ),
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
         selectedTest == "GMAT"
    ? Column(
           children: [
             const Text(
               "Enter Your Score",
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
                 color: Colors.blue,
               ),
             ),
             SizedBox(height: 10,),
             Container(
               width: 200, // Adjust this value to control the underline length
               child: TextFormField(
                 decoration: InputDecoration(
                   hintText: "Score",
                   hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                   enabledBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color: Colors.black),
                   ),
                   focusedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color: Colors.black, width: 1.5),
                   ),
                 ),
                 textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.black, fontSize: 18),
               ),
             ),
           ],
         )

             : selectedTest == "TEST NOT TAKEN"
    ? Text("Test nOt taken")
        : Text(""),

            const SizedBox(height: 30),

            // Continue Button
            InkWell(
              onTap: () {
                print("Selected Test: $selectedTest");
                print("Verbal Score: ${verbalScoreController.text}");
                print("Quant Score: ${quantScoreController.text}");
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: const Color(0xff0A71CB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
