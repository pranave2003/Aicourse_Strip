import 'package:course_connect/Controller/Bloc/Notification/NotificationModel/NotificationModel.dart';
import 'package:course_connect/Controller/Bloc/Notification/admin_notification_bloc.dart';
import 'package:course_connect/Controller/Bloc/Notification/admin_notification_state.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widget/Constands/colors.dart';

class Admin_SendNotification extends StatefulWidget {
  const Admin_SendNotification({super.key});

  @override
  State<Admin_SendNotification> createState() => _Admin_SendNotificationState();
}

class _Admin_SendNotificationState extends State<Admin_SendNotification> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  AdminNotificationBloc adminnoti = AdminNotificationBloc();
  DateTime now = DateTime.now();


  // void _sendNotification() {
  //
  //
  //   String notificationDate =
  //       "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";
  //   String notificationTime =
  //       "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  //
  //   print('NotificationDate: "$notificationDate"');
  //   print('NotificationTime: "$notificationTime"');
  // }

  @override
  void initState() {
    super.initState();
    context.read<AdminNotificationBloc>().add(FetchNotificationsEvent());
  }


  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Notification'),
        centerTitle: true,
        backgroundColor: blueColor,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Colors.grey[50],
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Notification Details Card
                    Card(
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Notification Details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _titleController,
                              decoration: InputDecoration(
                                labelText: 'Notification Title',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: const Icon(Icons.title),
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Enter title'
                                      : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _contentController,
                              maxLines: 5,
                              decoration: InputDecoration(
                                labelText: 'Notification Content',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: const Icon(Icons.message),
                                alignLabelWithHint: true,
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Enter content'
                                      : null,
                            ),
                            const SizedBox(height: 16),
                            // DropdownButtonFormField<String>(
                            //   value: _selectedPriority,
                            //   decoration: InputDecoration(
                            //     labelText: 'Priority',
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(8),
                            //     ),
                            //     prefixIcon: const Icon(Icons.priority_high),
                            //   ),
                            //   items: ['Low', 'Normal', 'High', 'Urgent']
                            //       .map((priority) => DropdownMenuItem(
                            //     value: priority,
                            //     child: Text(priority),
                            //   ))
                            //       .toList(),
                            //   onChanged: (value) {
                            //     if (value != null) {
                            //       setState(() {
                            //         _selectedPriority = value;
                            //       });
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Send Button
                    BlocConsumer<AdminNotificationBloc, AdminNotificationState>(
                      listener: (context, state) {
                        if (state is NotificationSend_message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                state.message,
                                style: TextStyle(color: Colors.white),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.send),
                            label: state is NotificationSend_Loading
                                ? Loading_Widget()
                                : Text(
                                    'Send Notification',
                                    style: TextStyle(fontSize: 16),
                                  ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final Notification = Notificationmodel(
                                    NotificationContent:
                                        _contentController.text.trim(),
                                    NotificationDate:
                                        "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}",
                                    NotificationTime:
                                        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}",
                                    NotificationMatter:
                                        _titleController.text.trim());
                                context.read<AdminNotificationBloc>()
                                  ..add(SendNotification_event(
                                      nofification: Notification));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blueColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 400,
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child:  Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: BlocBuilder<AdminNotificationBloc, AdminNotificationState>(
                            builder: (context, state) {
                              if (state is Loadingnotification) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is AdminNotificationLoaded) {
                                final notifications = state.notifications;

                                if (notifications.isEmpty) {
                                  return const Center(
                                      child: Text("No notifications"));
                                }
                                return ListView.builder(
                                  itemCount: notifications.length,
                                  itemBuilder: (context, index) {
                                    final notification = notifications[index];
                                    return Card(
                                      child: ListTile(
                                        title: Text(notification['title']),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(notification['message']),
                                            const SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Date: ${notification['date']}",
                                                      style: const TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    Text(
                                                      "Time: ${notification['time']}",
                                                      style: const TextStyle(
                                                          color: Colors.green),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            final id = notification['id'];
                                            context.read<AdminNotificationBloc>().add(DeleteNotificationEvent(id: id));
                                          },
                                          icon: Icon(Icons.delete, color: Colors.red),
                                        ),

                                      ),
                                    );
                                  },
                                );
                              } else if (state is NotificationSend_Error) {
                                return Center(
                                    child: Text("Error: ${state.error}"));
                              } else {
                                return const Center(
                                    child: Text("No data available"));
                              }
                            }                 ),
                      ),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
