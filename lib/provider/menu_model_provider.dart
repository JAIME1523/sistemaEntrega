import 'package:flutter/material.dart';

class MenuModel with ChangeNotifier {
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.white; //black
  Color inactiveColor = Colors.blueGrey;
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
