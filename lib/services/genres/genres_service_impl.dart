import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/repositories/genres/genres_repository.dart';

import './genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;
  GenresServiceImpl({
    required GenresRepository genresRepository,
  }) : _genresRepository = genresRepository;

  @override
  Future<List<GenresModel>> getGenres() =>_genresRepository.getGenres();
  
}