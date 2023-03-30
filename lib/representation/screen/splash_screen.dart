import 'package:flutter/material.dart';
import 'package:travelappproject/core/helpers/asset_helper.dart';
import 'package:travelappproject/core/helpers/image_helper.dart';
import 'package:travelappproject/core/helpers/local_storage_helper.dart';
import 'package:travelappproject/representation/screen/intro_screen.dart';
import 'package:travelappproject/representation/screen/login_screen.dart';
import 'package:travelappproject/representation/screen/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // Createe String routeName call splash_screen
  static String routeName = '/splash_screen';

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectIntroScreen();
    // khi vong doi cua flutter nhay vao initeState thi no se chay vao redirectIntroScreen sau do no se render ra giao dien
  }
  //Future delay 2s
  void redirectIntroScreen() async {
    //tao 1 bien kiem tra bo qua Intro screen
    final ignoreIntro = LocalStorageHelper.getValue('ignoreIntro') as bool?;
    await Future.delayed(const Duration(seconds: 2));
    //delay in 2s
    // kiem tra neu bien ignore la false
    if(ignoreIntro ?? false) {
      // dieu huong den trang main app
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    }
    else {
      // set Value cho bien ignoreIntro bang true thong qua class Local su dung Singleton
      LocalStorageHelper.setValue('ignoreIntro', true);
      // dieu huong den tra intro screen
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // tra ve stack cua hai anh filter ve cai iamge backroun va vong trong circle iamge nho hon
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.imageBackgroundSplashScreen,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.imageCircleSplashScreen,
          ),
        ),
      ],
    );
  }
}
