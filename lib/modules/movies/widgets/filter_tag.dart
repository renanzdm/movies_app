import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/app/ui/theme_extension.dart';
import 'package:movies_app/models/genres_model.dart';

class FilterTag extends StatelessWidget {
  final GenresModel genresModel;
  final bool selected;
  final VoidCallback onPressed;
  const FilterTag(
      {Key? key,
      required this.genresModel,
      this.selected = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        constraints: const BoxConstraints(minHeight: 30, minWidth: 100),
        decoration: BoxDecoration(
            color: selected ? context.themeRed : Colors.black,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          genresModel.name,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        )),
      ),
    );
  }
}
