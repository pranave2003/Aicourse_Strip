


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
final class Propertygetloading extends PropertyAuthState {}

final class Propertyfailerror extends PropertyAuthState {
  final String error;

  Propertyfailerror(this.error);
}
// final class PropertyLoadingstate extends PropertyAuthState {
//   final Property_Model property;
//   PropertyLoadingstate(this.property);
// }
final class PropertyLoaded extends PropertyAuthState {
  final List<Property_Model> Property; //
  PropertyLoaded(this.Property);
}

final class PropertyLoadedbyid extends PropertyAuthState {
  final Property_Model Property; //
  PropertyLoadedbyid(this.Property);
}
final class RefreshProperty extends PropertyAuthState {}


