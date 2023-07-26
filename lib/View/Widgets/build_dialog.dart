import 'package:dataadd/Controller/setstate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final formKey = GlobalKey<FormState>();
final box = GetStorage();
final DataController dataController = Get.put(DataController());
final TextEditingController textEditingController = TextEditingController();

Future buildDialog<dataController>() {
  return Get.generalDialog(
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter Name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    controller: textEditingController,
                    decoration: InputDecoration(
                        labelText: " Enter Name",
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red)),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        String newData = textEditingController.text.trim();
                        if (newData.isNotEmpty) {
                          Get.snackbar('Success', 'Data added successfully');
                          Get.find<DataController>().addData(newData);
                          //pref.setStringList('aaa', dataList);
                          //  dataController.addData();
                          Get.find<DataController>().dataList();
                          textEditingController.clear();
                          Get.back();
                        } else {
                          Get.snackbar('Warning', 'Data already exists');
                        }
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

///
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: TextField(
//     onSubmitted: (value) {
//       dataController.addData(value);
//       Get.back();
//     },
//     decoration: const InputDecoration(
//       labelText: 'Enter data',
//       border: OutlineInputBorder(),
//       isDense: true,
//     ),
//   ),
// ),
