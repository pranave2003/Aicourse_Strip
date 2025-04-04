import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  ApplicationBloc() : super(ApplicationInitial()) {
    on<UploadUniversityphoto>((event, emit) async {
      try {
        emit(TranscriptionuploadLoading());

        // ✅ Open file picker
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image, // Pick only image files
          withData: true, // Required for web
        );

        if (result == null) {
          emit(ProfileImageFailure("No picked the image"));

          print("No image selected.");
          return; // User canceled selection
        }

        String fileName =
            "Application/Users_Application/${DateTime.now().millisecondsSinceEpoch}.jpg";
        Reference storageRef = _firebaseStorage.ref().child(fileName);
        UploadTask uploadTask;

        if (kIsWeb) {
          // ✅ Web: Upload image as bytes
          Uint8List imageData = result.files.first.bytes!;
          uploadTask = storageRef.putData(imageData);
        } else {
          // ✅ Mobile: Upload image as a File
          File imageFile = File(result.files.first.path!);
          uploadTask = storageRef.putFile(imageFile);
        }

        // ✅ Wait for the upload to complete
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        print("Uploaded Image URL: $downloadUrl");

        emit(TranscriptUploaded(downloadUrl));
      } catch (e) {
        print("Error: $e");
        emit(ProfileImageFailure("Failed to upload Transcript "));
      }
    });

    on<UploadSOPPhoto>((event, emit) async {
      try {
        emit(SoploadLoading());

        // ✅ Open file picker
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image, // Pick only image files
          withData: true, // Required for web
        );

        if (result == null) {
          emit(ProfileImageFailure("No picked the image"));

          print("No image selected.");
          return; // User canceled selection
        }

        String fileName =
            "Application/Users_Application/${DateTime.now().millisecondsSinceEpoch}.jpg";
        Reference storageRef = _firebaseStorage.ref().child(fileName);
        UploadTask uploadTask;

        if (kIsWeb) {
          // ✅ Web: Upload image as bytes
          Uint8List imageData = result.files.first.bytes!;
          uploadTask = storageRef.putData(imageData);
        } else {
          // ✅ Mobile: Upload image as a File
          File imageFile = File(result.files.first.path!);
          uploadTask = storageRef.putFile(imageFile);
        }

        // ✅ Wait for the upload to complete
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        print("Uploaded Image URL: $downloadUrl");

        emit(SOPUploaded(downloadUrl));
      } catch (e) {
        print("Error: $e");
        emit(ProfileImageFailure("Failed to upload image"));
      }
    });
    on<UploadLORPhoto>((event, emit) async {
      try {
        emit(LorUploadLoading());

        // ✅ Open file picker
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image, // Pick only image files
          withData: true, // Required for web
        );

        if (result == null) {
          emit(ProfileImageFailure("No picked the image"));

          print("No image selected.");
          return; // User canceled selection
        }

        String fileName =
            "Application/Users_Application/${DateTime.now().millisecondsSinceEpoch}.jpg";
        Reference storageRef = _firebaseStorage.ref().child(fileName);
        UploadTask uploadTask;

        if (kIsWeb) {
          // ✅ Web: Upload image as bytes
          Uint8List imageData = result.files.first.bytes!;
          uploadTask = storageRef.putData(imageData);
        } else {
          // ✅ Mobile: Upload image as a File
          File imageFile = File(result.files.first.path!);
          uploadTask = storageRef.putFile(imageFile);
        }

        // ✅ Wait for the upload to complete
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        print("Uploaded Image URL: $downloadUrl");

        emit(LORUploaded(downloadUrl));
      } catch (e) {
        print("Error: $e");
        emit(ProfileImageFailure("Failed to upload LOR"));
      }
    });
    on<Englishtest>((event, emit) async {
      try {
        emit(EnglishtestUploadLoading());

        // ✅ Open file picker
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image, // Pick only image files
          withData: true, // Required for web
        );

        if (result == null) {
          emit(ProfileImageFailure("No picked the image"));

          print("No image selected.");
          return; // User canceled selection
        }

        String fileName =
            "Application/Users_Application/${DateTime.now().millisecondsSinceEpoch}.jpg";
        Reference storageRef = _firebaseStorage.ref().child(fileName);
        UploadTask uploadTask;

        if (kIsWeb) {
          // ✅ Web: Upload image as bytes
          Uint8List imageData = result.files.first.bytes!;
          uploadTask = storageRef.putData(imageData);
        } else {
          // ✅ Mobile: Upload image as a File
          File imageFile = File(result.files.first.path!);
          uploadTask = storageRef.putFile(imageFile);
        }

        // ✅ Wait for the upload to complete
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        print("Uploaded Image URL: $downloadUrl");

        emit(Englishtestdocument(downloadUrl));
      } catch (e) {
        print("Error: $e");
        emit(ProfileImageFailure("Failed to upload English test Document"));
      }
    });
  }
}
