part of 'Property_auth_block.dart';

@immutable
sealed class PropertyAuthEvent {}

class Property_Add_Event extends PropertyAuthEvent {
  final PropertyModel Property;
  Property_Add_Event({required this.Property});
}
