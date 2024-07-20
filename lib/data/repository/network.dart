// import 'package:dio/dio.dart';
// import 'package:film_search/data/network_service/network_service.dart';
//
// class Network {
// // вИДИМАЯ ЧАСТЬ:
//   // https://api.themoviedb.org/3/search/movie - main endPoint address of site slesh разветление по папкам
//   // ? - означает, что дальше идут параметры (REQUESTpARAM) как в методе (ВМЕСТО ЗАПЯТОЙ &).
//   // в основном сначала идет
//   // pathVariable пример ${id}  НО ИДЕТ ДО ЗНАКА ВОПРОСА КАК ЧАСТЬ ENDPOINT,
//   //
//   // Невидимая часть:
//   // headers
//   // body обычно в формате json\
//   // var example(String https://api.themoviedb.org, ){}
//
//   
//   var dio = NetworkService.instance.dio;
//
//   Network({required dio});
//
//   Future<Response?> getTopRateResponse() async {
//     var response = await dio.get(
//       'https://api.themoviedb.org/3/movie/top_rated?api_key=528c26f484fe1303f263b03c3b7bfcf6',
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json', // передаю тебе json
//           'Accept': 'application/json', // ожидаю от тебя json
//         },
//       ),
//     );
//     return response;
//   }
//
//   Future<Response?> getUpcomingResponse() async {
//     var res = await dio.get(
//       'https://api.themoviedb.org/3/movie/upcoming?api_key=528c26f484fe1303f263b03c3b7bfcf6',
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       ),
//     );
//     return res;
//   }
//
//   Future<Response?> getMovieByIdResponse(int id) async {
//     var res = await dio.get(
//       'https://api.themoviedb.org/3/movie/${id}?api_key=528c26f484fe1303f263b03c3b7bfcf6',
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       ),
//     );
//     return res;
//   }
//
//   Future<Response?> searchMovies(String query) async {
//     var res = await dio.get(
//       'https://api.themoviedb.org/3/search/movie?query=${query}&include_adult=false&language=en-US&page=1&api_key=528c26f484fe1303f263b03c3b7bfcf6',
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       ),
//     );
//     print(res.data['results']);
//     return res;
//   }
// }
