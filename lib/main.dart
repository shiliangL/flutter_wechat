import 'package:flutter/material.dart';
import 'package:flutter_wechat/views/home_page.dart';
import 'package:flutter_wechat/app_config.dart';

void main() => runApp(new HomePage());

 class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeChat',
      theme: ThemeData(
        primaryColor: Color(AppColors.AppBarColor),
        cardColor: Color(AppColors.AppBarColor)
      ),
      home: MyHomePage(title: 'WeChat'),
    );
  }
}