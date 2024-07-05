import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_reader/barcode_photo/domain/barcode_reader_provider.dart';
import 'package:qr_reader/barcode_photo/interface/barcode_reader_screen.dart';

class BarcodePhotoInjection {
  BarcodePhotoInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => BarcodePhotoProvider(),
      child: const BarcodePhotoScreen(),
    );
  }
}
