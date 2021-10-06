import 'package:get/get.dart';
import 'package:movies_app/app/auth/auth_service.dart';
import 'package:movies_app/app/rest_client/rest_client.dart';
import 'package:movies_app/modules/movies/movies_controller.dart';
import 'package:movies_app/repositories/genres/genres_repository.dart';
import 'package:movies_app/repositories/genres/genres_repository_impl.dart';
import 'package:movies_app/services/genres/genres_service.dart';
import 'package:movies_app/services/genres/genres_service_impl.dart';
import 'package:movies_app/services/movies/movies_service.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find<RestClient>()));
    Get.lazyPut<GenresService>(
        () => GenresServiceImpl(genresRepository: Get.find()));
    Get.lazyPut(() => MoviesController(
        genresService: Get.find(),
        moviesService: Get.find<MoviesService>(),
        authService: Get.find<AuthService>()));
  }
}
