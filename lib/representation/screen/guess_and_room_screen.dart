import 'package:flutter/material.dart';
import 'package:travelappproject/core/constants/dimension_constants.dart';
import 'package:travelappproject/representation/widgets/app_bar_container.dart';

import '../../core/helpers/asset_helper.dart';
import '../widgets/item_button_widget.dart';
import '../widgets/item_change_guest_and_room_widget.dart';

class RoomAndGuessScreen extends StatefulWidget {
  const RoomAndGuessScreen({Key? key}) : super(key: key);
  static const String routeName = '/guest_and_room_screen';

  @override
  State<StatefulWidget> createState() => _RoomAndGuessScreenState();
}

class _RoomAndGuessScreenState extends State<RoomAndGuessScreen> {
  final GlobalKey<ItemChangeGuessAndRoomState> _itemCountGuest =
      GlobalKey<ItemChangeGuessAndRoomState>();
  final GlobalKey<ItemChangeGuessAndRoomState> _itemCountRoom =
      GlobalKey<ItemChangeGuessAndRoomState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBarContainer(
      titleString: 'Add Guess and Room',
      paddingContent: EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding,
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountGuest,
            initData: 1,
            icon: AssetHelper.icoGuest,
            value: 'Guest',
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountRoom,
            initData: 1,
            icon: AssetHelper.icoRoom,
            value: 'Room',
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ItemButtonWidget(
            data: 'Done',
            onTap: () {
              Navigator.of(context).pop([
                _itemCountGuest.currentState!.number,
                _itemCountRoom.currentState!.number,
              ]);
            },
          ),
        ],
      ),
    );
  }
}
