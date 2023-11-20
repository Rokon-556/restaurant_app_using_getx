import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignUp;
  final bool fromAddress;
  GoogleMapController? googleMapController;
  PickAddressMap(
      {super.key,
      required this.fromSignUp,
      required this.fromAddress,
      this.googleMapController});

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initialPosition;
  late CameraPosition _cameraPosition;
  late GoogleMapController _googleMapController;

  @override
  void initState() {
    super.initState();
    if (Get.find<LocationController>().addressList.isEmpty) {
      _initialPosition = LatLng(45.54, -122.76);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 15);
    } else {
      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _initialPosition = LatLng(
            double.parse(Get.find<LocationController>().getAddress['latitude']),
            double.parse(
                Get.find<LocationController>().getAddress['longitude']));
        _cameraPosition = CameraPosition(target: _initialPosition, zoom: 15);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: _initialPosition, zoom: 15),
                    zoomControlsEnabled: false,
                    onCameraMove: (CameraPosition camPosition) {
                      _cameraPosition = camPosition;
                    },
                    onCameraIdle: () {
                      Get.find<LocationController>()
                          .updatePosition(_cameraPosition, false);
                    },
                  ),
                  Center(
                    child: !locationController.loading
                        ? Image.asset(
                            'assets/image/pick_marker.png',
                            height: 50,
                            width: 50,
                          )
                        : CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
