import 'package:flutter/material.dart';

class StatusProvider extends ChangeNotifier {
  bool _isComplete = false;

  get isComplete => _isComplete;

  set setTaskStatus(bool value) {
    _isComplete = value;
    notifyListeners();
  }
}
