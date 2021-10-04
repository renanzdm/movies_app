import 'package:get/get.dart';
import 'package:movies_app/app/ui/loader/loader_mixin.dart';
import 'package:movies_app/app/ui/messages/messages_mixin.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/services/movies/movies_service.dart';

class MovieDetailsController extends GetxController
    with LoaderMixin, MessageMixin {
  final MoviesService _moviesService;
  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movieDetails = Rxn<MovieDetailsModel>();

  MovieDetailsController({required MoviesService moviesService})
      : _moviesService = moviesService;

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailsData = await _moviesService.getDetails(movieId);
      movieDetails(movieDetailsData);
      loading(false);
    } on Exception catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Erros', message: 'Erro ao buscar detalhess do filme'));
    }
  }
}
