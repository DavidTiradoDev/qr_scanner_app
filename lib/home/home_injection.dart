import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_reader/home/domain/home_provider.dart';
import 'package:qr_reader/home/interface/home_screen.dart';

class HomeInjection {
  HomeInjection._();

  static Widget injection() {
    return ListenableProvider(
      create: (context) => HomeProvider(),
      child: const HomeScreen(),
    );
  }
}
