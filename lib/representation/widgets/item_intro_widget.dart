import 'package:flutter/material.dart';
import 'package:travelappproject/core/constants/dimension_constants.dart';
import 'package:travelappproject/core/constants/textstyle.dart';
import 'package:travelappproject/core/helpers/image_helper.dart';

class ItemIntroWidget extends StatelessWidget {
  const ItemIntroWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.sourceImage,
      required this.alignmentGeometry})
      : super(key: key);

  final String title;
  final String description;
  final String sourceImage;
  final AlignmentGeometry alignmentGeometry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: alignmentGeometry,
          child: ImageHelper.loadFromAsset(sourceImage,
              height: 400, fit: BoxFit.fitHeight),
        ),
        SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultTextStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultTextStyle,
              )
            ],
          ),
        ),
      ],
    );
  }
}
