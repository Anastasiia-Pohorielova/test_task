import 'package:flutter/material.dart';
import 'package:test_task/res/app_consts.dart';
import 'package:test_task/ui/main_page.dart';

/// Material app widget
class Application extends StatelessWidget {

  ///Constructor of material app widget
  const Application({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConsts.appTitle,
      home: MainPage(),
    );
  }
}