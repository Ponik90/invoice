import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice/utiles/screen_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: screen,
    ),
  );
}
