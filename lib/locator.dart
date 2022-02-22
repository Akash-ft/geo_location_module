import 'package:flutter/material.dart';
import 'package:geo_location/googlemap.dart';
import 'package:location/location.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Location location = new Location();

  bool? _serviceEnabled;

  PermissionStatus? _pernissionGranted;

  static LocationData? locationData;

  bool _isListenLocation = false, _isGetLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled!) {
                  _serviceEnabled = await location.requestService();
                  if (_serviceEnabled!) return;
                }

                _pernissionGranted = await location.hasPermission();
                if (_pernissionGranted == PermissionStatus.denied) {
                  _pernissionGranted = await location.requestPermission();
                  if (_pernissionGranted != PermissionStatus.granted) return;
                }
                locationData = await location.getLocation();

                setState(() {
                  _isGetLocation = true;
                });
              },
              child: Text("Get location"),
            ),
            SizedBox(
              height: 20,
            ),
            _isGetLocation
                ? Text(
                    "Location:${locationData!.latitude}/${locationData!.longitude}",
                    style: TextStyle(fontSize: 20),
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LocationMap()));
                },
                child: Text("Open Map")),
          ],
        ),
      ),
    );
  }
}
