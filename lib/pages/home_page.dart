import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_testing/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: _homeController,
        builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: controller.currentLocation,
          child: const Icon(Icons.my_location_outlined),
        ),
        body: GoogleMap(
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          mapType: controller.mapType,
          initialCameraPosition: controller.kGooglePlex,
          onMapCreated: (GoogleMapController googleMapController) {
            controller.mapController.complete(googleMapController);
          },
        ),
      );
    });
  }
}
