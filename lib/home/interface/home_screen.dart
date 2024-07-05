import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:qr_reader/home/domain/home_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Bienvenidos',
          style: GoogleFonts.nunito(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
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
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.deepPurple,
                ),
                height: 35,
                width: 155,
                child: Center(
                  child: Text(
                    'QR Scanner',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.nunito(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // BOTON FOTO PARA QR
            InkWell(
              onTap: () async {
                await provider.pickImageQR();
                if (provider.errorMessageQr != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(provider.errorMessageQr!),
                    ),
                  );
                }
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.deepPurple,
                ),
                height: 35,
                width: 155,
                child: Center(
                  child: Text(
                    'Foto QR',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.nunito(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // BOTON FOTO CODIGO DE BARRAS
            InkWell(
              onTap: () async {
                await provider.pickImageBar();
                if (provider.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(provider.errorMessage!),
                    ),
                  );
                }
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.deepPurple,
                ),
                height: 35,
                width: 155,
                child: Center(
                  child: Text(
                    'Foto código de barras',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.nunito(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
