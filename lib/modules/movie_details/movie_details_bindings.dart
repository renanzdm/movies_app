import 'package:get/get.dart';
import 'package:movies_app/services/movies/movies_service.dart';

import './movie_details_controller.dart';

class MovieDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController(moviesService: Get.find<MoviesService>()));
  }
}
