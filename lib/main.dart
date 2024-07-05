import 'package:flutter/material.dart';

import 'package:qr_reader/home/home_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://frqwnsxzvlxjyomiojmv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZycXduc3h6dmx4anlvbWlvam12Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAxNDUwODksImV4cCI6MjAzNTcyMTA4OX0.yH3VglDyhpiwI6y5vyGqxHQw8ZMYr_s6JeCUv5nO94Q',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomeInjection.injection(),
    );
  }
}
