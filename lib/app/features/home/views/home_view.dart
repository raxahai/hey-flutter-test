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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Get.dialog(
                      CustomApiKeyDialog(
                        onPressed: (apiKey) =>
                            homeController.onSubmitApiKeyPressed(apiKey),
                      ),
                    );
                  },
                  child: const Text("Enter API KEY"),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: homeController.openMaps,
            tooltip: 'Open maps',
            child: const Icon(Icons.map),
          ),
        );
      },
    );
  }
}
