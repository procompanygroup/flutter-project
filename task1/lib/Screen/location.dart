import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialCameraposition =
      CameraPosition(target: LatLng(33.515343, 36.289590), zoom: 17.4746);
  LatLng currentPosition = _initialCameraposition.target;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialCameraposition,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            setState(() {
              _controller.complete(controller);
            });
          },
          onCameraMove: (CameraPosition newpos) {
            setState(() {
              currentPosition = newpos.target;
            });
          },
          // markers: ,
        )
      ],
    ));
  }
}
