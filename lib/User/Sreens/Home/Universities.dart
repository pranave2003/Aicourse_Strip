import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/Bloc/University_block/university_bloc.dart';
import '../../../Widget/Constands/Loading.dart';
import 'Colleges.dart';

class UniversitiesWrapper extends StatelessWidget {
  const UniversitiesWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityBloc>(
      create: (context) => UniversityBloc()
        ..add(FetchAllUniversites(
          searchQuery: null,
        )),
      child: Universities(),
    );
  }
}

class Universities extends StatefulWidget {
  const Universities({super.key});

  @override
  State<Universities> createState() => _UniversitiesState();
}

class _UniversitiesState extends State<Universities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.yellowAccent,
        toolbarHeight: 80,
        title: Text(
          "Explore Destination",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    onChanged: (value) {
                      context
                          .read<UniversityBloc>()
                          .add(FetchAllUniversites(searchQuery: value));
                    },
                    decoration: InputDecoration(
                        hintText: "search university or course",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Top Universities in United states",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: BlocConsumer<UniversityBloc, UniversityState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is UniversitysLoading) {
                        return Center(
                          child: Loading_Widget(),
                        );
                      } else if (state is Universitysfailerror) {
                        return Text(state.error.toString());
                      } else if (state is University_loaded) {
                        if (state.University.isEmpty) {
                          // Return "No data found" if txhe list is empty
                          return Center(
                            child: Text(
                              "No university courses available for the given name.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          );
                        }
                        return GridView.builder(
                          physics:
                              NeverScrollableScrollPhysics(), // Prevents extra scrolling
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Two columns
                            crossAxisSpacing: 10, // Space between columns
                            mainAxisSpacing: 10, // Space between rows
                            childAspectRatio:
                                0.75, // Adjusted for better image fit
                          ),
                          itemCount: state.University.length,
                          itemBuilder: (context, index) {
                            final university = state.University[index];

                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Collages_Wrapper(
                                        university: university.Universityname);
                                  },
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10),
                                    ClipRRect(
                                      // borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        university.UniversityimageURL
                                            .toString(),
                                        height: 140,
                                        width: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Text(
                                          university.Universityname.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        )),
                                    SizedBox(height: 4),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Text(
                                          university.Country.toString()
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[700]),
                                          textAlign: TextAlign.left,
                                        )),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
