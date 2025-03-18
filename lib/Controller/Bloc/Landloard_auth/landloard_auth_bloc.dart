import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'LandloardModel/LandloardModel.dart';
part 'landloard_auth_event.dart';
part 'landloard_auth_state.dart';

class LandloardAuthBloc extends Bloc<LandloardAuthEvent, LandloardAuthState> {
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
              "university": event.user.Universityname,
              "timestamp": DateTime.now(),
              "Onesignal_id": "playerId",
              "ban": "1",
              "status": "1"
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
              if (userData['ban'] == "1") {
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
  }
}
