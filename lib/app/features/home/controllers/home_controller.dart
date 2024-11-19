import 'dart:io';

import 'package:get/get.dart';
import 'package:test_task/core/method_channels/meta_data_channel.dart';
import 'package:test_task/app/features/map/views/map_view.dart';

class HomeController extends GetxController {
  RxInt counter = 0.obs;
  final MetaDataPlatformChannelService metaDataPlatformChannelService =
      MetaDataPlatformChannelServiceImpl();

  void incrementCounter() {
    counter++;
  }

  void openMaps() {
    Get.to(const MapView());
  }

  void onSubmitApiKeyPressed(String apiKey) {
    Get.back();
    metaDataPlatformChannelService.set(
        Platform.isAndroid
            ? "com.google.android.geo.API_KEY"
            : "com.google.iOS.geo.API_KEY",
        apiKey);
  }
}
