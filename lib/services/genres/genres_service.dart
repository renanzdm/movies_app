import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/repositories/genres/genres_repository.dart';

abstract class GenresService {
Future<List<GenresModel>> getGenres();




}
