import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/auth_controller.dart';
import 'package:food_delivery/data/controller/location_controller.dart';
import 'package:food_delivery/data/controller/user_controller.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/pages/address/pick_address_map.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/bottom_section.dart';
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
    if (_isLogged && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserData();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      /*
      bug fix for old user from new device
       */
      if (Get.find<LocationController>().getUserAddressFromLocalStorage() ==
          '') {
        Get.find<LocationController>()
            .saveUserAddress(Get.find<LocationController>().addressList.last);
      }
      Get.find<LocationController>().getAllAddressList();
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
      body: GetBuilder<UserController>(builder: (userController) {
        if (userController.userModel != null &&
            _contactPersonName.text.isEmpty) {
          _contactPersonName.text = userController.userModel?.name ?? '';
          log(' Add adress User : ${_contactPersonName.text}');
          _contactPersonNumber.text = userController.userModel?.phone ?? '';
          if (Get.find<LocationController>().addressList.isNotEmpty) {
            _addressController.text =
                Get.find<LocationController>().getUserAddress().address;
          }
        }
        return GetBuilder<LocationController>(builder: (locController) {
          _addressController.text = '${locController.placeMark.name ?? ''},'
              '${locController.placeMark.locality ?? ''},${locController.placeMark.postalCode ?? ''}'
              '${locController.placeMark.country ?? ''}';
          return SingleChildScrollView(
            child: Column(
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
                    onTap: (latlng) {
                      Get.toNamed(
                        AppRoutes.getAddressMapPage(),
                        arguments: PickAddressMap(
                          fromSignUp: false,
                          fromAddress: false,
                          googleMapController:
                              locController.googleMapController,
                        ),
                      );
                    },
                    initialCameraPosition:
                        CameraPosition(target: _initialPosition, zoom: 15),
                    compassEnabled: false,
                    mapToolbarEnabled: false,
                    indoorViewEnabled: true,
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    onCameraMove: (position) => _cameraPosition = position,
                    onCameraIdle: () {
                      locController.updatePosition(_cameraPosition, true);
                    },
                    onMapCreated: (GoogleMapController gMapController) {
                      locController.setLocation(gMapController);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: locController.addressTypeList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              locController.setAddressTypeIndex(index);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimension.width20,
                                  vertical: Dimension.width10),
                              margin: EdgeInsets.only(right: Dimension.width10),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      color: Colors.grey.shade200,
                                    )
                                  ]),
                              child: Icon(
                                index == 0
                                    ? Icons.home_filled
                                    : index == 1
                                        ? Icons.business_center
                                        : Icons.location_on_outlined,
                                color: locController.addressTypeIndex == index
                                    ? AppColors.mainColor
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          );
                        }),
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
            ),
          );
        });
      }),
      bottomNavigationBar:
          GetBuilder<LocationController>(builder: (locController) {
        return Container(
          height: Dimension.height20 * 5,
          padding: EdgeInsets.symmetric(
              horizontal: Dimension.width20, vertical: Dimension.height20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.radius20),
                topRight: Radius.circular(Dimension.radius20),
              )),
          child: InkWell(
            onTap: () {
              AddressModel _addressModel = AddressModel(
                  addressType: locController
                      .addressTypeList[locController.addressTypeIndex],
                  contactPersonName: _contactPersonName.text,
                  contactPersonNumber: _contactPersonNumber.text,
                  address: _addressController.text,
                  latitude: locController.position.latitude.toString(),
                  longitude: locController.position.longitude.toString());
              locController.addUserAddress(_addressModel).then((value) {
                if (value.isSuccess) {
                  Get.back();
                  Get.snackbar('Address', 'Saved Successfully');
                } else {
                  Get.snackbar('Address', 'Could not save');
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: AppColors.mainColor),
              child: Center(
                child: BigText(
                  text: 'Save Address',
                  color: Colors.white,
                  textSize: 26,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
