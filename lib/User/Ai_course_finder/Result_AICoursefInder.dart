import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_connect/Controller/Bloc/Ai_coursefinder_block/coursefinder_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Controller/Bloc/University_block/University_model/University_model.dart';
import '../../Controller/Bloc/selection_cubit.dart';
import '../../Controller/Bloc/selection_state.dart';
import '../Sreens/BottomNavigation/Bottom_Nav.dart';
import 'UniversityInfoScreen.dart';

class ResultAicoursefinder extends StatelessWidget {
  const ResultAicoursefinder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit, SelectionState>(
      builder: (context, state) {
        if (state is SelectionUpdated) {
          return BlocProvider(
              create: (context) => CoursefinderBlock()
                ..add(FetchAllUniversites(
                  searchQuery: null,
                  Country: state.selections["country"],
                  AcadamicTest: state.selections["Acadamictest"],
                  Course_offered: state.selections["course"],
                  Degree_offered: state.selections["selectedDegree"],
                  Englishtest: state.selections["EnglishTest"],
                  highestEducation: state.selections["highestEducation"],

                  // AcadamicTestPercentage:
                  //     state.selections["AcadamicTestpercentage"],
                  // Englishtestpercentage:
                  //     state.selections["EnglishTest_percentage"],
                  // highestEducationpercentage:
                  //     state.selections["highestEducation_percentage"],
                )),
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return BottomNavWrapper();
                            },
                          ));
                        },
                        child: Text("Back to Home"))
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text(
                      //   ' 10 universities found',
                      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      // ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Search university or course",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Expanded(
                          //   flex: 1,
                          //   child: Container(
                          //     height: 50,
                          //     width: 50,
                          //     decoration: BoxDecoration(
                          //       color: Colors.grey[100],
                          //       borderRadius: BorderRadius.circular(12),
                          //     ),
                          //     child: IconButton(
                          //       icon: Icon(Icons.tune, color: Colors.brown),
                          //       onPressed: () {
                          //         // TODO: Implement filter functionality
                          //       },
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child:
                            BlocConsumer<CoursefinderBlock, CoursefinderState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is CoursefinderLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state is CoursefinderFailError) {
                              return Center(child: Text(state.error));
                            } else if (state is CoursefinderLoaded) {
                              if (state.universities.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No data found",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }

                              return ListView.builder(
                                itemCount: state.universities.length,
                                itemBuilder: (context, index) {
                                  final University_model university =
                                      state.universities[index];
                                  return Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // child: ListTile(
                                      //   leading: ClipRRect(
                                      //       borderRadius: BorderRadius.circular(
                                      //           10), // Uncomment if needed
                                      //       child: CachedNetworkImage(
                                      //         imageUrl:
                                      //             university.UniversityimageURL.toString(),
                                      //         height: 140,
                                      //         width: 160,
                                      //         fit: BoxFit.cover,
                                      //
                                      //         // Show a loading indicator while fetching the image
                                      //         placeholder: (context, url) => Center(
                                      //           child: CircularProgressIndicator(),
                                      //         ),
                                      //
                                      //         // Show an error icon if the image fails to load
                                      //         errorWidget: (context, url, error) => Icon(
                                      //           Icons.image_not_supported,
                                      //           size: 50,
                                      //           color: Colors.grey,
                                      //         ),
                                      //       )),
                                      //   title: GestureDetector(
                                      //     onTap: () {
                                      //       Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //
                                      //           builder: (context) =>
                                      //               UniversityInfoScreenWrapper(
                                      //                   universityid:
                                      //                       university.Universityid),
                                      //         ),
                                      //       );
                                      //     },
                                      //     child: Text(
                                      //       university.Collegename!,
                                      //       style: const TextStyle(
                                      //         color: Colors.blue,
                                      //         fontSize: 16,
                                      //         fontWeight: FontWeight.bold,
                                      //         decoration: TextDecoration.underline,
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   subtitle: Column(
                                      //     crossAxisAlignment: CrossAxisAlignment.start,
                                      //     children: [
                                      //       Text(
                                      //           '${university.Universityname}, ${university.Course_offered}'),
                                      //       Text("${university.Country}"),
                                      //       Row(
                                      //         children: [
                                      //           const Icon(Icons.star,
                                      //               color: Colors.amber, size: 16),
                                      //           Text(
                                      //             ' ${university.Rank}',
                                      //             style: const TextStyle(fontSize: 12),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UniversityInfoScreenWrapper(
                                                universityid:
                                                    university.Universityid,
                                              ),
                                            ),
                                          );
                                        },
                                        child: ListTile(
                                          leading: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  university.UniversityimageURL
                                                      .toString(),
                                              height: 140,
                                              width: 160,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                Icons.image_not_supported,
                                                size: 50,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            university.Collegename!,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                      '${university.Universityname},'
                                                      ' ${university.Course_offered}'),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("${university.Country}"),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(Icons.star,
                                                      color: Colors.amber,
                                                      size: 16),
                                                  Text(
                                                    ' ${university.Rank}',
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              );
                            }
                            return SizedBox();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        }
        return SizedBox();
      },
    );
    // );
  }
}
