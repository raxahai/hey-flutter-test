import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:test_task/core/method_channels/meta_data_channel.dart';
import 'package:test_task/app/features/map/views/map_view.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxString selectedDirectory = "".obs;
  final MetaDataPlatformChannelService metaDataPlatformChannelService =
      MetaDataPlatformChannelServiceImpl();

  Future<void> openMaps({required void Function(String) onError}) async {
    String? value = await metaDataPlatformChannelService.get(Platform.isAndroid
        ? "com.google.android.geo.API_KEY"
        : "com.google.iOS.geo.API_KEY");
    if (value != null && value != "value") {
      Get.to(const MapView());
    } else {
      onError("Enter api key");
    }
  }

  Future<void> onSubmitApiKeyPressed(String apiKey) async {
    Get.back();
    await metaDataPlatformChannelService.set(
        Platform.isAndroid
            ? "com.google.android.geo.API_KEY"
            : "com.google.iOS.geo.API_KEY",
        apiKey);
  }

  Future<void> pickDirectory(void Function(String) onError) async {
    try {
      String? directoryPath = await FilePicker.platform.getDirectoryPath();
      if (directoryPath != null) {
        selectedDirectory.value = directoryPath;
      }
    } catch (e) {
      onError("Error selecting directory: $e");
    } finally {
      update();
    }
  }
}
