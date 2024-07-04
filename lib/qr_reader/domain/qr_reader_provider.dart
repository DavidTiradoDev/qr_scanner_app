import 'package:flutter/material.dart';

class QrReaderProvider with ChangeNotifier {
  String _scannedCode = '';

  String get scannedCode => _scannedCode;

  void updateScannedCode(String code) {
    _scannedCode = code;
    notifyListeners();
  }
}
