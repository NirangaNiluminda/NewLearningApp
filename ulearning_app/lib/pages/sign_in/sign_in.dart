import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    //Future.delayed(Duration(seconds: 0), () {
    _controller = SignInController();
    //});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    print(signInProvider.email);
    print(signInProvider.password);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(title: "Sign In"),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      thirdPartyLogin(),

                      // Additional login message
                      const Center(
                        child: Text14Normal(
                          text: "Or use your email account to login",
                        ),
                      ),
                      SizedBox(height: 50.h),
                      appTextField(
                        controller: _controller.emailController,
                        text: "Email",
                        iconName: ImageRes.user,
                        hintText: "Enter your email Address",
                        func: (value) => ref
                            .read(signInNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),
                      SizedBox(height: 20.h),
                      appTextField(
                          controller: _controller.passwordController,
                          text: "Password",
                          iconName: ImageRes.lock,
                          hintText: "Enter your Password",
                          obscureText: true,
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onUserPasswordChange(value)),
                      SizedBox(height: 20.h),
                      Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: textUnderline(text: "Forgot Password"),
                      ),
                      SizedBox(height: 100.h),
                      // Login button
                      Center(
                        child: appButton(
                          buttonName: "Login",
                          func: () => _controller.handleSignIn(ref),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // Register button
                      Center(
                        child: appButton(
                          buttonName: "Register",
                          isLogin: false,
                          context: context,
                          func: () {
                            Navigator.pushNamed(context, "/register");
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.blue,
                    // color: Colors.black,
                  ),
                ),
        ),
      ),
    );
  }
}
