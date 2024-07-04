import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/qr_reader/domain/qr_reader_provider.dart';
import 'package:qr_reader/qr_reader/interface/qr_reader_screen.dart';

class QrReaderInjection {
  QrReaderInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => QrReaderProvider(),
      child: const QrReaderScreen(),
    );
  }
}
