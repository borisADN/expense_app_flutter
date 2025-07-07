import 'package:application/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Baloo'),
      // debugShowMaterialGrid: true,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
