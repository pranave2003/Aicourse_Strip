import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/Bloc/University_block/university_bloc.dart';
import '../../../Widget/Constands/Loading.dart';
import '../../Ai_course_finder/UniversityInfoScreen.dart';

class Coursewrapper extends StatelessWidget {
  const Coursewrapper({super.key, this.university, this.collage});
  final university;
  final collage;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityBloc>(
      create: (context) => UniversityBloc()
        ..add(Fetchcourse_colleges(
            University: university, searchQuery: null, college: collage)),
      child: Course(
        collagename: collage,
        university: university,
      ),
    );
  }
}

class Course extends StatefulWidget {
  const Course({super.key, this.collagename, this.university});
  final collagename;
  final university;
  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          " ${widget.collagename} Courses",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    onChanged: (value) {
                      context.read<UniversityBloc>().add(Fetchcourse_colleges(
                          searchQuery: value,
                          college: widget.collagename,
                          University: widget.university));
                    },
                    decoration: const InputDecoration(
                      hintText: "Search Course",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocConsumer<UniversityBloc, UniversityState>(
                listener: (context, state) {
                  // Handle state changes if needed
                },
                builder: (context, state) {
                  if (state is UniversitysLoading) {
                    return const Center(
                      child: Loading_Widget(),
                    );
                  } else if (state is Universitysfailerror) {
                    return Center(child: Text(state.error.toString()));
                  } else if (state is University_loaded) {
                    if (state.University.isEmpty) {
                      return const Center(
                        child: Text(
                          "No university courses available for the given name.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.University.length,
                      itemBuilder: (context, index) {
                        final university = state.University[index];

                        return ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return UniversityInfoScreenWrapper(
                                  universityid: university.Universityid,
                                );
                              },
                            ));
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              university.UniversityimageURL.toString(),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error, size: 50),
                            ),
                          ),
                          title: Text(
                            university.Course_offered.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle:
                              Text("College Code: ${university.Collegename}"),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
