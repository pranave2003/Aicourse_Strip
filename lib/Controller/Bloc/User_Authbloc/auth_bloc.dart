import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'Userauthmodel/Usermodel.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  AuthBloc() : super(AuthInitial()) {
    // check Auth or Not
    User? user;
    user = _auth.currentUser;
    on<checkloginstateevent>(
      (event, emit) async {
        try {
          await Future.delayed(Duration(seconds: 3));

          if (user != null) {
            emit(Authenticated(user));
          } else {
            emit(UnAuthenticated());
          }
        } catch (e) {
          emit(AuthenticatedError(
            message:
                e.toString().split('] ').last, // Extracts only the message part
          ));
        }
      },
    );
    // Signup
    on<SignupEvent>(
      (event, emit) async {
        emit(Authloading());
        try {
          final usercredential = await _auth.createUserWithEmailAndPassword(
              email: event.user.email.toString(),
              password: event.user.password.toString());

          final user = usercredential.user;

          if (user != null) {
            FirebaseFirestore.instance.collection("Users").doc(user.uid).set({
              "userId": user.uid,
              "email": user.email,
              "name": event.user.name,
              "phone_number": event.user.phone,
              "timestamp": DateTime.now(),
              "state": event.user.state,
              "Country": event.user.Country,
              "City": event.user.City,
              "Gender": event.user.Gender,
              "Onesignal_id": "playerId",
              "role": "User",
              "ban": "1",
              "status": "1",
              "image":
                  "https://img.freepik.com/premium-vector/avatar-profile-icon-flat-style-female-user-profile-vector-illustration-isolated-background-women-profile-sign-business-concept_157943-38866.jpg"
            });
            emit(Authenticated(user));
          } else {
            emit(UnAuthenticated());
          }
        } catch (e) {
          emit(AuthenticatedError(message: e.toString().split("]").last));
          print("Authenticated Error : ${e.toString().split(']').last}");
        }
      },
    );

    // logout
    // on<SigOutEvent>(
    //   (event, emit) async {
    //     User? user=_auth.currentUser;
    //     try {
    //       user = _auth.currentUser;
    //
    //      await FirebaseFirestore.instance
    //           .collection("User")
    //           .doc(user.uid)
    //           .update({"Onesignal_id": 12121});
    //       await _auth.signOut();
    //       emit(UnAuthenticated());
    //     } catch (e) {
    //       emit(AuthenticatedError(message: e.toString()));
    //     }
    //   },
    // );
    on<SigOutEvent>(
      (event, emit) async {
        try {
          User? user = _auth.currentUser;

          if (user != null) {
            // Get the Player ID from OneSignalService

            // Update Firestore with the correct user ID and OneSignal ID
            await FirebaseFirestore.instance
                .collection("Users")
                .doc(user.uid) // Use current user's UID
                .update({"Onesignal_id": "null"}); // Update with OneSignal ID

            // Sign out the user
            await _auth.signOut();
            print("sign out ${user.uid}");
            emit(UnAuthenticated());
          } else {
            emit(AuthenticatedError(message: "No user is logged in"));
          }
        } catch (e) {
          emit(AuthenticatedError(message: e.toString()));
        }
      },
    );
    on<FetchUserDetailsById>((event, emit) async {
      emit(Userloading());
      User? user = _auth.currentUser;

      if (user != null) {
        try {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            final doc = await FirebaseFirestore.instance
                .collection('Users')
                .doc(user.uid)
                .get();

            if (doc.exists) {
              UserModel userData = UserModel.fromMap(doc.data()!);
              emit(UserByidLoaded(userData));
            } else {
              emit(UserError(error: "User profile not found"));
            }
          } else {
            emit(UserError(error: "User not authenticated"));
          }
        } catch (e) {
          emit(UserError(error: e.toString()));
        }
      }
    });
    on<LoginEvent>(
      (event, emit) async {
        emit(Authloading());
        try {
          final userCredential = await _auth.signInWithEmailAndPassword(
            email: event.Email,
            password: event.Password,
          );
          final user = userCredential.user;

          if (user != null) {
            print("Id=======${user.uid}");

            // Fetch user document from Firestore
            DocumentSnapshot userDoc = await FirebaseFirestore.instance
                .collection("Users")
                .doc(user.uid)
                .get();

            if (userDoc.exists) {
              final userData = userDoc.data() as Map<String, dynamic>;

              // Check if the 'Ban' field is 1
              if (userData['ban'] == "1") {
                // Update OneSignal ID
                await FirebaseFirestore.instance
                    .collection("Users")
                    .doc(user.uid)
                    .update({"Onesignal_id": "playerId"});

                emit(Authenticated(user));
                print("Auth successfully");
              } else {
                await _auth.signOut();
                emit(AuthenticatedError(
                    message: "Your account has been deleted."));
              }
            } else {
              await _auth.signOut();
              emit(AuthenticatedError(message: "User data not found."));
            }
          } else {
            emit(UnAuthenticated());
          }
        } on FirebaseAuthException catch (e) {
          emit(AuthenticatedError(message: e.message ?? "An error occurred."));
          print("FirebaseAuthException: ${e.message}");
        } catch (e) {
          emit(AuthenticatedError(message: "An unexpected error occurred."));
          print("Login error: ${e.toString()}");
        }
      },
    );

    // get all users

    on<FetchUsers>((event, emit) async {
      emit(UsersLoading());
      try {
        CollectionReference driversCollection =
            FirebaseFirestore.instance.collection('Users');

        Query query = driversCollection;
        QuerySnapshot snapshot = await query.get();

        List<UserModel> userss = snapshot.docs.map((doc) {
          return UserModel.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          userss = userss.where((driver) {
            return driver.name!
                .toLowerCase()
                .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(Usersloaded(userss));
      } catch (e) {
        emit(Usersfailerror(e.toString()));
      }
    });

    // on<PickAndUploadImageEvent>((event, emit) async {
    //   try {
    //     // Pick Image from Gallery
    //     final pickedFile =
    //         await _imagePicker.pickImage(source: ImageSource.gallery);
    //     if (pickedFile == null) {
    //       return; // User canceled image selection
    //     }
    //
    //     emit(ProfileImageLoading());
    //
    //     File imageFile = File(pickedFile.path);
    //     String fileName =
    //         "Userprofile/${DateTime.now().millisecondsSinceEpoch}.jpg";
    //
    //     // Upload to Firebase Storage
    //     UploadTask uploadTask =
    //         _firebaseStorage.ref(fileName).putFile(imageFile);
    //     TaskSnapshot snapshot = await uploadTask;
    //
    //     // Get Download URL
    //     String downloadUrl = await snapshot.ref.getDownloadURL();
    //     print(downloadUrl);
    //     if (user != null) {
    //       FirebaseFirestore.instance
    //           .collection("Users")
    //           .doc(user.uid)
    //           .update({"image": downloadUrl});
    //     }
    //     emit(ProfileImageSuccess());
    //   } catch (e) {
    //     print(e);
    //     emit(ProfileImageFailure("Failed to upload image"));
    //   }
    // });

    on<PickAndUploadImageEvent>((event, emit) async {
      try {
        emit(ProfileImageLoading());

        // ✅ Open file picker
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image, // Pick only image files
          withData: true, // Required for web
        );

        if (result == null) {
          print("No image selected.");
          return; // User canceled selection
        }

        String fileName =
            "Userprofile/${DateTime.now().millisecondsSinceEpoch}.jpg";
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

        // ✅ Update Firestore with the image URL
        if (user != null) {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(user.uid)
              .update({"image": downloadUrl});
        }

        emit(ProfileImageSuccess());
      } catch (e) {
        print("Error: $e");
        emit(ProfileImageFailure("Failed to upload image"));
      }
    });
  }
}
