import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movie_details_controller.dart';

class MovieDetailsPage extends GetView<MovieDetailsController> {
    
    const MovieDetailsPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('MovieDetailsPage'),),
            body: Container(),
        );
    }
}