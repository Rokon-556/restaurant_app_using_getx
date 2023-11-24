import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/location_controller.dart';
import 'package:food_delivery/pages/address/widgets/search_page_dialog.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/custom_buutton.dart';
import 'package:food_delivery/utils/dimension.dart';
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
                    onMapCreated: (GoogleMapController gMapController){
                      _googleMapController = gMapController;
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
                  Positioned(
                      top: Dimension.height40,
                      left: Dimension.width20,
                      right: Dimension.width20,
                      child: InkWell(
                        onTap: ()=> Get.dialog(SearchPageDialog(googleMapController: _googleMapController)),

                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimension.width10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimension.radius10)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 26,
                                color: AppColors.yellowColor,
                              ),
                              Expanded(
                                  child: Text(
                                locationController.pickPlaceMark.name ?? '',
                                style: TextStyle(
                                  fontSize: Dimension.font20,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                              SizedBox(width: Dimension.width15,),
                              Icon(Icons.search,size: 25,color: AppColors.yellowColor,)
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 200,
                      right: Dimension.width20,
                      left: Dimension.width20,
                      child: locationController.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              buttonText: locationController.inZoned
                                  ? widget.fromAddress
                                      ? 'Pick Address'
                                      : 'Pick Location'
                                  : 'Service is not available in your choosed Loaction',
                              onTap: (locationController.buttonDisabled || locationController.loading)
                                  ? null
                                  : () {
                                      if (
                                          //TODO
                                          //needed to do that after api addiing
                                          // locationController.pickPosition.latitude != null &&
                                          locationController
                                                  .pickPlaceMark.name !=
                                              null) {
                                        print('here');
                                        if (widget.fromAddress) {
                                          print('here2');
                                          if (widget.googleMapController !=
                                              null) {
                                            widget.googleMapController
                                                ?.moveCamera(
                                              CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                                  target: LatLng(
                                                      locationController
                                                          .pickPosition
                                                          .latitude,
                                                      locationController
                                                          .pickPosition
                                                          .longitude),
                                                ),
                                              ),
                                            );
                                            locationController
                                                .setAddAddressData();
                                          }
                                          Get.toNamed(
                                              AppRoutes.getAddressPage());
                                        }
                                      }
                                    },
                            ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
