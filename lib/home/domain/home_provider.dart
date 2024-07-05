import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeProvider extends ChangeNotifier {
  // Barcodes States
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String? _errorMessage;
  File? get image => _image;
  String? get errorMessage => _errorMessage;

  // QR States
  final ImagePicker _pickerQr = ImagePicker();
  File? _imageQr;
  String? _errorMessageQr;
  File? get imageQr => _imageQr;
  String? get errorMessageQr => _errorMessageQr;

  // QR Scanner States
  String _scannedCode = '';
  String get scannedCode => _scannedCode;

  void updateScannedCode(String code) {
    _scannedCode = code;
    notifyListeners();
  }

  Future<void> pickImageBar() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        notifyListeners();
        await uploadImageBar(_image!);
      }
    } catch (e) {
      _errorMessage = 'Failed to pick image: $e';
      notifyListeners();
    }
  }

  Future<void> uploadImageBar(File image) async {
    try {
      final fileName = 'public/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final response =
          await Supabase.instance.client.storage.from('barcodes').upload(
                fileName,
                image,
              );
      print('Upload Successful');
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed';
      notifyListeners();
    }
  }

  Future<void> pickImageQR() async {
    try {
      final pickedFile = await _pickerQr.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        _imageQr = File(pickedFile.path);
        notifyListeners();
        await uploadImageQR(_imageQr!);
      }
    } catch (e) {
      _errorMessage = 'Failed to pick image: $e';
      notifyListeners();
    }
  }

  Future<void> uploadImageQR(File image) async {
    try {
      final fileName = 'public/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final response =
          await Supabase.instance.client.storage.from('qrcodes').upload(
                fileName,
                image,
              );
      print('Upload Successful');
      _errorMessageQr = null;
      notifyListeners();
    } catch (e) {
      _errorMessageQr = 'Failed QR Upload';
      notifyListeners();
    }
  }
}
