import 'package:flutter/cupertino.dart';

@immutable
sealed class AdminNotificationState {}

final class AdminNotificationInitial extends AdminNotificationState {}

final class NotificationInitial extends AdminNotificationState {}

class Loadingnotification extends AdminNotificationState {}

class NotificationSend_Loading extends AdminNotificationState {}

final class NotificationSend_Success extends AdminNotificationState {}

final class NotificationSend_message extends AdminNotificationState {
  String message;
  NotificationSend_message({required this.message});
}

class NotificationSend_Error extends AdminNotificationState {
  String error;
  NotificationSend_Error({required this.error});
}
//
class AdminNotificationLoaded extends AdminNotificationState {
  final List<Map<String, dynamic>> notifications;

  AdminNotificationLoaded(this.notifications);
}
//


final class NotificationDeleteSuccess extends AdminNotificationState {}

final class NotificationDeleteError extends AdminNotificationState {
  final String error;

  NotificationDeleteError({required this.error});
}
