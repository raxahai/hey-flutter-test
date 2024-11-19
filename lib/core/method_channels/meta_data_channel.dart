import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class MetaDataPlatformChannelService {
  Future<void> set(String key, String value);
}

class MetaDataPlatformChannelServiceImpl
    implements MetaDataPlatformChannelService {
  MethodChannel platform = const MethodChannel('com.heyflutter.test_task/meta');

  @override
  Future<void> set(String key, String value) async {
    try {
      final result = await platform
          .invokeMethod('setMetadata', {'key': key, 'value': value});
      debugPrint(result);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
