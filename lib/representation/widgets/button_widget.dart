import 'package:flutter/material.dart';
import 'package:travelappproject/core/constants/color_constants.dart';
import 'package:travelappproject/core/constants/dimension_constants.dart';

import '../../core/constants/textstyle.dart';

class ItemButtonWidget extends StatelessWidget {
  const ItemButtonWidget({Key? key, required this.title, this.ontap})
      : super(key: key);
  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBg,
        ),
        // can chinh sang giua
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyles.defaultTextStyle.bold.whiteTextColor,
        ),
      ),
    );
  }
}
