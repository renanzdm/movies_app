import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:movies_app/app/rest_client/rest_client.dart';
import 'package:movies_app/models/movie_details_model.dart';
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

  @override
  Future<MovieDetailsModel?> getDetails(int id) async {
    final result = await _restClient.get<MovieDetailsModel?>(
      '/movie/$id',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'append_to_response': 'images,credits',
        'include_image_language': 'en'
      },
      decoder: (data) {
        return MovieDetailsModel.fromMap(data);
      },
    );
    if (result.hasError) {
      print('Erro ao buscar detalhes do filme ${result.statusText}');
      throw Exception('Erro ao buscar detalhes do filme');
    }
    return result.body;
  }

  @override
  Future<void> addOrRemoveFavoriteMovie(
      String usertId, MovieModel movie) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorites')
          .doc(usertId)
          .collection('movies');
      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        var query = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();
        for (var element in query.docs) {
          element.reference.delete();
        }
      }
    } on Exception catch (e, s) {
      print('Erro ao buscar favoritos');
      print(s);
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritesMovies(String userId) async {
    var favoritesMovies = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('movies')
        .get();

    final listFavorites = <MovieModel>[];
    for (var item in favoritesMovies.docs) {
      listFavorites.add(MovieModel.fromMap(item.data()));
    }
    return listFavorites;
  }
}
