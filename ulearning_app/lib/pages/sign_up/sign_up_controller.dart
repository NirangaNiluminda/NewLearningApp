import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';
import 'package:ulearning_app/pages/sign_up/repo/sign_up_repo.dart';

class SignUpController {
  final WidgetRef ref;
  SignUpController({required this.ref});
  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }
    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your name is too short");
      return;
    }
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if ((state.password.isEmpty || state.rePassword.isEmpty) ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo("Your Password is not matches");
      return;
    }

    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo("Your Password is not matches");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);

    try {
      // final credential = await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(email: email, password: password);

      final credential = await SignUpRepo.firebaseSignUp(email, password);

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);

        toastInfo(
            "An email has been sent to verify your account. Please confirm your account");
        // Call pop() again if you need to navigate back
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo("Your password is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo("This email address is already been registred");
      } else if (e.code == 'user-not-found') {
        toastInfo("User not found");
      }
      print(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
