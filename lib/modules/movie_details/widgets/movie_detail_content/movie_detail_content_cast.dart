import 'package:flutter/material.dart';
import 'package:movies_app/app/ui/theme_extension.dart';
import 'package:movies_app/models/movie_details_model.dart';

import 'movie_cast.dart';

class MovieDetailContentCast extends StatefulWidget {
  final MovieDetailsModel? movie;

  const MovieDetailContentCast({Key? key, required this.movie})
      : super(key: key);

  @override
  State<MovieDetailContentCast> createState() => _MovieDetailContentCastState();
}

class _MovieDetailContentCastState extends State<MovieDetailContentCast> {
  bool showPanel = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        ExpansionPanelList(
          elevation: 0,
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (indexPanel, isExpanded) {
            setState(() {
              showPanel = !showPanel;
            });
          },
          children: [
            ExpansionPanel(
              canTapOnHeader: false,
              backgroundColor: Colors.white,
              isExpanded: showPanel,
              headerBuilder: (context, isExpanded) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Elenco:',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
              body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.movie?.cast
                            .map((e) => MovieCast(
                                  castModel: e,
                                ))
                            .toList() ??
                        []),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
