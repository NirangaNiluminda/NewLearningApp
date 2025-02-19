import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/pages/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(),
      activeIcon: _bottomContainer(color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Home"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.search),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.search,
          color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Search"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.play),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.play,
          color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Play"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.message),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.message,
          color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Message"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.profilePhoto),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.profilePhoto,
          color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Profile"),
];

Widget _bottomContainer(
    {double width = 15,
    double height = 15,
    String imagePath = ImageRes.home,
    Color color = AppColors.primaryFourElementText}) {
  return SizedBox(
    width: 15.w,
    height: 15.w,
    child: appImageWithColor(imagePath: imagePath, color: color),
  );
}

Widget appScreens({int index = 0}) {
  List<Widget> _screens = [
    const Home(),
    Center(child: AppImage(imagePath: ImageRes.search ,width: 250, height: 250),),
    Center(child: AppImage(imagePath: ImageRes.play ,width: 250, height: 250),),
    Center(child: AppImage(imagePath: ImageRes.message,width: 250, height: 250),),
    Center(child: AppImage(imagePath: ImageRes.profilePhoto,width: 250, height: 250),),
  ];
  return _screens[index];
}
