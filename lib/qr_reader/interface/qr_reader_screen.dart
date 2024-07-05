import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class QrReaderScreen extends StatelessWidget {
  const QrReaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Scanner',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String scannedCode = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666',
              'Cancelar',
              true,
              ScanMode.QR,
            );
            if (scannedCode != '-1') {
              Uri url = Uri.parse(scannedCode);
              if (!await launchUrl(url)) {
                throw 'No se puede abrir la URL $scannedCode';
              }
            }
          },
          child: Text(
            'Scan Qr Code',
            style: GoogleFonts.nunito(),
          ),
        ),
      ),
    );
  }
}
