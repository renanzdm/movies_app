import 'package:get/get.dart';
import 'package:movies_app/app/auth/auth_service.dart';
import 'package:movies_app/app/ui/messages/messages_mixin.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/models/movie_model.dart';

import 'package:movies_app/services/genres/genres_service.dart';
import 'package:movies_app/services/movies/movies_service.dart';

class MoviesController extends GetxController with MessageMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;
  final _messageErro = Rxn<MessageModel>();
  final genres = <GenresModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;
  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];
  final genreSelected = Rxn<GenresModel>();
  MoviesController(
      {required MoviesService moviesService,
      required GenresService genresService,
      required AuthService authService})
      : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    messageListener(_messageErro);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getMovies();
    super.onReady();
  }

  Future<void> getMovies() async {
    try {
      final genres = await _genresService.getGenres();
      this.genres.assignAll(genres);

      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRated();
      final favorites = await getFavorites();
      popularMoviesData = popularMoviesData.map((e) {
        if (favorites.containsKey(e.id)) {
          return e.copyWith(favorite: true);
        } else {
          return e.copyWith(favorite: false);
        }
      }).toList();
      topRatedMoviesData = topRatedMoviesData.map((e) {
        if (favorites.containsKey(e.id)) {
          return e.copyWith(favorite: true);
        } else {
          return e.copyWith(favorite: false);
        }
      }).toList();

      _popularMoviesOriginal = popularMoviesData;
      _topRatedMoviesOriginal = topRatedMoviesData;
      popularMovies.assignAll(popularMoviesData);
      topRatedMovies.assignAll(topRatedMoviesData);
    } on Exception catch (e) {
      _messageErro(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dados da pagina'));
    }
  }

  void filterMovies(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((element) {
        return element.title.toLowerCase().contains(title.toLowerCase());
      });
      var newTopRatedMovies = _topRatedMoviesOriginal.where((element) {
        return element.title.toLowerCase().contains(title.toLowerCase());
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenresModel? genresModel) {
    var genreFilter = genresModel;
    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }
    genreSelected.value = genreFilter;
    if (genreFilter != null) {
      var newPopularMovies = _popularMoviesOriginal.where((element) {
        return element.genres.contains(genreFilter?.id);
      });
      var newTopRatedMovies = _topRatedMoviesOriginal.where((element) {
        return element.genres.contains(genreFilter?.id);
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavoriteMovie(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    final user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoritesMovies(user.uid);
      return <int, MovieModel>{for (var fav in favorites) fav.id: fav};
    }
    return {};
  }
}
