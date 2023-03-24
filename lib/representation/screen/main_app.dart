import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  static const routeName = 'main_app';

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('Main App'),
      ),
    );
  }
}
