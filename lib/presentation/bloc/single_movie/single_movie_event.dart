part of 'single_movie_bloc.dart';

@immutable
sealed class SingleMovieEvent {}

class GetSingleMovieEvent extends SingleMovieEvent {
  final int id;

  GetSingleMovieEvent({required this.id});
}
