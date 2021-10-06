import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies_app/models/movie_details_model.dart';

class MovieDetailContentProductionCompanies extends StatelessWidget {
  final MovieDetailsModel? movie;
  const MovieDetailContentProductionCompanies({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: 'Companhia`s e Produtoras: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
          children: [
            TextSpan(
              text: movie?.productionsCompany.join(', ') ?? '',
              style: const TextStyle(
                  color: Color(0xFF222222), fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
