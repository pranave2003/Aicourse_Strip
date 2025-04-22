import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Controller/Bloc/University_block/university_bloc.dart';

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Welcome ",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                          radius: 20, // Ensure a proper radius is set
                          backgroundColor: Colors.grey, // Fallback color
                          backgroundImage: AssetImage(
                              'assets/Profile/img.png'), // Corrected Path
                        ),
                        const SizedBox(width: 10),
                        Text(
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<UniversityBloc, UniversityState>(
                listener: (context, state) {
                  if (state is Adduniversitysucess) {
                    context.read<UniversityBloc>()
                      ..add(MasterFetchUniversitys());
                    Universitymastercontroller.clear();
                  }
                },
                builder: (context, state) {
                  if (state is MAsterUniversityLoading) {
                    return Loading_Widget();
                  }
                  if (state is MasterUniversityLoaded) {
                    return Container(
                      height: 400,
                      width: 600,
                      color: Colors.blue.shade50,
                      child: ListView.builder(
                        itemCount: state.universityList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text('1'),
                            title: Text(state.universityList[index].name),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          );
                        },
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextFormField(
                  controller: Universitymastercontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter University"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<UniversityBloc, UniversityState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<UniversityBloc>()
                          ..add(AddUniversity(
                              universityname: Universitymastercontroller.text));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Square shape
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16), // Optional: controls size
                      ),
                      child: state is Adduniversitymasterloading
                          ? Loading_Widget()
                          : Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
