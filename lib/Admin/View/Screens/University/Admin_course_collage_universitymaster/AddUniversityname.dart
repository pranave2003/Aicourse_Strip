import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Controller/Bloc/University_block/university_bloc.dart';

class Adduniversitywrapper extends StatefulWidget {
  const Adduniversitywrapper({super.key});

  @override
  State<Adduniversitywrapper> createState() => _AdduniversitywrapperState();
}

class _AdduniversitywrapperState extends State<Adduniversitywrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityBloc>(
      create: (context) => UniversityBloc()..add(MasterFetchUniversitys()),
      child: Adduniversityname(),
    );
  }
}

class Adduniversityname extends StatefulWidget {
  const Adduniversityname({super.key});

  @override
  State<Adduniversityname> createState() => _AdduniversitynameState();
}

class _AdduniversitynameState extends State<Adduniversityname> {
  TextEditingController Universitymastercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Welcome ",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Admin,",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0A71CB))),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      child: Icon(Icons.notifications),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 0.5, color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: AssetImage('assets/Profile/img.png'),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Admin",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),

            // University List Section
            Expanded(
              child: BlocConsumer<UniversityBloc, UniversityState>(
                listener: (context, state) {
                  if (state is Adduniversitysucess) {
                    context.read<UniversityBloc>()..add(MasterFetchUniversitys());
                    Universitymastercontroller.clear();
                  }
                },
                builder: (context, state) {
                  if (state is MAsterUniversityLoading) {
                    return Center(child: Loading_Widget());
                  }
                  if (state is MasterUniversityLoaded) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.separated(
                          itemCount: state.universityList.length,
                          separatorBuilder: (_, __) => Divider(),
                          itemBuilder: (context, index) {
                            final university = state.universityList[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue.shade100,
                                child: Text("${index + 1}"),
                              ),
                              title: Text(university.name,
                                  style: TextStyle(fontWeight: FontWeight.w500)),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  context.read<UniversityBloc>().add(
                                      deleteMasteruniversity(id: university.id));
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  return Center(child: Text("No universities found."));
                },
              ),
            ),

            SizedBox(height: 30),

            // Add University Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 320,
                  child: TextFormField(
                    controller: Universitymastercontroller,
                    decoration: InputDecoration(
                      hintText: "Enter University",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                BlocConsumer<UniversityBloc, UniversityState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        final name = Universitymastercontroller.text.trim();
                        if (name.isNotEmpty) {
                          context.read<UniversityBloc>()
                            ..add(AddUniversity(universityname: name));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: state is Adduniversitymasterloading
                          ? Loading_Widget()
                          : Text("Add", style: TextStyle(color: Colors.white)),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
