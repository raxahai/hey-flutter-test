import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/app/features/home/controllers/home_controller.dart';
import 'package:test_task/app/features/home/widgets/custom_api_key_dialog.dart';
import 'package:test_task/app/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) {
        return Scaffold(
          appBar: CustomAppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () => homeController.pickDirectory(
                        (err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(err),
                            ),
                          );
                        },
                      ),
                      icon: const Icon(Icons.folder_open),
                      label: const Text('Pick a File'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.dialog(
                          CustomApiKeyDialog(
                            onPressed: (apiKey) async => await homeController
                                .onSubmitApiKeyPressed(apiKey),
                          ),
                        );
                      },
                      child: const Text("Enter API KEY"),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (homeController.selectedDirectory.value.isNotEmpty) ...[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Selected Directory:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(homeController.selectedDirectory.value),
                ] else
                  const Text("No directory selected.",
                      style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async => await homeController.openMaps(
              onError: (message) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              ),
            ),
            tooltip: 'Open maps',
            child: const Icon(Icons.map),
          ),
        );
      },
    );
  }
}
