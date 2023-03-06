import 'dart:convert';

class DriverModel {
  DriverModel({
    this.assignedTrip,
    required this.id,
    required this.name,
    required this.isAssigned,
  });
   int id;
   String name;
   bool isAssigned;
   dynamic assignedTrip;

  factory DriverModel.fromJson(String str) =>
      DriverModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DriverModel.fromMap(Map<String, dynamic> json) => DriverModel(
        id: json["id"],
        name: json["name"],
        isAssigned: json["isAssigned"],
        assignedTrip: json["assigned_trip"],
      );

  Map<String, dynamic> toMap() => {
        "assigned_trip": assignedTrip,
        "id": id,
        "name": name,
        "isAssigned": isAssigned,
      };
}
