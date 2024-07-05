import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class BarcodePhotoProvider with ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String? _errorMessage;

  File? get image => _image;
  String? get errorMessage => _errorMessage;

  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        notifyListeners();
        await uploadImage(_image!);
      }
    } catch (e) {
      _errorMessage = 'Failed to pick image: $e';
      notifyListeners();
    }
  }

  Future<void> uploadImage(File image) async {
    if (image == null) {
      print('No se seleccionó ningún archivo.');
      return;
    }
    try {
      final fileName = 'public/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final response =
          await Supabase.instance.client.storage.from('barcodes').upload(
                fileName,
                image,
              );
      if (response == null) {
        _errorMessage = 'Upload error: ${response}';
      } else {
        print('Upload Successful');
        _errorMessage = null;
      }
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed';
      notifyListeners();
    }
  }
}
