import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/app/ui/movies_app_icons_icons.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCard extends StatelessWidget {
  final dateFormat = DateFormat('y');
  final MovieModel model;
   MovieCard({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     const  _heightImage = 175.0;
    return InkWell(
      onTap: (){
        Get.toNamed('/movie/details',arguments: model.id);
      },
      child: SizedBox(
        
        width: 148,
        height: 280,
        child: Stack(
          children: [
            Padding(
              padding:const EdgeInsets.all(8),
              child: Column(
                children: [
                  PhysicalModel(
                    color:Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: model.posterPath,
                        width: 148,
                        height:_heightImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Text(
                    model.title,
                    maxLines: 1,
                    style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis),
                  ),
                   Text(
                   dateFormat.format(DateTime.parse(model.releaseDate)),
                      maxLines: 1,
                    style:const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize:12,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: _heightImage-135,
              right: 10,
              child: Material(
                elevation: 5,
                shape:const  CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    onPressed: () {},
                    iconSize: 13,
                    icon: const Icon(
                      MoviesAppIcons.heart,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
