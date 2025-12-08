import 'package:damta/presentation/view/pages/home/widgets/noti_button.dart';
import 'package:damta/presentation/view/pages/home/widgets/weather_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"), actions: [NotiButton()]),
      body: WeatherBar(),
    );
  }
}
