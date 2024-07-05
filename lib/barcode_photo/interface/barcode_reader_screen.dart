import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/barcode_photo/domain/barcode_reader_provider.dart';

class BarcodePhotoScreen extends StatelessWidget {
  const BarcodePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BarcodePhotoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Codigos de barras',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            provider.image == null
                ? Text('No image')
                : Image.file(provider.image!),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await provider.pickImage();
                if (provider.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(provider.errorMessage!),
                    ),
                  );
                }
              },
              child: Text(
                'Tomar foto',
                style: GoogleFonts.nunito(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
