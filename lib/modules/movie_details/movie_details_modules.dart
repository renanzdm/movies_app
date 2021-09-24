import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_app/app/modules/modules.dart';
import 'package:movies_app/modules/movie_details/movie_details_page.dart';
import 'package:movies_app/modules/movies/movies_bindings.dart';

class MovieDetailsModules extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
        name: '/movie/details',
        page: () => MovieDetailsPage(),
        binding: MoviesBindings())
  ];
}
