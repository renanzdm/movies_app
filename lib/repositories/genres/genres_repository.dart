import 'package:movies_app/models/genres_model.dart';

abstract class GenresRepository {
  Future<List<GenresModel>> getGenres();
}