import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/bindings/application_bindings.dart';
import 'package:movies_app/app/ui/movies_app_ui_config.dart';
import 'package:movies_app/modules/home/home_module.dart';
import 'package:movies_app/modules/login/login_module.dart';
import 'package:movies_app/modules/splash/splash_module.dart';

import 'modules/movie_details/movie_details_modules.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
 await RemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MoviesAppUiConfig.title,
      initialBinding: ApplicationBindings(),
      theme: MoviesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailsModules().routers
      ],
    );
  }
}

