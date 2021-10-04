import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_app/app/modules/modules.dart';
import 'package:movies_app/modules/movie_details/movie_details_bindings.dart';
import 'package:movies_app/modules/movie_details/movie_details_page.dart';

class MovieDetailsModules extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
        name: '/movie/details',
        page: () => const MovieDetailsPage(),
        binding: MovieDetailsBindings())
  ];
}
