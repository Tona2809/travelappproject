import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelappproject/core/constants/dimension_constants.dart';
import 'package:travelappproject/core/constants/textstyle.dart';
import 'package:travelappproject/core/helpers/asset_helper.dart';
import 'package:travelappproject/core/helpers/image_helper.dart';
import 'package:travelappproject/representation/screen/main_app.dart';
import 'package:travelappproject/representation/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static String routeName = '/intro_screen';

  @override
  State<StatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _builtItemIntroScreen(
                AssetHelper.slide1,
                "Đặt vé máy bay",
                "Tìm thấy một chuyến bay phù hợp với điểm đến và lịch trình của bạn? Đặt nó ngay lập tức",
                Alignment.centerRight,
              ),
              _builtItemIntroScreen(
                AssetHelper.slide2,
                "Tìm phòng khách sạn",
                "Chọn ngày, đặt phòng. Chúng tôi cung cấp cho bạn giá tốt nhất.",
                Alignment.center,
              ),
              _builtItemIntroScreen(
                AssetHelper.slide3,
                "Tận hưởng chuyến đi nhé",
                "Dễ dàng khám phá những địa điểm mới và chia sẻ những địa điểm này với bạn bè của bạn và cùng nhau đi du lịch.",
                Alignment.centerLeft,
              ),
            ],
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child:
                      // cai btn chuyen sang tung page voi mau xanh
                      SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.blueAccent,
                    ),
                  ),
                ),
                StreamBuilder<Object>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 4,
                        child: ItemButtonWidget(
                          title: snapshot.data != 2 ? "Tiếp theo" : "Bắt đầu",
                          ontap: () {
                            //check điều kiện nếu trang này ko phải trang số 2
                            if (_pageController.page != 2) {
                              // chuyển sang trang tiếp theo trong 350ms
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 350),
                                  curve: Curves.easeIn);
                            } else {
                              // chuyen huong sang main app
                              Navigator.of(context).pushNamed(MainApp.routeName);
                            }
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _builtItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignmentGeometry) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: ImageHelper.loadFromAsset(
            image,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kMediumPadding,
          ),
          child: Column(
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
