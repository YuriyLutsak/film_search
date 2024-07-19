part of 'up_coming_bloc.dart';

class UpComingState {
  final BlocStatus blocStatus;
  final List<Movie>? movies;
  final String? error;

  UpComingState({required this.blocStatus, this.movies, this.error});

  UpComingState copyWith(
      {required BlocStatus blocStatus, List<Movie>? movies, String? error}) {
    return UpComingState(
        blocStatus: blocStatus,
        movies: movies ?? this.movies,
        error: error ?? this.error);
  }
}
