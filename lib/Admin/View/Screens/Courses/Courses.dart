import 'package:flutter/material.dart';

class Courses_main extends StatefulWidget {
  const Courses_main({super.key});

  @override
  State<Courses_main> createState() => _Courses_mainState();
}

class _Courses_mainState extends State<Courses_main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                        Text(
                          "Welcome ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
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
                      Container(
                        height: 40,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18)),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: .5),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            hintText: 'Search University',
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 21,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.person)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.notification_add)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Center(
                          child: Text(
                            "Add Courses",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        height: 50,
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff0A71CB)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
