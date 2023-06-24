import 'package:flutter/material.dart';

class SwitchProvider extends ChangeNotifier {
  bool _isSwitch = false;

  bool get isSwitch => _isSwitch;

  set setSwitch(value) {
    _isSwitch = value;
    notifyListeners();
  }
}
