


import 'package:flutter/cupertino.dart';

import 'Property_Auth/Property_Model/PropertyModel.dart';

@immutable
sealed class PropertyAuthState {}
// import 'package:course_connect/Landlord/Controller2/Property/PropertyModel.dart';

final class PropertyInitial extends PropertyAuthState {}

final class PropertyLoading extends PropertyAuthState {}

final class PropertyaddSuccess extends PropertyAuthState{}
final class PropertyFailError extends PropertyAuthState {  //
  final String error;
  PropertyFailError(this.error);
}

final class PropertyLoaded extends PropertyAuthState {
  final List<PropertyModel> Property; //
  PropertyLoaded(this.Property);
}
final class RefreshProperty extends PropertyAuthState {}


