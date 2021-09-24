import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:movies_app/app/rest_client/rest_client.dart';
import 'package:movies_app/models/movie_model.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;
  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient
        .get<List<MovieModel>>('/movie/popular', query: <String, String>{
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1'
    }, decoder: (data) {
      final results = data['results'];
      if (results != null) {
        return (results as List)
            .map<MovieModel>((e) => MovieModel.fromMap(e))
            .toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print('Deu erro ao buscar popular filmes');
      throw Exception('Erro ao buscar filmes populares');
    }
    return result.body ?? [];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
   final result = await _restClient
        .get<List<MovieModel>>('/movie/top_rated', query: <String, String>{
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1'
    }, decoder: (data) {
      final results = data['results'];
      if (results != null) {
        return (results as List)
            .map<MovieModel>((e) => MovieModel.fromMap(e))
            .toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print('Deu erro ao buscar  top rated filmes');
      throw Exception('Erro ao buscar filmes populares');
    }
    return result.body ?? [];
  }
}
