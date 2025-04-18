part of 'coursefinder_block.dart';

sealed class CoursefinderEvent {}



class FetchAllUniversites extends CoursefinderEvent {
  final String? searchQuery;
  FetchAllUniversites({required this.searchQuery});
}

