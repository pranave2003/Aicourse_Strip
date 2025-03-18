
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Notifications(),
    );
  }
}

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Map<String, dynamic>> notifications = [
    {
      "title": "Check-in & Check-out Alerts",
      "message": "Your check-in at Portchester House is tomorrow!",
      "time": "8:30 PM",
      "date": "Today, Feb 23",
      "isRead": false
    },
    {
      "title": "Booking Confirmation",
      "message": "Your stay at Portchester House near Victoria University has been confirmed!",
      "time": "8:30 PM",
      "date": "Today, Feb 23",
      "isRead": false
    },
    {
      "title": "Application Received",
      "message": "We've received your application! Stay tuned for updates.",
      "time": "8:30 PM",
      "date": "Yesterday, Feb 22",
      "isRead": false
    },
    {
      "title": "Deadline Reminder",
      "message": "The deadline for submitting your documents is approaching!",
      "time": "8:30 PM",
      "date": "Yesterday, Feb 22",
      "isRead": false
    }
  ];

  bool allRead = false;

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification["isRead"] = true;
      }
      allRead = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All notifications marked as read."),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for a modern look
      appBar: AppBar(
        title: const Text("Notifications", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: allRead ? null : markAllAsRead,
            child: Text(
              "Mark all as read",
              style: TextStyle(
                color: allRead ? Colors.grey[400] : Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            bool isFirstOfDate = index == 0 || notifications[index]['date'] != notifications[index - 1]['date'];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isFirstOfDate) // Show date header only if it's the first notification of the day
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      notifications[index]['date']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300), // Smooth transition
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: notifications[index]['isRead'] ? Colors.grey[200] : Colors.white,
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
                      notifications[index]['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: notifications[index]['isRead'] ? Colors.grey[600] : Colors.black,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        notifications[index]['message']!,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: notifications[index]['isRead'] ? Colors.grey[500] : Colors.black87,
                        ),
                      ),
                    ),
                    trailing: Text(
                      notifications[index]['time']!,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
