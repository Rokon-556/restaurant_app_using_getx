import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/auth_controller.dart';
import 'package:food_delivery/data/controller/location_controller.dart';
import 'package:food_delivery/data/controller/user_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
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
      body: GetBuilder<UserController>(builder: (userController){
        if( _contactPersonName.text.isNotEmpty){
          _contactPersonName.text = userController.userModel.name;
          _contactPersonNumber.text = userController.userModel.phone;
          if(Get.find<LocationController>().addressList.isNotEmpty){
            _addressController.text = Get.find<LocationController>().getUserAddress().address;
          }
        }
        return GetBuilder<LocationController>(builder: (locController) {
          _addressController.text = '${locController.placeMark.name ?? ''},'
              '${locController.placeMark.locality ?? ''},${locController.placeMark.postalCode ?? ''}'
              '${locController.placeMark.country ?? ''}';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 5, top: 5, right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: AppColors.mainColor,
                      width: 2,
                    )),
                child: GoogleMap(
                  initialCameraPosition:
                  CameraPosition(target: _initialPosition, zoom: 15),
                  compassEnabled: false,
                  mapToolbarEnabled: false,
                  indoorViewEnabled: true,
                  zoomControlsEnabled: false,
                  onCameraMove: (position) => _cameraPosition = position,
                  onCameraIdle: () {
                    locController.updatePosition(_cameraPosition, true);
                  },
                  onMapCreated: (GoogleMapController gMapController) {
                    locController.setLocation(gMapController);
                  },
                ),
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimension.width20),
                child: BigText(text: 'Delivery Address'),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              AppTextField(
                  editingController: _addressController,
                  hintText: 'Your Location',
                  icon: Icons.map),
              SizedBox(
                height: Dimension.height20,
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimension.width20),
                child: BigText(text: 'Your Name'),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              AppTextField(
                  editingController: _contactPersonName,
                  hintText: 'Your number',
                  icon: Icons.person),
              SizedBox(
                height: Dimension.height10,
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimension.width20),
                child: BigText(text: 'Your Phone'),
              ),
              SizedBox(
                height: Dimension.height10,
              ),
              AppTextField(
                  editingController: _contactPersonNumber,
                  hintText: 'Your Phone',
                  icon: Icons.phone),
            ],
          );
        });
      }),
    );
  }
}
