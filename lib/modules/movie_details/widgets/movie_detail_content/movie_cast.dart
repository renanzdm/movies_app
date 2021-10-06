import 'package:flutter/material.dart';
import 'package:movies_app/app/ui/theme_extension.dart';
import 'package:movies_app/models/cast_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCast extends StatelessWidget {
  final CastModel? castModel;
  const MovieCast({Key? key, this.castModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: castModel?.image ?? '',
              width: 85,
              height: 85,
              imageErrorBuilder: (context, obj, s) {
                return const Placeholder(
                  fallbackHeight: 85,
                  fallbackWidth: 85,
                );
              },
              fit: BoxFit.cover,
            ),
          ),
          Text(
            castModel?.name ?? '',
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
          Text(
            castModel?.character ?? '',
            style: TextStyle(fontSize: 11, color: context.themeGrey),
          )
        ],
      ),
    );
  }
}
