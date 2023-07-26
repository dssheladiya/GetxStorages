import 'package:dataadd/Controller/setstate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/build_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetStorage with GetX'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            buildDialog();
          },
          child: const Icon(Icons.add)),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: dataController.dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${index + 1}"),
                    title: Text(dataController.dataList[index]),
                    trailing: GestureDetector(
                      child: const Icon(Icons.delete_outline_outlined),
                      onTap: () {
                        dataController.removeWhere(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// PopupMenuButton<String> popupMenuButton() {
//   return PopupMenuButton<String>(
//     onSelected: (String result) {},
//     itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//       const PopupMenuItem<String>(
//         value: 'option1',
//         child: Text('Delete Yes'),
//       ),
//       const PopupMenuItem<String>(
//         value: 'option2',
//         child: Text('Delete no'),
//       ),
//       // Add more PopupMenuItems as needed
//     ],
//   );
// }
