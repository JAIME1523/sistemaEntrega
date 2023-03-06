import 'dart:convert';

class ShippingAddressModel {
  ShippingAddressModel(
      {required this.id,
      required this.isAssigned,
      required this.street,
      required this.city,
      required this.stateProvinceArea,
      required this.phoneNumber,
      required this.zipCode,
      this.assignedDriver,
      this.sS});

  int id;
  bool isAssigned;
  String street;
  String city;
  String stateProvinceArea;
  String phoneNumber;
  int zipCode;
  dynamic assignedDriver;
  dynamic sS;

  factory ShippingAddressModel.fromJson(String str) =>
      ShippingAddressModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShippingAddressModel.fromMap(Map<String, dynamic> json) =>
      ShippingAddressModel(
        id: json["id"],
        isAssigned: json["isAssigned"],
        street: json["street"],
        city: json["city"],
        stateProvinceArea: json["state/province/area"],
        phoneNumber: json["phoneNumber"],
        zipCode: json["zipCode"],
        assignedDriver: json["assigned_driver"],
        sS: json["sS"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "isAssigned": isAssigned,
        "street": street,
        "city": city,
        "state/province/area": stateProvinceArea,
        "phoneNumber": phoneNumber,
        "zipCode": zipCode,
        "assigned_driver": assignedDriver,
        "sS": sS
      };
}
