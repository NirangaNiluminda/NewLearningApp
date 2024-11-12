import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';

class AppOnboardingPage extends StatelessWidget {
  final PageController controller;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  final BuildContext context;
  const AppOnboardingPage({
    Key? key,
    required this.controller,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("inside AppOnpageController class...");
    return Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: text24Normal(text: title)),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text16Normal(text: subTitle),
        ),
        _nextButton(index, controller, context),
      ],
    );
  }
}

Widget appOnboardingPage(PageController controller,
    {required BuildContext context,
    String imagePath = "assets/images/reading.png",
    String title = "",
    String subTitle = "",
    index = 0}) {
  print("inside appOnpageController widget method");
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
          margin: const EdgeInsets.only(top: 10),
          child: text24Normal(text: title)),
      Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Text16Normal(text: subTitle),
      ),
      _nextButton(index, controller, context),
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // bool deviseFirstTime = Global.storageServices.getDeviceFirstOpen();
      // print("from tap ${deviseFirstTime}");
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      } else {
        //remember we are frist time or not
        Global.storageServices
            .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.pushNamed(
          context,
          "/signIn",
        );
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute<void>(
        //             builder: (BuildContext context) => const SignIn(),
        // ),);
      }
    },
    child: Container(
      width: 250,
      height: 40,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
      child: Center(
        child: Text(
          index == 3 ? "Get Started" : "Next",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
