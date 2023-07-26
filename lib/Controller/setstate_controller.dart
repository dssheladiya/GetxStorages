import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataController extends GetxController {
  // The observable list that will store our data1
  RxList<String> dataList = <String>[].obs;

  RxInt counter = 0.obs;

  // Function to add data to the list
  void addData(String newData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!dataList.contains(newData)) {
      Get.snackbar('Success', 'Data added successfully');
      dataList.add(newData);
      prefs.setStringList("aaa", dataList);
    } else {
      Get.snackbar('Warning', 'Data already exists');
    }
  }

  // data delete singl data
  void removeWhere(int index) {
    dataList.removeAt(index);
  }
}
// void removeWhere() {
//   dataList.removeWhere(dataList as bool Function(String element));
//   refresh();
// }

// void incrementCounter(int index) {
//   counter.value++;
//   //dataList.length;
// }
