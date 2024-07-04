import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_reader/barcode_reader/domain/barcode_reader_provider.dart';
import 'package:qr_reader/barcode_reader/interface/barcode_reader_screen.dart';

class BarcodeReaderInjection {
  BarcodeReaderInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => BarcodeReaderProvider(),
      child: const BarcodeReaderScreen(),
    );
  }
}
