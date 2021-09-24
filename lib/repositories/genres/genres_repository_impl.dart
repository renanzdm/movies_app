import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:movies_app/app/rest_client/rest_client.dart';
import 'package:movies_app/models/genres_model.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;
  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenresModel>> getGenres() async {
    final result =
        await _restClient.get<List<GenresModel>>('/genre/movie/list', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language':'pt-br'
    }, decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        return resultData
            .map<GenresModel>((genres) => GenresModel.fromMap(genres))
            .toList();
      }
      return <GenresModel>[];
    });
    if (result.hasError) {
      print(result.statusText);
      throw Exception('Erro ao buscar genres');
    }
    return result.body ?? <GenresModel>[];
  }
}
