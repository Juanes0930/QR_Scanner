import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner_app/infraestructure/models/scan_model.dart';
import 'package:qr_scanner_app/presentation/screens/home_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  MapType mapType = MapType.satellite;

  @override
  Widget build(BuildContext context) {
    final ScanModel? scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel?;
    CameraPosition initialPoint =
        CameraPosition(target: scan!.getLatLng(), zoom: 17.5, tilt: 55);

    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.share_location_outlined),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller
                  .animateCamera(CameraUpdate.newCameraPosition(initialPoint));
            },
          ),
        ],
        centerTitle: true,
        title: const Text('Maps'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context, const HomeScreen());
          },
        ),
      ),
      body: GoogleMap(
          markers: markers,
          myLocationButtonEnabled: true,
          mapType: mapType,
          initialCameraPosition: initialPoint,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          
            child: const Icon(Icons.layers),
            onPressed: () {
              if (mapType == MapType.normal) {
                mapType = MapType.satellite;
              } else {
                mapType = MapType.normal;
              }
              setState(() {});
            }),
      ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniStartDocked,
    );
  }
}
