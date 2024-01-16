class AddressModel {
  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String? _contactPersonNumber;
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModel(
      {id,
      required addressType,
      contactPersonName,
      contactPersonNumber,
      address,
      latitude,
      longitude}) {
    _id = id;
    _address = address;
    _addressType = addressType;
    _contactPersonName = contactPersonName;
    _contactPersonNumber = contactPersonNumber;
    _latitude = latitude;
    _longitude = longitude;
  }
  String get address => _address;
  String get addressType => _addressType;
  String get latitude => _latitude;
  String get longitude => _longitude;
  String? get contactPersonName => _contactPersonName;
  String? get contactPersonNumber => _contactPersonNumber;

  AddressModel.fromJson(Map<String,dynamic> json){
    _id = json['id'];
    _address = json['address'];
    _addressType = json['address_type']??'';
    _contactPersonName = json['contact_person_name']??'';
    _contactPersonNumber = json['contact_person_number']??'';
    _latitude = json['latitude']??'';
    _longitude = json['longitude']??'';
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = <String,dynamic>{};
    data['id'] = _id;
    data['address_type'] = _addressType;
    data['address'] = _address;
    data['contact_person_name'] = _contactPersonName;
    data['contact_person_number'] = _contactPersonNumber;
    data['latitude'] = _latitude;
    data['longitude'] = _longitude;

    return data;
  }
}
