import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/services/http_util.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/main.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/pages/sign_in/repo/sign_in_repo.dart';
import 'package:ulearning_app/common/models/user.dart';

class SignInController {
  //WidgetRef ref;

  SignInController();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;
    // print('my email is $email');
    // print('my password is $password');

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      // final credential = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(email: email, password: password);

      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user == null) {
        toastInfo("User not found");
        return;
      }

      if (!credential.user!.emailVerified) {
        toastInfo("You must verify your email first !!");
        return;
      }

      var user = credential.user;

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;

        asyncPostAllData(loginRequestEntity);
        print("user logged in successfully  ");
      } else {
        toastInfo("Login error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo("User does not exist");
      } else if (e.code == 'wrong-password') {
        toastInfo("Your password is incorrect");
      } else if (e.code == 'invalid-credential') {
        toastInfo("Invalid credential");
      }
      print(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    //we need to talk to server
    var result = await SignInRepo.login(params: loginRequestEntity);
    if(result.code == 200){
      try {
      //var navigator = Navigator.of(ref.context);
      //try to remember user info
      // Global.storageServices
      //     .setString(AppConstants.STORAGE_USER_PROFILE_KEY, "Niranga");

      Global.storageServices.setString(
          AppConstants.STORAGE_USER_PROFILE_KEY,
          jsonEncode(result.data));
      Global.storageServices
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);

      //navigate to new page
      navKey.currentState
          ?.pushNamedAndRemoveUntil("/application", (route) => false);
      //navigator.push(MaterialPageRoute(builder: (BuildContext context)=>Scaffold(appBar: AppBar(),body: Application(),)));
      //navigator.pushNamed("/application");
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    }
    else{
    toastInfo("Failed to login");
  }
    //HttpUtil().post("api/login");
    //have local storage
    
    //redirect to new page
  }
}
