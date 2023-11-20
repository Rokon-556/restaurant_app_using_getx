import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/address_model.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  bool _loading = false;
  late Position _position;
  late Position _pickPosition;
  Placemark _placeMark = Placemark();
  Placemark get placeMark=>_placeMark;
  Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark=>_pickPlaceMark;
  late List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  late List<AddressModel> _allAddressList;
  List<AddressModel> get allAddressList=> _allAddressList;
  final List<String> _addressTypeList = ['home', 'office', 'others'];
  List<String> get addressTypeList=>_addressTypeList;
  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;
  late Map<String, dynamic> _getAddress;
  Map<String, dynamic> get getAddress => _getAddress;
  late GoogleMapController _mapController;
  final bool _updateAddressData = true;
  final bool _changeAddressData = true;

  bool get loading => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;
  GoogleMapController get googleMapController=> _mapController;

  void setLocation(GoogleMapController mapController) {
    _mapController = mapController;
  }

  Future<String> getAddressFromLatLng(LatLng latlng) async {
    String _address = 'Unknown Address Found';
    Response response = await locationRepo.getAddressFromLatLng(latlng);
    log("${response.body}");
    if (response.body["status"] == "OK") {
      log(response.body["status"].toString());
      _address = response.body["results"][0]["formatted_address"].toString();
      log('picked address' + _address);
    } else {
      log('Error loading google map api');
    }
   update();
    return _address;
  }

  void updatePosition(CameraPosition cameraPosition, bool isFromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();
      try {
        if (isFromAddress) {
          _position = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              altitudeAccuracy: 1,
              heading: 1,
              headingAccuracy: 1,
              speed: 1,
              speedAccuracy: 1);
        } else {
          _pickPosition = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              altitudeAccuracy: 1,
              heading: 1,
              headingAccuracy: 1,
              speed: 1,
              speedAccuracy: 1);
        }
        if (_changeAddressData) {
          String address = await getAddressFromLatLng(LatLng(
              cameraPosition.target.latitude, cameraPosition.target.longitude));
          isFromAddress? _placeMark = Placemark(name: address) : _pickPlaceMark = Placemark(name: address);
        }
      } catch (e) {
        log(e.toString());
      }
      _loading = false;
      update();
    }
  }

  AddressModel getUserAddress(){
    late AddressModel _addressModel;
    _getAddress =  jsonDecode(locationRepo.getUserAddress());
    try{
      _addressModel = AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    }catch(e){
      log(e.toString());
    }
    return _addressModel;
  }

  setAddressTypeIndex(int index){
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel>addUserAddress(AddressModel addressModel)async{
    _loading = true;
    update();
    Response response = await locationRepo.addUserAddress(addressModel);
    ResponseModel responseModel;
    if(response.statusCode == 200){
      await getAllAddressList();
      String message = response.body['message'];
      responseModel = ResponseModel(true, message);
      await saveUserAddress(addressModel);
    }else{
      responseModel = ResponseModel(false, response.statusText??'');
    }
    update();
    return responseModel;
  }
  
  Future<void>  getAllAddressList()async{
    Response response = await locationRepo.getAllAddress();
    if(response.statusCode == 200){
      _addressList = [];
      _allAddressList = [];
      
      response.body.forEach((address){
        _addressList.add(AddressModel.fromJson(address));
        _allAddressList.add(AddressModel.fromJson(address));
      });
    }else{
      _addressList = [];
      _allAddressList = [];
    }
    update();
  }
  
  Future<bool> saveUserAddress(AddressModel address)async{
    String userAddress = jsonEncode(address.toJson());
    return await locationRepo.saveUserAddress(userAddress);
  }

  String getUserAddressFromLocalStorage(){
    return locationRepo.getUserAddress();
  }
}
