import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/modules/movies/movies_controller.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 196,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          ),
        Container(
          padding:const EdgeInsets.only(bottom: 15),
          width: Get.width *.9,
          child:   TextField(
            onChanged: (value)=>controller.filterMovies(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32)
                ),
                fillColor: Colors.white,
                filled:true,
                label:const Text('Search movies'),
                labelStyle:const TextStyle(fontSize: 15,color: Colors.grey),
                prefixIcon:const Icon(Icons.search),
                contentPadding: EdgeInsets.zero,
                floatingLabelBehavior: FloatingLabelBehavior.never
              ),
            ),
        )
        ],
      ),
    );
  }
}
