import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_connect/Admin/View/Screens/Landlord/New_Landlords.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'LandloardModel/LandloardModel.dart';
part 'landloard_auth_event.dart';
part 'landloard_auth_state.dart';

final Lanloardid_global=FirebaseAuth.instance.currentUser!.uid;

class LandloardAuthBloc extends Bloc<LandloardAuthEvent, LandloardAuthState>
{
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  LandloardAuthBloc() : super(LandloardAuthInitial()) {
    // check Auth or Not
    on<checkloginLandloardstateevent>(
      (event, emit) async {
        User? user;
        try {
          await Future.delayed(Duration(seconds: 3));
          user = _auth.currentUser;
          if (user != null) {
            emit(Authenticated(user) as LandloardAuthState);
          } else {
            emit(UnAuthenticated() as LandloardAuthState);
          }
        } catch (e) {
          emit(AuthenticatedError(
            message:
                e.toString().split('] ').last, // Extracts only the message part
          ) as LandloardAuthState);
        }
      },
    );
    // Signup
    on<LandloardSignupEvent>(
      (event, emit) async {
        emit(Authloading() as LandloardAuthState);
        try {
          final usercredential = await _auth.createUserWithEmailAndPassword(
              email: event.user.email.toString(),
              password: event.user.password.toString());

          final user = usercredential.user;

          if (user != null) {
            FirebaseFirestore.instance
                .collection("Landloard")
                .doc(user.uid)
                .set({
              "userId": user.uid,
              "email": user.email,
              "name": event.user.name,
              "phone_number": event.user.phone,
              "gender": event.user.gender,
              "dob": event.user.DOB,
              "place": event.user.Place,
              "address": event.user.Adress,
              "idproofimage": event.user.idproofimage,
              "university": event.user.Universityname,
              "timestamp": DateTime.now(),
              "Onesignal_id": "playerId",
              "ban": "0",
              "status": "0"
            });
            emit(Authenticated(user) as LandloardAuthState);
          } else {
            emit(UnAuthenticated() as LandloardAuthState);
          }
        } catch (e) {
          emit(AuthenticatedError(message: e.toString().split("]").last)
              as LandloardAuthState);
          print("Authenticated Error : ${e.toString().split(']').last}");
        }
      },
    );

    on<Landloard_LoginEvent>(
      (event, emit) async {
        emit(Authloading() as LandloardAuthState);
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
                .collection("Landloard")
                .doc(user.uid)
                .get();

            if (userDoc.exists) {
              final userData = userDoc.data() as Map<String, dynamic>;

              // Check if the 'Ban' field is 1
              if (userData['ban'] == "0") {
                // Update OneSignal ID
                await FirebaseFirestore.instance
                    .collection("Landloard")
                    .doc(user.uid)
                    .update({"Onesignal_id": "playerId"});

                emit(Authenticated(user) as LandloardAuthState);
                print("Auth successfully");
              } else {
                await _auth.signOut();
                emit(AuthenticatedError(
                        message: "Your account has been deleted.")
                    as LandloardAuthState);
              }
            } else {
              await _auth.signOut();
              emit(AuthenticatedError(message: "User data not found.")
                  as LandloardAuthState);
            }
          } else {
            emit(UnAuthenticated() as LandloardAuthState);
          }
        } on FirebaseAuthException catch (e) {
          emit(AuthenticatedError(message: e.message ?? "An error occurred.")
              as LandloardAuthState);
          print("FirebaseAuthException: ${e.message}");
        } catch (e) {
          emit(AuthenticatedError(message: "An unexpected error occurred.")
              as LandloardAuthState);
          print("Login error: ${e.toString()}");
        }
      },
    );
    on<LandloardSigOutEvent>(
      (event, emit) async {
        try {
          User? user = _auth.currentUser;

          if (user != null) {
            // Get the Player ID from OneSignalService

            // Update Firestore with the correct user ID and OneSignal ID
            await FirebaseFirestore.instance
                .collection("Landloard")
                .doc(user.uid) // Use current user's UID
                .update({"Onesignal_id": "null"}); // Update with OneSignal ID

            // Sign out the user
            await _auth.signOut();
            print("sign out ${user.uid}");
            emit(UnAuthenticated() as LandloardAuthState);
          } else {
            emit(AuthenticatedError(message: "No user is logged in")
                as LandloardAuthState);
          }
        } catch (e) {
          emit(AuthenticatedError(message: e.toString()) as LandloardAuthState);
        }
      },
    );

    //  fetch by id...
    on<FetchLandlordDetailsById>((event, emit) async {
      emit(Landlordloading());

      String? userId = event.getid ?? FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        try {
          final doc = await FirebaseFirestore.instance
              .collection('Landloard')
              .doc(userId) // userId ഉപയോഗിച്ചു
              .get();

          if (doc.exists) {
            Landloard_Model userData = Landloard_Model.fromMap(doc.data()!);
            emit(LandlordByidLoaded(userData));
          } else {
            emit(LandloardError(error: "User profile not found"));
          }
        } catch (e) {
          emit(LandloardError(error: e.toString()));
        }
      } else {
        emit(LandloardError(error: "User not authenticated"));
      }
    });

    // get all

    on<FetchLandloards>((event, emit) async {
      emit(LandloardessLoading());
      try {
        CollectionReference ShopesCollection =
            FirebaseFirestore.instance.collection('Landloard');

        Query query = ShopesCollection;
        query = query.where("status", isEqualTo: event.status);

        QuerySnapshot snapshot = await query.get();

        List<Landloard_Model> Landloared = snapshot.docs.map((doc) {
          return Landloard_Model.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          Landloared = Landloared.where((landlored) {
            return landlored.name!
                .toLowerCase()
                .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(Landloaredloaded(Landloared));
      } catch (e) {
        emit(Landloardfailfailerror(e.toString()));
      }
    });

    //   update by id Accept or reject

    on<AcceptOrRejectLandloard>((event, emit) async {
      emit(AcceptorrejectLoadingstate());

      try {
        FirebaseFirestore.instance
            .collection("Landloard")
            .doc(event.Landloaredid)
            .update({"status": event.Status.toString()});
        emit(Acceptorrejectstate());
      } catch (e) {
        emit(AcceptorrejectErrorstate(e.toString()));
      }
    });
    on<Uploadidproofphoto>((event, emit) async {
      try {
        emit(ImageuploadLoading());

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
            "Landloard/${DateTime.now().millisecondsSinceEpoch}.jpg";
        Reference storageRef = _firebaseStorage.ref().child(fileName);
        UploadTask uploadTask;

        if (kIsWeb) {
          // ✅ Web: Upload image as bytes
          var imageData = result.files.first.bytes!;
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

        emit(Imageuploadedurl(downloadUrl));
      } catch (e) {
        print("Error: $e");
        emit(ProfileImageFailure("Failed to upload image"));
      }
    });
  }
}
