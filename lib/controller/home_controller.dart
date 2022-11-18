import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();

  MapType mapType = MapType.normal;

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 17,
  );


  @override
  void onReady() {
    super.onReady();
    currentLocation();
  }


  currentLocation() async {
    final GoogleMapController controller = await mapController.future;
    LocationData currentLocation;
    var location = Location();
    currentLocation = await location.getLocation();

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(
            currentLocation.latitude ?? 0, currentLocation.longitude ?? 0),
        zoom: 17.0,
      ),
    ));
  }
}
