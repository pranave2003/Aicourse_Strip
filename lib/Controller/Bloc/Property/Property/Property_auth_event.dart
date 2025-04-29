part of 'Property_auth_block.dart';

@immutable
sealed class PropertyAuthEvent {}

class Property_Add_Event extends PropertyAuthEvent {
  final Property_Model Property;
  Property_Add_Event({required this.Property});
}

class FetchProperty extends PropertyAuthEvent {
  final String? searchQuery;
  final String? landlordid;
  final String? Universityname;
  FetchProperty({required this.searchQuery, this.landlordid,this.Universityname});
}

class FetchPropertyDetailsById extends PropertyAuthEvent {
  final String? Property_id;
  FetchPropertyDetailsById({required this.Property_id});
}

class Property_Edit_Event extends PropertyAuthEvent {
  final Property_Model Property;

  Property_Edit_Event({required this.Property});
}

class DeleteProperty extends PropertyAuthEvent {
  final String? Property_id;

  DeleteProperty({required this.Property_id});
}

class UploadImagesEvent extends PropertyAuthEvent {
  final List<PlatformFile> files;

  UploadImagesEvent(this.files);

  List<Object?> get props => [files];
}
//event//

class UserSendreviewandratingevent extends PropertyAuthEvent {
  final String? id;
  final String? Review;
  final String? Ratingstatus;
  UserSendreviewandratingevent(
      {required this.id,
        this.Review,
        this.Ratingstatus,});
}
