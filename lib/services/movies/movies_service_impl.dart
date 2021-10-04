import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/repositories/movies/movies_repository.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;
  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() async =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() async =>
      _moviesRepository.getTopRated();

  @override
  Future<MovieDetailsModel?> getDetails(int id) =>
      _moviesRepository.getDetails(id);
}
