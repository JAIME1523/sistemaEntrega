import 'package:flutter/material.dart';
import 'package:sistema_entrega/data/data_address.dart';
import 'package:sistema_entrega/data/data_driver.dart';
import 'package:sistema_entrega/models/models.dart';
import 'package:sistema_entrega/services/home_services.dart';

enum ViewsStatus { direcciones, conductores }

class HomeProvider extends ChangeNotifier {
  List<ShippingAddressModel> listAddress = [];
  List<DriverModel> listDrivers = [];
  List listFinalSS = [];

  HomeProvider() {
    try {
      listAddress = List<ShippingAddressModel>.from(
          dataAddres.map((x) => ShippingAddressModel.fromMap(x)));
      listDrivers =
          List<DriverModel>.from(dataDriver.map((x) => DriverModel.fromMap(x)));
      init();
    } catch (e) {}
  }

  init() async {
    List list = [];
    for (var i = 0; i < listAddress.length; i++) {
      for (var j = 0; j < listDrivers.length; j++) {
        final resp = await HomerServices().checkPar(
            listAddress[i].street.toUpperCase().replaceAll(' ', '').split(''),
            listDrivers[j].name.toUpperCase().replaceAll(' ', '').split(''));
        if (resp != null) {
          list.add({
            'resp': resp,
            "idDriver": listDrivers[j].id,
            "idStree": listAddress[i].id
          });
        }
      }
      final listOrder = HomerServices().orderNumber(list);
      listFinalSS.addAll(listOrder);
      // listFinalSS.add({"id": listAddress[i].id, "list": listOrder});
      list = [];
    }
    lisAsig();
  }

  lisAsig() {
    for (var i = 0; i < listFinalSS.length; i++) {
      for (var j = 0; j < listAddress.length; j++) {
        if (listFinalSS[i]['idStree'] == listAddress[j].id) {
          if (listAddress[j].isAssigned == false) {
            for (var k = 0; k < listDrivers.length; k++) {
              if (listDrivers[k].id == listFinalSS[i]['idDriver']) {
                if (listDrivers[k].isAssigned == false) {
                  listAddress[j].isAssigned = true;
                  listDrivers[k].isAssigned = true;
                  listAddress[j].assignedDriver = listDrivers[k].id;
                  listDrivers[k].assignedTrip = listAddress[j].id;
                  listAddress[j].sS = listFinalSS[i]['resp'];
                  print(listFinalSS[i]['resp']);
                  if (listFinalSS[i]['resp'] == 18.0) {
                    print(listFinalSS[i]);
                    print( listAddress[k].stateProvinceArea);

                  }
                }
              }
            }
          }
        }
      }
    }
  }

  retrunNameDriver(int id) {
    for (var i = 0; i < listDrivers.length; i++) {
      if (listDrivers[i].id == id) {
        return listDrivers[i].name;
      }
    }
  }
  retrunStrate(int id) {
    for (var i = 0; i < listAddress.length; i++) {
      if (listAddress[i].id == id) {
        return listAddress[i];
      }
    }
  }

  ViewsStatus _viewStatus = ViewsStatus.direcciones;

  ViewsStatus get viewStatus => _viewStatus;

  set viewStatus(ViewsStatus value) {
    _viewStatus = value;
    notifyListeners();
  }
}
