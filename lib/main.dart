import 'package:flutter/material.dart';
import 'package:geo_location/locator.dart';

void main() {
  runApp(Locator());
}

class Locator extends StatelessWidget {
  const Locator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Current Location"),
        ),
        body: MyApp(),
      ),
    );
  }
}
