import 'package:get/get.dart';
import 'package:movies_app/app/ui/messages/messages_mixin.dart';
import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/models/movie_model.dart';

import 'package:movies_app/services/genres/genres_service.dart';
import 'package:movies_app/services/movies/movies_service.dart';

class MoviesController extends GetxController with MessageMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final _messageErro = Rxn<MessageModel>();
  final genres = <GenresModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;
  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];
  final genreSelected = Rxn<GenresModel>();
  MoviesController({
    required MoviesService moviesService,
    required GenresService genresService,
  })  : _genresService = genresService,
        _moviesService = moviesService;

  @override
  void onInit() {
    messageListener(_messageErro);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    try {
      final genres = await _genresService.getGenres();
      this.genres.assignAll(genres);

      final popularMoviesData = await _moviesService.getPopularMovies();
      final topRatedMoviesData = await _moviesService.getTopRated();
      _popularMoviesOriginal = popularMoviesData;
      _topRatedMoviesOriginal = topRatedMoviesData;
      popularMovies.assignAll(popularMoviesData);
      topRatedMovies.assignAll(topRatedMoviesData);
    } on Exception catch (e) {
      _messageErro(MessageModel.error(
          title: 'Erro', message: 'Erro ao carregar dados da pagina'));
    }
    super.onReady();
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
    }else{
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }
}
