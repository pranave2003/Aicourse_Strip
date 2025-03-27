import 'package:course_connect/User/Apply/Document_upload.dart';
import 'package:flutter/material.dart';

class Personal_details extends StatefulWidget {
  @override
  _Personal_detailsState createState() => _Personal_detailsState();
}

class _Personal_detailsState extends State<Personal_details> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null)
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
  }
  // class _Personal_detailsState extends State<Personal_details> {
  bool isChecked = false;
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Personal Details", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize:27)),
                buildContainer("Your Full Name", TextFormField()),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: buildContainer(
                        "Your Date of Birth",
                        TextFormField(
                          controller: _dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () => _selectDate(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(flex: 2, child: buildDropdownContainer("Gender", ["Male", "Female", "Other"])),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 1, child: buildContainer("Code", TextFormField(initialValue: "+91"))),
                    SizedBox(width: 10),
                    Expanded(flex: 3, child: buildContainer("Mobile Number", TextFormField())),
                  ],
                ),
                buildContainer("Your Email Address", TextFormField()),
                buildDropdownContainer("Nationality", ["Indian", "Other"]),
                buildContainer("Your Full Address", TextFormField()),
                Row(
                  children: [
                    Expanded(flex: 2, child: buildDropdownContainer("Country of Residence", ["India", "Other"])),
                    SizedBox(width: 10),
                    Expanded(flex: 2, child: buildContainer("State/Province", TextFormField())),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 2, child: buildContainer("City", TextFormField())),
                    SizedBox(width: 10),
                    Expanded(flex: 2, child: buildContainer("Pincode/Zipcode", TextFormField())),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(

                        activeColor: Colors.blue,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                            // if(isChecked == false){
                            //   isChecked = true;
                            // }else{
                            //   isChecked = false;
                            // }
                          });
                        }),
                    SizedBox(height: 30),
                    Text("I have some medical conditions")
                  ],
                ),
              SizedBox(height: 180),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [

                  InkWell(

    onTap: () {
    // if (selectedOrganization != null) {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Document_upload(),
    ),
    );
    // print("fill all fields");

                    },

                    child:

                    Container(

                      height: 51,
                      width: 231,
                      decoration: BoxDecoration(
                          color: Color(0xff0A71CB),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer(String label, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget buildDropdownContainer(String label, List<String> items) {
    return buildContainer(
      label,
      DropdownButtonFormField(
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) {},
        decoration: InputDecoration(border: InputBorder.none),
      ),

    );
  }
}
