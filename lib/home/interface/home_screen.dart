import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_reader/barcode_photo/barcode_photo_injection.dart';
import 'package:qr_reader/qr_reader/qr_reader_injection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            NavigatorButton(
              title: 'QR Scanner',
              navegacion: QrReaderInjection.injection(),
            ),
            const SizedBox(
              height: 15,
            ),
            NavigatorButton(
              title: 'Foto del QR',
              navegacion: BarcodePhotoInjection.injection(),
            ),
            const SizedBox(
              height: 15,
            ),
            NavigatorButton(
              title: 'Foto código de barras',
              navegacion: BarcodePhotoInjection.injection(),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({super.key, required this.title, this.navegacion});
  final String title;
  final dynamic navegacion;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navegacion,
          ),
        );
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
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.nunito(),
          ),
        ),
      ),
    );
  }
}
