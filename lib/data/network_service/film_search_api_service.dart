import 'package:dio/dio.dart';
import 'package:film_search/data/network_service/network_service.dart';

const String baseUrl = 'https://api.themoviedb.org/3';

Future<Response?> get(
  String path, {
  Map<String, dynamic>? queryParameters,
}) async {
  Response response = await NetworkService.instance.dio.get(
    '$baseUrl$path',
    queryParameters: queryParameters,
  );
}
