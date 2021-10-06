import 'package:get/get.dart';
import 'package:movies_app/app/auth/auth_service.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/repositories/movies/movies_repository.dart';
import 'package:movies_app/services/movies/movies_service.dart';

class FavoritesController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  FavoritesController(
      {required MoviesService moviesService, required AuthService authService})
      : _authService = authService,
        _moviesService = moviesService;

  var movies = <MovieModel>[].obs;
  @override
  Future<void> onReady() async {
    await getFavorites();
    super.onReady();
  }

  Future<void> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      var favorites = await _moviesService.getFavoritesMovies(user.uid);
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorites(MovieModel movieModel) async {
    var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavoriteMovie(
          user.uid, movieModel.copyWith(favorite: false));
      movies.remove(movieModel);
    }
  }
}
