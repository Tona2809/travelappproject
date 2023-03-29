import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle.dart';
import '../../core/helpers/image_helper.dart';

class ItemOptionBookingWidget extends   StatelessWidget {
  const ItemOptionBookingWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String value;
  final String icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kTopPadding),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(bottom: kMediumPadding),
        child: Row(
          children: [
            ImageHelper.loadFromAsset(
              icon,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.defaultTextStyle.fontCaption,
                ),
                SizedBox(
                  height: kMinPadding,
                ),
                Text(
                  value,
                  style: TextStyles.defaultTextStyle.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  
}