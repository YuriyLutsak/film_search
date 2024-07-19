part of 'single_movie_bloc.dart';

class SingleMovieState {
  final BlocStatus blocStatus;
  final Movie? movie;
  final String? error;

  SingleMovieState({
    required this.blocStatus,
    this.movie,
    this.error,
  });

  SingleMovieState copyWith({
    required BlocStatus blocStatus,
    Movie? movie,
    String? error,
  }) {
    return SingleMovieState(
      blocStatus: blocStatus,
      movie: movie ?? this.movie,
      error: error ?? this.error,
    );
  }
}
