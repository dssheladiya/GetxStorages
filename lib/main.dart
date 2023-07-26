import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Controller/setstate_controller.dart';
import 'View/HomeScreen/home.dart';

void main() async {
  await GetStorage.init();
  Get.put(DataController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: //box.read("dataList")== null ? HomeScreen(): dataList(),
          HomeScreen(),
    );
  }
}
