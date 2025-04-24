// import 'package:flutter/material.dart';
//
// class CountrySelectionPage extends StatefulWidget {
//   @override
//   _CountrySelectionPageState createState() => _CountrySelectionPageState();
// }
//
// class _CountrySelectionPageState extends State<CountrySelectionPage> {
//   bool isDropdownOpen = false;
//   List<String> selectedCountries = [];
//
//   final List<String> countries = [
//     "Science",
//     "Commerce",
//     "Humanities",
//     "VHSC",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Country Selector")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             /// Selected countries shown as chips
//             if (selectedCountries.isNotEmpty)
//               Wrap(
//                 spacing: 8,
//                 runSpacing: 8,
//                 children: selectedCountries.map((country) {
//                   return Chip(
//                     label: Text(country),
//                     deleteIcon: Icon(Icons.close),
//                     onDeleted: () {
//                       setState(() {
//                         selectedCountries.remove(country);
//                       });
//                     },
//                   );
//                 }).toList(),
//               ),
//
//             SizedBox(height: 20),
//
//             /// Dropdown container
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   isDropdownOpen = !isDropdownOpen;
//                 });
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /// Header Row
//                     Row(
//                       children: [
//                         Icon(Icons.public, color: Colors.black),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: Text(
//                             selectedCountries.isEmpty
//                                 ? "Select Countries"
//                                 : selectedCountries.join(", "),
//                             style:
//                                 TextStyle(fontSize: 16, color: Colors.black54),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Icon(Icons.arrow_drop_down)
//                       ],
//                     ),
//
//                     /// Dropdown List
//                     if (isDropdownOpen)
//                       Column(
//                         children: countries.map((country) {
//                           return CheckboxListTile(
//                             title: Text(country),
//                             value: selectedCountries.contains(country),
//                             onChanged: (bool? selected) {
//                               setState(() {
//                                 if (selected == true) {
//                                   if (!selectedCountries.contains(country)) {
//                                     selectedCountries.add(country);
//                                   }
//                                 } else {
//                                   selectedCountries.remove(country);
//                                 }
//                               });
//                             },
//                           );
//                         }).toList(),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CountrySelectionPage extends StatefulWidget {
  @override
  _CountrySelectionPageState createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  bool isDropdownOpen = false;
  List<String> selectedCountries = [];

  final List<String> countries = [
    "India",
    "USA",
    "Canada",
    "Germany",
    "Australia",
    "France",
    "Japan",
    "Brazil",
  ];

  Future<void> saveToFirestore() async {
    if (selectedCountries.isNotEmpty) {
      final model = SelectedCountriesModel(countries: selectedCountries);
      await FirebaseFirestore.instance.collection('test').add(model.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Saved to Firestore")),
      );

      setState(() {
        selectedCountries.clear(); // Optionally reset after save
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Country Selector")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Selected countries shown as chips
            if (selectedCountries.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: selectedCountries.map((country) {
                  return Chip(
                    label: Text(country),
                    deleteIcon: Icon(Icons.close),
                    onDeleted: () {
                      setState(() {
                        selectedCountries.remove(country);
                      });
                    },
                  );
                }).toList(),
              ),

            SizedBox(height: 20),

            /// Dropdown container
            GestureDetector(
              onTap: () {
                setState(() {
                  isDropdownOpen = !isDropdownOpen;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.public, color: Colors.black),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            selectedCountries.isEmpty
                                ? "Select Countries"
                                : selectedCountries.join(", "),
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),

                    // Column(
                    //   children: countries.map((country) {
                    //     return CheckboxListTile(
                    //       title: Text(country),
                    //       value: selectedCountries.contains(country),
                    //       onChanged: (bool? selected) {
                    //         setState(() {
                    //           if (selected == true) {
                    //             selectedCountries.add(country);
                    //           } else {
                    //             selectedCountries.remove(country);
                    //           }
                    //         });
                    //       },
                    //     );
                    //   }).toList(),
                    // ),
                    if (isDropdownOpen)
                      Column(
                        children: [
                          /// Select All Checkbox
                          CheckboxListTile(
                            title: Text("Select All"),
                            value: selectedCountries.length == countries.length,
                            onChanged: (bool? selected) {
                              setState(() {
                                if (selected == true) {
                                  selectedCountries = List.from(countries);
                                } else {
                                  selectedCountries.clear();
                                }
                              });
                            },
                          ),

                          /// Country List Checkboxes
                          ...countries.map((country) {
                            return CheckboxListTile(
                              title: Text(country),
                              value: selectedCountries.contains(country),
                              onChanged: (bool? selected) {
                                setState(() {
                                  if (selected == true) {
                                    if (!selectedCountries.contains(country)) {
                                      selectedCountries.add(country);
                                    }
                                  } else {
                                    selectedCountries.remove(country);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ],
                      ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            /// Save button
            ElevatedButton(
              onPressed: saveToFirestore,
              child: Text("Save to Firestore"),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedCountriesModel {
  final List<String> countries;

  SelectedCountriesModel({required this.countries});

  Map<String, dynamic> toJson() {
    return {
      'countries': countries,
      'timestamp': DateTime.now(), // optional for ordering
    };
  }
}
