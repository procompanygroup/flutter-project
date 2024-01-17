import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  final String location;

  const Location(this.location, {Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState(location);
}

class _LocationState extends State<Location> {
  late String location;
  double latitude = 0.0, longitude = 0.0;
  final Completer<GoogleMapController> _controller = Completer();

  _LocationState(this.location);

  @override
  void initState() {
    super.initState();
    List<String> coordinates = location.substring(1).split(',');
    latitude = double.tryParse(coordinates[0]) ?? 0.0;
    longitude = double.tryParse(coordinates[1]) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    CameraPosition initialCameraPosition =
        CameraPosition(target: LatLng(latitude, longitude), zoom: 18.4746);
    //LatLng currentPosition = initialCameraPosition.target;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: <Marker>{
              Marker(
                markerId: const MarkerId("0"),
                position: LatLng(latitude, longitude),
                draggable: true,
                icon: BitmapDescriptor.defaultMarker,
              ),
            },
            onTap: (LatLng position) {
              setState(() {
                latitude = position.latitude;
                longitude = position.longitude;
              });
              final markerId = MarkerId(DateTime.now().toString());
              Marker(
                markerId: markerId,
                position: LatLng(latitude, longitude),
                draggable: true,
                icon: BitmapDescriptor.defaultMarker,
              );
              _controller.future.then((controller) {
                controller.showMarkerInfoWindow(markerId);
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.7),
            child: Center(
              child: SizedBox(
                width: size.width * 0.4,
                height: size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple.shade300),
                  ),
                  child:
                      const Text("Save", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
