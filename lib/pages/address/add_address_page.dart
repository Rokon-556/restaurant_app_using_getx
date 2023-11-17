import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/auth_controller.dart';
import 'package:food_delivery/data/controller/location_controller.dart';
import 'package:food_delivery/data/controller/user_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _addressController = TextEditingController();
  final _contactPersonName = TextEditingController();
  final _contactPersonNumber = TextEditingController();

  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(50.930557, -102.807777), zoom: 15);
  late LatLng _initialPosition = LatLng(50.930557, -102.807777);
  // late LatLng _initialPosition;
  late bool _isLogged;

  @override
  void initState() {
    super.initState();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    if (_isLogged) {
      // if(_isLogged && Get.find<UserController>().userModel==null){
      Get.find<UserController>().getUserData();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
          target: LatLng(
              double.parse(
                  Get.find<LocationController>().getAddress['latitude']),
              double.parse(
                  Get.find<LocationController>().getAddress['longitude'])));
      _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']),
          double.parse(Get.find<LocationController>().getAddress['longitude']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 5,top: 5,right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                )),
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialPosition, zoom: 15),
              compassEnabled: false,
              mapToolbarEnabled: false,
              indoorViewEnabled: true,
              zoomControlsEnabled: false,
              onCameraMove: (position)=>_cameraPosition = position,
              onCameraIdle: (){},
              onMapCreated: (GoogleMapController gMapController){},
            ),
          ),
        ],
      ),
    );
  }
}
