// import 'package:flutter/material.dart';
//
// class Userview extends StatefulWidget {
//   const Userview({super.key});
//
//   @override
//   State<Userview> createState() => _UserviewState();
// }
//
// class _UserviewState extends State<Userview> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 25),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Welcome ",
//                       style:
//                       TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       "Admin, ",
//                       style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xff0A71CB)),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
//                   SizedBox(width: 10),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(width: 0.5, color: Colors.grey),
//                     ),
//                     child: Row(
//                       children: [
//                         const CircleAvatar(
//                           radius: 20, // Ensure a proper radius is set
//                           backgroundColor: Colors.grey, // Fallback color
//                           backgroundImage: AssetImage('assets/Profile/img.png'), // Corrected Path
//                         ),
//                         const SizedBox(width: 10),
//                         const Text(
//                           "Admin",
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           Padding(
//             padding: const EdgeInsets.only(left: 25),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "User View Page",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: DataTable(
//                   headingRowColor: MaterialStateColor.resolveWith(
//                           (states) => Colors.grey.shade300),
//                   columnSpacing: 40,
//                   dataRowMaxHeight: 70,
//                   decoration: BoxDecoration(color: Colors.white),
//                   columns: [
//                     _buildColumn('S/no'),
//                     _buildColumn('Name'),
//                     _buildColumn('Phone number'),
//                     _buildColumn('Email'),
//                     _buildColumn('Country'),
//                     _buildColumn('State'),
//                     _buildColumn('District'),
//                     _buildColumn('Street'),
//                     _buildColumn('Action'),
//                   ],
//                   rows: [
//                     _buildRow("1"),
//                     _buildRow2("2"),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   DataColumn _buildColumn(String title) {
//     return DataColumn(
//       label: Text(
//         title,
//         style: TextStyle(
//             color: Colors.grey.shade900,
//             fontWeight: FontWeight.bold,
//             fontSize: 16),
//       ),
//     );
//   }
//
//   DataRow _buildRow(String index) {
//     return DataRow(
//       cells: [
//         DataCell(Text(index)), // S/no
//         DataCell(Text("John Doe")), // Name
//         DataCell(Text("+1 123-456-7890")), // Phone number
//         DataCell(Text("johndoe@example.com")), // Email
//         DataCell(Text("United States")), // Country
//         DataCell(Text("California")), // State
//         DataCell(Text("Los Angeles")), // District
//         DataCell(Text("123 Baker Street")), // Street
//         DataCell(Row(
//           children: [
//             SizedBox(width: 10), // Space between buttons
//             IconButton(
//               icon: Icon(Icons.delete, color: Colors.red, size: 30), // Increase icon size
//               onPressed: () {
//                 _showDeleteConfirmationDialog(context, index);
//               },
//               constraints: BoxConstraints(
//                 minWidth: 50, // Adjust width
//                 minHeight: 50, // Adjust height
//               ),
//             )
//
//           ],
//         )), // Action
//       ],
//     );
//   }
//
//   DataRow _buildRow2(String index) {
//     return DataRow(
//       cells: [
//         DataCell(Text(index)), // S/no
//         DataCell(Text("Devid John")), // Name
//         DataCell(Text("+44 987-654-3210")), // Phone number
//         DataCell(Text("devid@example.com")), // Email
//         DataCell(Text("United Kingdom")), // Country
//         DataCell(Text("London")), // State
//         DataCell(Text("Westminster")), // District
//         DataCell(Text("456 Oxford Street")), // Street
//         DataCell(Row(
//           children: [
//             SizedBox(width: 10), // Space between buttons
//             // IconButton(
//             //   icon: Icon(Icons.delete, color: Colors.red,weight:20,),
//             //   onPressed: () {
//             //     _showDeleteConfirmationDialog(context, index);
//             //   },
//             // ),
//             IconButton(
//               icon: Icon(Icons.delete, color: Colors.red, size: 30), // Increase icon size
//               onPressed: () {
//                 _showDeleteConfirmationDialog(context, index);
//               },
//               constraints: BoxConstraints(
//                 minWidth: 50, // Adjust width
//                 minHeight: 50, // Adjust height
//               ),
//             )
//
//           ],
//         )), // Action
//       ],
//     );
//   }
//
//   void _showDeleteConfirmationDialog(BuildContext context, String index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Confirm Deletion"),
//           content: Text("Are you sure you want to delete this user?"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text("Cancel"),
//             ),
//             TextButton(
//               onPressed: () {
//                 print("User $index deleted"); // Perform delete action
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text("Delete", style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
//
//
//
import 'package:course_connect/Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widget/Constands/Loading.dart';

class Userview extends StatefulWidget {
  const Userview({super.key});

  @override
  State<Userview> createState() => _UserviewState();
}

class _UserviewState extends State<Userview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      "Welcome ",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Admin, ",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0A71CB)),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      child: Icon(Icons.notification_add)),
                  SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.5, color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage('assets/Profile/img.png'),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Admin",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "User View Page",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: TextField(
                    onChanged: (value) {
                      context.read<AuthBloc>().add(
                          FetchUsers(searchQuery: value)); // Pass search query
                    },
                    decoration: InputDecoration(
                      hintText: 'Search users',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is UsersLoading) {
                  return Center(child: Loading_Widget());
                } else if (state is Usersfailerror) {
                  return Text(state.error.toString());
                } else if (state is Usersloaded) {
                  if (state.Users.isEmpty) {
                    // Return "No data found" if txhe list is empty
                    return Center(
                      child: Text(
                        "No data found",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey.shade300),
                        columnSpacing: 50,
                        dataRowMaxHeight: 70,
                        decoration: BoxDecoration(color: Colors.white),
                        columns: [
                          _buildColumn('S/no'),
                          _buildColumn('Name'),
                          _buildColumn('Phone number'),
                          _buildColumn('Email'),
                          _buildColumn('Country'),
                          _buildColumn('State'),
                          _buildColumn('City'),
                        ],
                        rows: List.generate(
                          state.Users.length,
                          (index) {
                            final User = state.Users[index];
                            return DataRow(
                              cells: [
                                DataCell(Text((index + 1).toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold))),
                                DataCell(
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.Users[index].name.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(User.phone_number.toString(),
                                          overflow: TextOverflow.ellipsis),
                                      Text(User.email.toString(),
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                ),
                                DataCell(Text(User.phone_number.toString())),
                                DataCell(Text(User.email.toString())),
                                DataCell(Text(User.Country.toString())),
                                DataCell(Text(User.state.toString())),
                                DataCell(Text(User.City.toString())),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  DataColumn _buildColumn(String title) {
    return DataColumn(
      label: Text(
        title,
        style: TextStyle(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }

  DataRow _buildRow(String index) {
    List<List<String>> userData = [
      [
        "John Doe",
        "+1 123-456-7890",
        "johndoe@example.com",
        "United States",
        "California",
        "Los Angeles",
        "123 Baker Street"
      ],
      [
        "Devid John",
        "+44 987-654-3210",
        "devid@example.com",
        "United Kingdom",
        "London",
        "Westminster",
        "456 Oxford Street"
      ],
    ];

    return DataRow(
      cells: [
        DataCell(Text(index)),
        ...userData[int.parse(index) - 1].map((data) => DataCell(Text(data))),
      ],
    );
  }
}
