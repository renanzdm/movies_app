import 'package:get/get.dart';
import 'package:movies_app/app/auth/auth_service.dart';
import 'package:movies_app/app/rest_client/rest_client.dart';
import 'package:movies_app/repositories/login/login_repository.dart';
import 'package:movies_app/repositories/login/login_repository_impl.dart';
import 'package:movies_app/repositories/movies/movies_repository.dart';
import 'package:movies_app/repositories/movies/movies_repository_impl.dart';
import 'package:movies_app/services/login/login_service.dart';
import 'package:movies_app/services/login/login_service_impl.dart';
import 'package:movies_app/services/movies/movies_service.dart';
import 'package:movies_app/services/movies/movies_service_impl.dart';

class ApplicationBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find<LoginRepository>()),
        fenix: true);
  Get.lazyPut(() => AuthService());
  Get.lazyPut<RestClient>(() => RestClient());
  Get.lazyPut<MoviesRepository>(() => MoviesRepositoryImpl(restClient: Get.find<RestClient>()));
  Get.lazyPut<MoviesService>(() => MoviesServiceImpl(moviesRepository: Get.find<MoviesRepository>()));
  }
}
