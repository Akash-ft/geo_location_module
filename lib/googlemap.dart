import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current location"),
      ),
      body: Column(
        children: [
          //_searchBar(),
          Expanded(
            child: GoogleMap(
              mapType: MapType.satellite,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(28.7041, 77.1025),
                zoom: 100,
              ),
              onMapCreated: (GoogleMapController controller) async {},
            ),
          ),
        ],
      ),
    );
  }
}
