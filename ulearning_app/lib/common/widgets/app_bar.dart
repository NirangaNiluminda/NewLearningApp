import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
/*prefered size method done is created the empty space and in the child write the text upside*/
AppBar buildAppBar({String title=""}) {
  return AppBar(
    bottom: PreferredSize(
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
      preferredSize: Size.fromHeight(1),
    ),
    title: text16Normal(text: title, color: AppColors.primaryText),
  );
}