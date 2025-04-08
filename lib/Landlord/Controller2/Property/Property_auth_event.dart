part of 'Property_auth_block.dart';

@immutable
sealed class PropertyAuthEvent {}

class Property_Add_Event extends PropertyAuthEvent {
  final Property_Model Property;
  Property_Add_Event({required this.Property});
}
class FetchProperty extends PropertyAuthEvent {
  final String? searchQuery;
  FetchProperty({required this.searchQuery});
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
