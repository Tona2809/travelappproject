import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelappproject/core/constants/textstyle.dart';
import 'package:travelappproject/core/helpers/asset_helper.dart';
import 'package:travelappproject/core/helpers/image_helper.dart';
import 'package:travelappproject/representation/screen/hotel_booking_screen.dart';
import 'package:travelappproject/representation/screen/hotel_screen.dart';

import '../../core/constants/dimension_constants.dart';
import '../widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> listImageLeft = [
    {
      'name': 'Hàn Quốc',
      'image': AssetHelper.korea,
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.dubai,
    },
  ];
  final List<Map<String, String>> listImageRight = [
    {
      'name': 'Thổ Nhĩ kì',
      'image': AssetHelper.turkey,
    },
    {
      'name': 'Nhật Bản',
      'image': AssetHelper.japan,
    },
  ];

  Widget _buildItemCategory(Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: kMediumPadding,
            ),
            child: icon,
            decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(kItemPadding)),
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Text(title)
        ],
      ),
    );
  }

  Widget _buidlImageHomScreen(String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(HotelScreen.routeName, arguments: name);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: kDefaultPadding),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.loadFromAsset(
              image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              radius: BorderRadius.circular(kItemPadding),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultTextStyle.whiteTextColor.bold,
                  ),
                  SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text('4.5')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'home',
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kItemPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi Song Toàn!', style: TextStyles.defaultTextStyle.fontHeader.whiteTextColor.bold),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Bạn muốn đến nơi nào?',
                  style: TextStyles.defaultTextStyle.fontCaption.whiteTextColor,
                )
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            SizedBox(
              width: kMinPadding,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  kItemPadding,
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(kItemPadding),
              child: ImageHelper.loadFromAsset(
                AssetHelper.person,
              ),
            ),
          ],
        ),
      ),
      implementLeading: false,
      child: Column(
        children: [
          TextField(
            enabled: true,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm địa điểm',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: 14,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kItemPadding,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: kItemPadding),
            ),
            style: TextStyles.defaultTextStyle,
            onChanged: (value) {},
            onSubmitted: (String submitValue) {},
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoHotel,
                      width: kDefaultIconSize,
                      height: kDefaultIconSize,
                    ),
                    Color(0xffFE9C5E),
                        () {
                      Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                    },
                    'Khách sạn'
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoPlane,
                      width: kDefaultIconSize,
                      height: kDefaultIconSize,
                    ),
                    Color(0xffF77777),
                        () {},
                    'Chuyến bay'
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoHotelPlane,
                      width: kDefaultIconSize,
                      height: kDefaultIconSize,
                    ),
                    Color(0xff3EC8BC),
                        () {},
                    'Tất cả'
                ),
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Row(
            children: [
              Text(
                'Địa điểm nổi tiếng',
                style: TextStyles.defaultTextStyle.bold,
              ),
              Spacer(),
              Text(
                'Xem tất cả',
                style: TextStyles.defaultTextStyle.bold.primaryTextColor,
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: listImageLeft
                          .map(
                            (e) => _buidlImageHomScreen(
                          e['name']!,
                          e['image']!,
                        ),
                      )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                    child: Column(
                      children: listImageRight
                          .map(
                            (e) => _buidlImageHomScreen(
                          e['name']!,
                          e['image']!,
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
