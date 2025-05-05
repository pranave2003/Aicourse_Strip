import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controller/Bloc/Notification/admin_notification_bloc.dart';
import '../../Controller/Bloc/Notification/admin_notification_state.dart';
// Ensure this exists

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late AdminNotificationBloc _adminBloc;
  bool allRead = false;

  @override
  void initState() {
    super.initState();
    _adminBloc = AdminNotificationBloc();
    _adminBloc.add(FetchNotificationsEvent());
  }

  @override
  void dispose() {
    _adminBloc.close();
    super.dispose();
  }

  void markAllAsRead(List<Map<String, dynamic>> notifications) {
    setState(() {
      for (var notification in notifications) {
        notification['isRead'] = true;
      }
      allRead = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("All notifications marked as read.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _adminBloc,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("Notifications", style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.5,
          actions: [
            BlocBuilder<AdminNotificationBloc, AdminNotificationState>(
              builder: (context, state) {
                if (state is AdminNotificationLoaded) {
                  return TextButton(
                    onPressed: allRead ? null : () => markAllAsRead(state.notifications),
                    child: Text(
                      "Mark all as read",
                      style: TextStyle(
                        color: allRead ? Colors.grey[400] : Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
        body: BlocBuilder<AdminNotificationBloc, AdminNotificationState>(
          builder: (context, state) {
            if (state is Loadingnotification) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AdminNotificationLoaded) {
              final notifications = state.notifications;

              if (notifications.isEmpty) {
                return const Center(child: Text("No notifications"));
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  bool isFirstOfDate = index == 0 ||
                      notifications[index]['date'] != notifications[index - 1]['date'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isFirstOfDate)
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 8),
                          child: Text(
                            notifications[index]['date'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: notifications[index]['isRead'] == true
                              ? Colors.grey[200]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Text(
                            notifications[index]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: notifications[index]['isRead'] == true
                                  ? Colors.grey[600]
                                  : Colors.black,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              notifications[index]['message'],
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: notifications[index]['isRead'] == true
                                    ? Colors.grey[500]
                                    : Colors.black87,
                              ),
                            ),
                          ),
                          trailing: Text(
                            notifications[index]['time'],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (state is NotificationSend_Error) {
              return Center(child: Text("Error: ${state.error}"));
            } else {
              return const Center(child: Text("No data"));
            }
          },
        ),
      ),
    );
  }
}


// bool allRead = false;
  //
  // void markAllAsRead() {
  //   setState(() {
  //     for (var notification in notifications) {
  //       notification["isRead"] = true;
  //     }
  //     allRead = true;
  //   });
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text("All notifications marked as read."),
  //       duration: Duration(seconds: 2),
  //     ),
  //   );
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100], // Light background for a modern look
//       appBar: AppBar(
//         title: const Text("Notifications", style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0.5,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           TextButton(
//             onPressed: allRead ? null : markAllAsRead,
//             child: Text(
//               "Mark all as read",
//               style: TextStyle(
//                 color: allRead ? Colors.grey[400] : Colors.blue,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//         child: ListView.builder(
//           itemCount: notifications.length,
//           itemBuilder: (context, index) {
//             bool isFirstOfDate = index == 0 || notifications[index]['date'] != notifications[index - 1]['date'];
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (isFirstOfDate) // Show date header only if it's the first notification of the day
//                   Padding(
//                     padding: const EdgeInsets.only(top: 16, bottom: 8),
//                     child: Text(
//                       notifications[index]['date']!,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                   ),
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300), // Smooth transition
//                   margin: const EdgeInsets.only(bottom: 12),
//                   decoration: BoxDecoration(
//                     color: notifications[index]['isRead'] ? Colors.grey[200] : Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: ListTile(
//                     contentPadding: const EdgeInsets.all(16),
//                     title: Text(
//                       notifications[index]['title']!,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: notifications[index]['isRead'] ? Colors.grey[600] : Colors.black,
//                       ),
//                     ),
//                     subtitle: Padding(
//                       padding: const EdgeInsets.only(top: 6.0),
//                       child: Text(
//                         notifications[index]['message']!,
//                         style: TextStyle(
//                           fontSize: 14,
//                           height: 1.4,
//                           color: notifications[index]['isRead'] ? Colors.grey[500] : Colors.black87,
//                         ),
//                       ),
//                     ),
//                     trailing: Text(
//                       notifications[index]['time']!,
//                       style: TextStyle(
//                         color: Colors.grey[500],
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
