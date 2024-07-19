import 'package:film_search/domain/entity/genre/genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie(
      {required int id,
      required String title,
      required String overview,
      required double vote_average,
      required String? poster_path, // while it doesnt was nullable we have:
       // Error: Expected a value of type 'String', but got one of type 'Null'
      List<Genre>? genres
      }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
