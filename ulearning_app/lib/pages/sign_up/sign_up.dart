import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';
import 'package:ulearning_app/pages/sign_up/sign_up_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(title: "Sign Up"),
          backgroundColor: Colors.white,
          body: !loader
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      const Center(
                        child: Text14Normal(
                            text: "Enter your details below & sign up free"),
                      ),
                      SizedBox(height: 50.h),
                      appTextField(
                          text: "User Name",
                          iconName: ImageRes.user,
                          hintText: "Enter your user name",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserNameChange(value)),
                      SizedBox(height: 20.h),
                      appTextField(
                          text: "Email",
                          iconName: ImageRes.user,
                          hintText: "Enter your email Address",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserEmailChange(value)),
                      SizedBox(height: 20.h),
                      appTextField(
                          text: "Password",
                          iconName: ImageRes.lock,
                          hintText: "Enter your Password",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUserPasswordChange(value),
                          obscureText: true),
                      SizedBox(height: 20.h),
                      appTextField(
                          text: "Confirm Password",
                          iconName: ImageRes.lock,
                          hintText: "Confirm your Password",
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onUerRePasswordChange(value),
                          obscureText: true),
                      SizedBox(height: 20.h),
                      Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: const Text14Normal(
                            text:
                                "By creating an account you are agreeing with our terms and conditions "),
                      ),
                      SizedBox(height: 100.h),
                      Center(
                        child: AppButton(
                          buttonName: "Sign Up",
                          isLogin: true,
                          context: context,
                          func: () => _controller.handleSignUp(),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.blue,
                    // color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
