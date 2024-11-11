import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/home/view/home.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: const Home()),
    ];
  }

  static MaterialPageRoute generaterouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("Clicked route is ${settings.name}");
    }

    if (settings.name != null) {
      var results = routes().where((element) => element.path == settings.name);

      if (results.isNotEmpty) {
        //if we used this is first time or not

        bool deviseFirstTime = Global.storageServices.getDeviceFirstOpen();
        print(deviseFirstTime);
        if (results.first.path == AppRoutesNames.WELCOME && deviseFirstTime) {
          bool isLoggedIn = Global.storageServices.isLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(
            builder: (_) => const Application(),
            settings: settings,
          );
          }else{
            return MaterialPageRoute(
            builder: (_) => SignIn(),
            settings: settings,
          );
          }
          
        } else {
          if (kDebugMode) {
            print("App runs first");
          }

          return MaterialPageRoute(
            builder: (_) => results.first.page,
            settings: settings,
          );
        }
      }
    }

    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}
