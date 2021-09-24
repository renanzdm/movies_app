import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(Rx<bool> loaderRx) {
    ever<bool>(
      loaderRx,
      (loading) async {
        if (loading) {
          await Get.dialog(
              const Center(
                child: CircularProgressIndicator(),
              ),
              barrierDismissible: false);
        } else {
          Get.back();
        }
      },
    );
  }
}
