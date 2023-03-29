import 'package:flutter/material.dart';
import 'package:travelappproject/core/constants/dimension_constants.dart';
import 'package:travelappproject/core/extensions/date_extension.dart';
import 'package:travelappproject/core/helpers/asset_helper.dart';
import 'package:travelappproject/representation/screen/hotel_screen.dart';
import 'package:travelappproject/representation/widgets/app_bar_container.dart';

import '../widgets/item_button_widget.dart';
import '../widgets/item_option_booking.dart';
import 'date_select_screen.dart';

class HotelBookingScreen extends StatefulWidget {
  HotelBookingScreen({Key? key, this.destination}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';
  final String? destination;

  @override
  State<StatefulWidget> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? selectDate;
  String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Hotel Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemOptionBookingWidget(
              title: 'Destination',
              value: widget.destination ?? 'Viet Nam',
              icon: AssetHelper.icoLocation,
              onTap: () {},
            ),
            ItemOptionBookingWidget(
              title: 'Select Date',
              value: selectDate ?? 'Select date',
              icon: AssetHelper.icoCalendal,
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                if (result is List<DateTime?>) {
                  setState(() {
                    selectDate = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  });
                }
              },
            ),
            // ItemOptionBookingWidget(
            //   title: 'Guest and Room',
            //   value: guestAndRoom ?? 'Guest and Room',
            //   icon: AssetHelper.icoBed,
            //   onTap: () async {
            //     final result = await Navigator.of(context).pushNamed(GuestAndRoomScreen.routeName);
            //     if (result is List<int>) {
            //       setState(() {
            //         guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
            //       });
            //     }
            //   },
            // ),
            ItemButtonWidget(
              data: 'Search',
              onTap: () {
                Navigator.of(context).pushNamed(HotelScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
