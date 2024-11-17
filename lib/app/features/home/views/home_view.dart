import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/app/features/home/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    "${homeController.counter}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: homeController.incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
