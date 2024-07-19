// part of 'search_bloc.dart';
//
// @immutable
// sealed class SearchEvent {}
//
// class GetSearchEvent extends SearchEvent {
//   final String query;
//
//   GetSearchEvent({required this.query});
// }

part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class GetSearchEvent extends SearchEvent {
  final String query;

  GetSearchEvent({required this.query});
}
