import 'package:flutter/cupertino.dart';
import 'package:invoice/screen/home/home_screen.dart';
import 'package:invoice/screen/persnol/personal_screen.dart';
import 'package:invoice/screen/product/product_screen.dart';

Map<String,WidgetBuilder> screen={
  '/':(context) => const HomeScreen(),
  'personal': (context) => const PersonalScreen(),
  'product':(context) =>const ProductScreen(),
};