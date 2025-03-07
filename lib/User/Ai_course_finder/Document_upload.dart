import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MaterialApp(
    home: Document_upload(),
  ));
}

class Document_upload extends StatefulWidget {
  @override
  _Document_uploadState createState() => _Document_uploadState();
}

class _Document_uploadState extends State<Document_upload> {
  Map<String, String?> uploadedFiles = {};

  // Future<void> _pickFile(String field) async {
  //   FilePickerResult  result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     setState(() {
  //       uploadedFiles[field] = result.files.single.name;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document Upload", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildUploadField("Educational Certificates"),
              buildUploadField("UG Provision (if applicable)"),
              buildUploadField("Transcripts"),
              buildUploadField("University Application Document (mandatory)"),
              buildUploadField("English Test Result"),
              SizedBox(height: 10),
              Text("Statement and Recommendation", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
              buildUploadField("Statement of Purpose"),
              buildUploadField("Letter of Recommendation"),
              SizedBox(height: 10),
              Text("Travel Documents", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
              buildUploadField("Travel and Emigration Documents"),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Next", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUploadField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          GestureDetector(
            // onTap: () => _pickFile(label),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(uploadedFiles[label] ?? "Upload $label...", style: TextStyle(color: Colors.grey)),
                  Icon(Icons.cloud_upload, color: Colors.blue),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilePicker {
}

class FilePickerResult {
}
