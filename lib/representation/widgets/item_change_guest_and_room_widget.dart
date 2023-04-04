import 'package:flutter/material.dart';
import 'package:travelappproject/core/constants/dimension_constants.dart';
import 'package:travelappproject/core/helpers/asset_helper.dart';
import 'package:travelappproject/core/helpers/image_helper.dart';

class ItemChangeGuestAndRoom extends StatefulWidget {
  const ItemChangeGuestAndRoom({Key? key, this.initData = 0, required this.icon, required this.value})
      : super(key: key);

  final int initData;
  final String icon;
  final String value;

  @override
  State<StatefulWidget> createState() => ItemChangeGuessAndRoomState();
}

class ItemChangeGuessAndRoomState extends State<ItemChangeGuestAndRoom> {
  late final TextEditingController textEditingController;

  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController =
        TextEditingController(text: widget.initData.toString())
          ..addListener(() {
            number = int.parse(textEditingController.text);
          });
    number = widget.initData;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kTopPadding),
            color: Colors.white),
        margin: EdgeInsets.only(bottom: kMediumPadding),
        padding: EdgeInsets.all(kMediumPadding),
        child: Row(
          children: [
            ImageHelper.loadFromAsset(
              widget.icon,
            ),
            SizedBox(
              width: kMediumPadding,
            ),
            Text(widget.value),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (number > 1) {
                  setState(() {
                    number--;
                    textEditingController.text = number.toString();
                    if (_focusNode.hasFocus) {
                      _focusNode.unfocus();
                    }
                  });
                }
              },
              child: ImageHelper.loadFromAsset(
                AssetHelper.icoDecre,
              ),
            ),
            Container(
              height: 35,
              width: 60,
              padding: EdgeInsets.only(left: 3),
              alignment: Alignment.center,
              child: TextField(
                controller: textEditingController,
                textAlign: TextAlign.center,
                focusNode: _focusNode,
                enabled: true,
                autocorrect: false,
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                    bottom: 18,
                  ),
                ),
                onChanged: (value) {},
                onSubmitted: (String submitValue) {},
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  number++;
                  textEditingController.text = number.toString();
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                });
              },
              child: ImageHelper.loadFromAsset(AssetHelper.icoIncre),
            ),
          ],
        ),
      );
    });
  }
}
