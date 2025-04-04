// import 'package:course_connect/Controller/Bloc/Applycourse/application_bloc.dart';
// import 'package:course_connect/Controller/Bloc/User_Authbloc/auth_bloc.dart';
// import 'package:course_connect/User/Apply/SuccessScreen.dart';
// import 'package:course_connect/Widget/Constands/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../Widget/Constands/Loading.dart';
//
// class Document_upload extends StatelessWidget {
//   String? TrascriptimageUrl_global;
//   String? Sopimage_global;
//   String? LORimage_global;
//   String? Englishimage_global;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           // title: Text('Document Upload', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           // backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 0,
//         ),
//         // body: BlocProvider(
//         //   create: (context) => AuthBloc()..add(FetchUserDetailsById()),
//         //   child: BlocBuilder<AuthBloc, AuthState>(
//         //     builder: (context, state) {
//         //       if (state is Userloading) {
//         //         return const Center(child: Loading_Widget());
//         //       } else if (state is UserByidLoaded) {
//         //         final user = state.Userdata;
//         //         return Padding(
//         //           padding: EdgeInsets.all(16.0),
//         //           child: Column(
//         //             children: [
//         //               Expanded(
//         //                 child: BlocConsumer<ApplicationBloc, ApplicationState>(
//         //                   listener: (context, state) {
//         //                     // TODO: implement listener
//         //                   },
//         //                   builder: (context, state) {
//         //                     String? TrascriptimageUrl;
//         //                     String? SopimageUrl;
//         //                     String? LormageUrl;
//         //                     String? Englishtesturl;
//         //                     if (state is TranscriptUploaded) {
//         //                       TrascriptimageUrl = state.imageUrl;
//         //                       TrascriptimageUrl_global = TrascriptimageUrl;
//         //                     }
//         //
//         //                     if (state is SOPUploaded) {
//         //                       SopimageUrl = state.imageUrl;
//         //                       Sopimage_global = SopimageUrl;
//         //                     }
//         //                     if (state is LORUploaded) {
//         //                       LormageUrl = state.imageUrl;
//         //                       LORimage_global = LormageUrl;
//         //                     }
//         //                     if (state is Englishtestdocument) {
//         //                       Englishtesturl = state.imageUrl;
//         //                       Englishimage_global = Englishtesturl;
//         //                     }
//         //
//         //                     return ListView(
//         //                       children: [
//         //                         SectionHeader(title: 'Required Documents'),
//         //                         Text("Transcripts (High School, Undergraduate)",
//         //                             style: TextStyle(
//         //                                 fontSize: 16,
//         //                                 fontWeight: FontWeight.w500)),
//         //                         Card(
//         //                           child: Container(
//         //                             height: 100,
//         //                             width: 300,
//         //                             decoration: BoxDecoration(
//         //                                 border: Border.all(
//         //                                   color: state is TranscriptUploaded
//         //                                       ? Colors.green
//         //                                       : Colors.red,
//         //                                 ),
//         //                                 color: Colors.white),
//         //                             child: Row(
//         //                               children: [
//         //                                 Padding(
//         //                                   padding: const EdgeInsets.all(8.0),
//         //                                   child: ClipRRect(
//         //                                     borderRadius:
//         //                                         BorderRadius.circular(10),
//         //                                     child: TrascriptimageUrl != null &&
//         //                                             TrascriptimageUrl.isNotEmpty
//         //                                         ? Image.network(
//         //                                             TrascriptimageUrl,
//         //                                             width: 100,
//         //                                             height: 100,
//         //                                             fit: BoxFit.fill,
//         //                                             errorBuilder: (context, error,
//         //                                                 stackTrace) {
//         //                                               return Container(
//         //                                                 width: 100,
//         //                                                 height: 100,
//         //                                                 decoration: BoxDecoration(
//         //                                                   color: Colors.grey[300],
//         //                                                 ),
//         //                                                 child: Icon(
//         //                                                   Icons.upload,
//         //                                                   size: 50,
//         //                                                   color: Colors.grey[600],
//         //                                                 ),
//         //                                               );
//         //                                             },
//         //                                           )
//         //                                         : Container(
//         //                                             width: 100,
//         //                                             height: 100,
//         //                                             decoration: BoxDecoration(
//         //                                               color: Colors.grey[300],
//         //                                             ),
//         //                                             child: Icon(
//         //                                               Icons.upload,
//         //                                               size: 40,
//         //                                               color: Colors.grey[600],
//         //                                             ),
//         //                                           ),
//         //                                   ),
//         //                                 ),
//         //                                 TextButton(
//         //                                   onPressed: () {
//         //                                     context
//         //                                         .read<ApplicationBloc>()
//         //                                         .add(UploadUniversityphoto());
//         //                                   },
//         //                                   child: state
//         //                                           is TranscriptionuploadLoading
//         //                                       ? Loading_Widget()
//         //                                       : (state is TranscriptUploaded
//         //                                           ? Text(
//         //                                               "Uploaded ✅",
//         //                                               style: TextStyle(
//         //                                                   color: Colors.green),
//         //                                             )
//         //                                           : Text("Upload Transcripts")),
//         //                                 )
//         //                               ],
//         //                             ),
//         //                           ),
//         //                         ),
//         //
//         //                         // // //////////////////////////////
//         //                         Text("Statement of Purpose (SOP)",
//         //                             style: TextStyle(
//         //                                 fontSize: 16,
//         //                                 fontWeight: FontWeight.w500)),
//         //                         Card(
//         //                           child: Container(
//         //                             height: 100,
//         //                             width: 300,
//         //                             decoration: BoxDecoration(
//         //                                 border: Border.all(
//         //                                   color: state is UploadSOPPhoto
//         //                                       ? Colors.green
//         //                                       : Colors.red,
//         //                                 ),
//         //                                 color: Colors.white),
//         //                             child: Row(
//         //                               children: [
//         //                                 Padding(
//         //                                   padding: const EdgeInsets.all(8.0),
//         //                                   child: ClipRRect(
//         //                                     borderRadius:
//         //                                         BorderRadius.circular(10),
//         //                                     child: SopimageUrl != null &&
//         //                                             SopimageUrl.isNotEmpty
//         //                                         ? Image.network(
//         //                                             SopimageUrl,
//         //                                             width: 100,
//         //                                             height: 100,
//         //                                             fit: BoxFit.fill,
//         //                                             errorBuilder: (context, error,
//         //                                                 stackTrace) {
//         //                                               return Container(
//         //                                                 width: 100,
//         //                                                 height: 100,
//         //                                                 decoration: BoxDecoration(
//         //                                                   color: Colors.grey[300],
//         //                                                 ),
//         //                                                 child: Icon(
//         //                                                   Icons.upload,
//         //                                                   size: 50,
//         //                                                   color: Colors.grey[600],
//         //                                                 ),
//         //                                               );
//         //                                             },
//         //                                           )
//         //                                         : Container(
//         //                                             width: 100,
//         //                                             height: 100,
//         //                                             decoration: BoxDecoration(
//         //                                               color: Colors.grey[300],
//         //                                             ),
//         //                                             child: Icon(
//         //                                               Icons.upload,
//         //                                               size: 40,
//         //                                               color: Colors.grey[600],
//         //                                             ),
//         //                                           ),
//         //                                   ),
//         //                                 ),
//         //                                 TextButton(
//         //                                   onPressed: () {
//         //                                     context
//         //                                         .read<ApplicationBloc>()
//         //                                         .add(UploadSOPPhoto());
//         //                                   },
//         //                                   child: state is SoploadLoading
//         //                                       ? Loading_Widget()
//         //                                       : (state is SOPUploaded
//         //                                           ? Text(
//         //                                               "Uploaded ✅",
//         //                                               style: TextStyle(
//         //                                                   color: Colors.green),
//         //                                             )
//         //                                           : Text("Upload SOP")),
//         //                                 )
//         //                               ],
//         //                             ),
//         //                           ),
//         //                         ),
//         //
//         //                         //
//         //                         // // //////////////////////////////
//         //                         Text("Letter of Recommendation (LOR)",
//         //                             style: TextStyle(
//         //                                 fontSize: 16,
//         //                                 fontWeight: FontWeight.w500)),
//         //                         Card(
//         //                           child: Container(
//         //                             height: 100,
//         //                             width: 300,
//         //                             decoration: BoxDecoration(
//         //                                 border: Border.all(
//         //                                   color: state is UploadLORPhoto
//         //                                       ? Colors.green
//         //                                       : Colors.red,
//         //                                 ),
//         //                                 color: Colors.white),
//         //                             child: Row(
//         //                               children: [
//         //                                 Padding(
//         //                                   padding: const EdgeInsets.all(8.0),
//         //                                   child: ClipRRect(
//         //                                     borderRadius:
//         //                                         BorderRadius.circular(10),
//         //                                     child: LormageUrl != null &&
//         //                                             LormageUrl.isNotEmpty
//         //                                         ? Image.network(
//         //                                             LormageUrl,
//         //                                             width: 100,
//         //                                             height: 100,
//         //                                             fit: BoxFit.fill,
//         //                                             errorBuilder: (context, error,
//         //                                                 stackTrace) {
//         //                                               return Container(
//         //                                                 width: 100,
//         //                                                 height: 100,
//         //                                                 decoration: BoxDecoration(
//         //                                                   color: Colors.grey[300],
//         //                                                 ),
//         //                                                 child: Icon(
//         //                                                   Icons.upload,
//         //                                                   size: 50,
//         //                                                   color: Colors.grey[600],
//         //                                                 ),
//         //                                               );
//         //                                             },
//         //                                           )
//         //                                         : Container(
//         //                                             width: 100,
//         //                                             height: 100,
//         //                                             decoration: BoxDecoration(
//         //                                               color: Colors.grey[300],
//         //                                             ),
//         //                                             child: Icon(
//         //                                               Icons.upload,
//         //                                               size: 40,
//         //                                               color: Colors.grey[600],
//         //                                             ),
//         //                                           ),
//         //                                   ),
//         //                                 ),
//         //                                 TextButton(
//         //                                   onPressed: () {
//         //                                     context
//         //                                         .read<ApplicationBloc>()
//         //                                         .add(UploadLORPhoto());
//         //                                   },
//         //                                   child: state is LorUploadLoading
//         //                                       ? Loading_Widget()
//         //                                       : (state is LORUploaded
//         //                                           ? Text(
//         //                                               "Uploaded ✅",
//         //                                               style: TextStyle(
//         //                                                   color: Colors.green),
//         //                                             )
//         //                                           : Text("Upload Transcripts")),
//         //                                 )
//         //                               ],
//         //                             ),
//         //                           ),
//         //                         ),
//         //
//         //                         // // //////////////////////////////
//         //                         Text("English Test Result (IELTS, TOEFL, PTE)",
//         //                             style: TextStyle(
//         //                                 fontSize: 16,
//         //                                 fontWeight: FontWeight.w500)),
//         //                         Card(
//         //                           child: Container(
//         //                             height: 100,
//         //                             width: 300,
//         //                             decoration: BoxDecoration(
//         //                                 border: Border.all(
//         //                                   color: state is Englishtest
//         //                                       ? Colors.green
//         //                                       : Colors.red,
//         //                                 ),
//         //                                 color: Colors.white),
//         //                             child: Row(
//         //                               children: [
//         //                                 Padding(
//         //                                   padding: const EdgeInsets.all(8.0),
//         //                                   child: ClipRRect(
//         //                                     borderRadius:
//         //                                         BorderRadius.circular(10),
//         //                                     child: Englishtesturl != null &&
//         //                                             Englishtesturl.isNotEmpty
//         //                                         ? Image.network(
//         //                                             Englishtesturl,
//         //                                             width: 100,
//         //                                             height: 100,
//         //                                             fit: BoxFit.fill,
//         //                                             errorBuilder: (context, error,
//         //                                                 stackTrace) {
//         //                                               return Container(
//         //                                                 width: 100,
//         //                                                 height: 100,
//         //                                                 decoration: BoxDecoration(
//         //                                                   color: Colors.grey[300],
//         //                                                 ),
//         //                                                 child: Icon(
//         //                                                   Icons.upload,
//         //                                                   size: 50,
//         //                                                   color: Colors.grey[600],
//         //                                                 ),
//         //                                               );
//         //                                             },
//         //                                           )
//         //                                         : Container(
//         //                                             width: 100,
//         //                                             height: 100,
//         //                                             decoration: BoxDecoration(
//         //                                               color: Colors.grey[300],
//         //                                             ),
//         //                                             child: Icon(
//         //                                               Icons.upload,
//         //                                               size: 40,
//         //                                               color: Colors.grey[600],
//         //                                             ),
//         //                                           ),
//         //                                   ),
//         //                                 ),
//         //                                 TextButton(
//         //                                   onPressed: () {
//         //                                     context
//         //                                         .read<ApplicationBloc>()
//         //                                         .add(Englishtest());
//         //                                   },
//         //                                   child: state is EnglishtestUploadLoading
//         //                                       ? Loading_Widget()
//         //                                       : (state is Englishtest
//         //                                           ? Text(
//         //                                               "Uploaded ✅",
//         //                                               style: TextStyle(
//         //                                                   color: Colors.green),
//         //                                             )
//         //                                           : Text("Upload Transcripts")),
//         //                                 )
//         //                               ],
//         //                             ),
//         //                           ),
//         //                         ),
//         //                       ],
//         //                     );
//         //                   },
//         //                 ),
//         //               ),
//         //               SizedBox(height: 20),
//         //               InkWell(
//         //                 onTap: () {
//         //                   Navigator.push(
//         //                     context,
//         //                     MaterialPageRoute(
//         //                       builder: (context) => SuccessScreen(),
//         //                     ),
//         //                   );
//         //                 },
//         //                 child: Container(
//         //                   height: 51,
//         //                   width: 231,
//         //                   decoration: BoxDecoration(
//         //                       color: blueColor,
//         //                       borderRadius: BorderRadius.circular(30)),
//         //                   child: Center(
//         //                       child: Text(
//         //                     "Next",
//         //                     style: TextStyle(
//         //                         color: Colors.white,
//         //                         fontSize: 22,
//         //                         fontWeight: FontWeight.bold),
//         //                   )),
//         //                 ),
//         //               ),
//         //             ],
//         //           ),
//         //         );
//         //       }
//         //       return SizedBox();
//         //     },
//         //   ),
//         // ),
//
//         body: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: BlocConsumer<ApplicationBloc, ApplicationState>(
//                   listener: (context, state) {
//                     // TODO: implement listener
//                   },
//                   builder: (context, state) {
//                     String? TrascriptimageUrl;
//                     String? SopimageUrl;
//                     String? LormageUrl;
//                     String? Englishtesturl;
//                     if (state is TranscriptUploaded) {
//                       TrascriptimageUrl = state.imageUrl;
//                       TrascriptimageUrl_global = TrascriptimageUrl;
//                     }
//
//                     if (state is SOPUploaded) {
//                       SopimageUrl = state.imageUrl;
//                       Sopimage_global = SopimageUrl;
//                     }
//                     if (state is LORUploaded) {
//                       LormageUrl = state.imageUrl;
//                       LORimage_global = LormageUrl;
//                     }
//                     if (state is Englishtestdocument) {
//                       Englishtesturl = state.imageUrl;
//                       Englishimage_global = Englishtesturl;
//                     }
//
//                     return ListView(
//                       children: [
//                         SectionHeader(title: 'Required Documents'),
//                         Text("Transcripts (High School, Undergraduate)",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w500)),
//                         Card(
//                           child: Container(
//                             height: 100,
//                             width: 300,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: state is TranscriptUploaded
//                                       ? Colors.green
//                                       : Colors.red,
//                                 ),
//                                 color: Colors.white),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: TrascriptimageUrl != null &&
//                                             TrascriptimageUrl.isNotEmpty
//                                         ? Image.network(
//                                             TrascriptimageUrl,
//                                             width: 100,
//                                             height: 100,
//                                             fit: BoxFit.fill,
//                                             errorBuilder:
//                                                 (context, error, stackTrace) {
//                                               return Container(
//                                                 width: 100,
//                                                 height: 100,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.grey[300],
//                                                 ),
//                                                 child: Icon(
//                                                   Icons.upload,
//                                                   size: 50,
//                                                   color: Colors.grey[600],
//                                                 ),
//                                               );
//                                             },
//                                           )
//                                         : Container(
//                                             width: 100,
//                                             height: 100,
//                                             decoration: BoxDecoration(
//                                               color: Colors.grey[300],
//                                             ),
//                                             child: Icon(
//                                               Icons.upload,
//                                               size: 40,
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                   ),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     context
//                                         .read<ApplicationBloc>()
//                                         .add(UploadUniversityphoto());
//                                   },
//                                   child: state is TranscriptionuploadLoading
//                                       ? Loading_Widget()
//                                       : (state is TranscriptUploaded
//                                           ? Text(
//                                               "Uploaded ✅",
//                                               style: TextStyle(
//                                                   color: Colors.green),
//                                             )
//                                           : Text("Upload Transcripts")),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         // // //////////////////////////////
//                         Text("Statement of Purpose (SOP)",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w500)),
//                         Card(
//                           child: Container(
//                             height: 100,
//                             width: 300,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: state is UploadSOPPhoto
//                                       ? Colors.green
//                                       : Colors.red,
//                                 ),
//                                 color: Colors.white),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: SopimageUrl != null &&
//                                             SopimageUrl.isNotEmpty
//                                         ? Image.network(
//                                             SopimageUrl,
//                                             width: 100,
//                                             height: 100,
//                                             fit: BoxFit.fill,
//                                             errorBuilder:
//                                                 (context, error, stackTrace) {
//                                               return Container(
//                                                 width: 100,
//                                                 height: 100,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.grey[300],
//                                                 ),
//                                                 child: Icon(
//                                                   Icons.upload,
//                                                   size: 50,
//                                                   color: Colors.grey[600],
//                                                 ),
//                                               );
//                                             },
//                                           )
//                                         : Container(
//                                             width: 100,
//                                             height: 100,
//                                             decoration: BoxDecoration(
//                                               color: Colors.grey[300],
//                                             ),
//                                             child: Icon(
//                                               Icons.upload,
//                                               size: 40,
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                   ),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     context
//                                         .read<ApplicationBloc>()
//                                         .add(UploadSOPPhoto());
//                                   },
//                                   child: state is SoploadLoading
//                                       ? Loading_Widget()
//                                       : (state is SOPUploaded
//                                           ? Text(
//                                               "Uploaded ✅",
//                                               style: TextStyle(
//                                                   color: Colors.green),
//                                             )
//                                           : Text("Upload SOP")),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         //
//                         // // //////////////////////////////
//                         Text("Letter of Recommendation (LOR)",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w500)),
//                         Card(
//                           child: Container(
//                             height: 100,
//                             width: 300,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: state is UploadLORPhoto
//                                       ? Colors.green
//                                       : Colors.red,
//                                 ),
//                                 color: Colors.white),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: LormageUrl != null &&
//                                             LormageUrl.isNotEmpty
//                                         ? Image.network(
//                                             LormageUrl,
//                                             width: 100,
//                                             height: 100,
//                                             fit: BoxFit.fill,
//                                             errorBuilder:
//                                                 (context, error, stackTrace) {
//                                               return Container(
//                                                 width: 100,
//                                                 height: 100,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.grey[300],
//                                                 ),
//                                                 child: Icon(
//                                                   Icons.upload,
//                                                   size: 50,
//                                                   color: Colors.grey[600],
//                                                 ),
//                                               );
//                                             },
//                                           )
//                                         : Container(
//                                             width: 100,
//                                             height: 100,
//                                             decoration: BoxDecoration(
//                                               color: Colors.grey[300],
//                                             ),
//                                             child: Icon(
//                                               Icons.upload,
//                                               size: 40,
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                   ),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     context
//                                         .read<ApplicationBloc>()
//                                         .add(UploadLORPhoto());
//                                   },
//                                   child: state is LorUploadLoading
//                                       ? Loading_Widget()
//                                       : (state is LORUploaded
//                                           ? Text(
//                                               "Uploaded ✅",
//                                               style: TextStyle(
//                                                   color: Colors.green),
//                                             )
//                                           : Text("Upload Transcripts")),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         // // //////////////////////////////
//                         Text("English Test Result (IELTS, TOEFL, PTE)",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w500)),
//                         Card(
//                           child: Container(
//                             height: 100,
//                             width: 300,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: state is Englishtest
//                                       ? Colors.green
//                                       : Colors.red,
//                                 ),
//                                 color: Colors.white),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Englishtesturl != null &&
//                                             Englishtesturl.isNotEmpty
//                                         ? Image.network(
//                                             Englishtesturl,
//                                             width: 100,
//                                             height: 100,
//                                             fit: BoxFit.fill,
//                                             errorBuilder:
//                                                 (context, error, stackTrace) {
//                                               return Container(
//                                                 width: 100,
//                                                 height: 100,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.grey[300],
//                                                 ),
//                                                 child: Icon(
//                                                   Icons.upload,
//                                                   size: 50,
//                                                   color: Colors.grey[600],
//                                                 ),
//                                               );
//                                             },
//                                           )
//                                         : Container(
//                                             width: 100,
//                                             height: 100,
//                                             decoration: BoxDecoration(
//                                               color: Colors.grey[300],
//                                             ),
//                                             child: Icon(
//                                               Icons.upload,
//                                               size: 40,
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                   ),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     context
//                                         .read<ApplicationBloc>()
//                                         .add(Englishtest());
//                                   },
//                                   child: state is EnglishtestUploadLoading
//                                       ? Loading_Widget()
//                                       : (state is Englishtest
//                                           ? Text(
//                                               "Uploaded ✅",
//                                               style: TextStyle(
//                                                   color: Colors.green),
//                                             )
//                                           : Text("Upload Transcripts")),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SuccessScreen(),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 51,
//                   width: 231,
//                   decoration: BoxDecoration(
//                       color: blueColor,
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Center(
//                       child: Text(
//                     "Next",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold),
//                   )),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
//
// class SectionHeader extends StatelessWidget {
//   final String title;
//   SectionHeader({required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Text(
//         title,
//         style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.blueAccent),
//       ),
//     );
//   }
// }
//
// class UploadTile extends StatelessWidget {
//   final String title;
//   UploadTile({required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       padding: EdgeInsets.all(12.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(Icons.upload, color: Colors.white),
//           ),
//           SizedBox(width: 12),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../Controller/Bloc/Applycourse/document_bloc.dart';

class Document_upload extends StatelessWidget {
  const Document_upload({super.key});

  Future<String?> _uploadFile(String fileType) async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      final file = result.files.single;
      final ref = FirebaseStorage.instance.ref(
          'documents/$fileType/${DateTime.now().millisecondsSinceEpoch}_${file.name}');
      await ref.putData(file.bytes!);
      return await ref.getDownloadURL();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DocumentBloc(),
      child: Scaffold(
          appBar: AppBar(title: const Text("Upload Documents")),
          body: BlocBuilder<DocumentBloc, DocumentState>(
            builder: (context, state) {
              String? transcriptUrl;
              String? sopUrl;
              String? lorUrl;
              String? englishTestUrl;

              if (state is DocumentsUploaded) {
                transcriptUrl = state.transcriptUrl;
                sopUrl = state.sopUrl;
                lorUrl = state.lorUrl;
                englishTestUrl = state.englishTestUrl;
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      UploadTile(
                        title: "Transcript",
                        uploaded: transcriptUrl != null,
                        fileUrl: transcriptUrl,
                        onTap: () async {
                          final url = await _uploadFile("transcript");
                          if (url != null) {
                            context
                                .read<DocumentBloc>()
                                .add(UploadTranscript(url));
                          }
                        },
                      ),
                      UploadTile(
                        title: "SOP",
                        uploaded: sopUrl != null,
                        fileUrl: sopUrl,
                        onTap: () async {
                          final url = await _uploadFile("sop");
                          if (url != null) {
                            context.read<DocumentBloc>().add(UploadSOP(url));
                          }
                        },
                      ),
                      UploadTile(
                        title: "LOR",
                        uploaded: lorUrl != null,
                        fileUrl: lorUrl,
                        onTap: () async {
                          final url = await _uploadFile("lor");
                          if (url != null) {
                            context.read<DocumentBloc>().add(UploadLOR(url));
                          }
                        },
                      ),
                      UploadTile(
                        title: "English Test",
                        uploaded: englishTestUrl != null,
                        fileUrl: englishTestUrl,
                        onTap: () async {
                          final url = await _uploadFile("englishTest");
                          if (url != null) {
                            context
                                .read<DocumentBloc>()
                                .add(UploadEnglishTest(url));
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Spacer(),
                      ElevatedButton(
                        onPressed: (transcriptUrl != null &&
                            sopUrl != null &&
                            lorUrl != null &&
                            englishTestUrl != null)
                            ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SuccessPage()),
                          );
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Apply Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

class UploadTile extends StatelessWidget {
  final String title;
  final bool uploaded;
  final String? fileUrl;
  final VoidCallback onTap;

  const UploadTile({
    required this.title,
    required this.uploaded,
    required this.onTap,
    required this.fileUrl,
    super.key,
  });

  bool _isImage(String? url) {
    if (url == null) return false;
    return url.endsWith(".jpg") ||
        url.endsWith(".jpeg") ||
        url.endsWith(".png") ||
        url.endsWith(".gif");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(uploaded ? "Uploaded ✅" : "Not Uploaded"),
            const SizedBox(height: 6),
            if (uploaded && _isImage(fileUrl))
              Image.network(
                fileUrl!,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              )
            else if (uploaded)
              const Text("📄 File uploaded"),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: uploaded ? Colors.green : Colors.grey,
              textStyle: TextStyle(color: Colors.white)),
          onPressed: onTap,
          child: Text(
            uploaded ? "Reupload" : "Upload",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success")),
      body: const Center(child: Text("Documents uploaded successfully ✅")),
    );
  }
}
