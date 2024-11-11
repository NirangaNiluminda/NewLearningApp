import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/common/services/storage.dart';
import 'package:ulearning_app/firebase_options.dart';

class Global {
  static late StorageServices storageServices;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Access the static getter directly from the class
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    storageServices =
        await StorageServices().init(); // This now calls the init method
  }

  
}
