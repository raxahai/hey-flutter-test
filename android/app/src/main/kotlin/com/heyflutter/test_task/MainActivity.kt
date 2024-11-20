package com.heyflutter.test_task

import android.content.pm.PackageManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){
    private val CHANNEL = "com.heyflutter.test_task/meta"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "setMetadata" -> {
                        setMetadata(call, result)
                    }
                    "getMetadata" -> {
                        getMetadata(call, result)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }

    private fun setMetadata(call: MethodCall, result: MethodChannel.Result){
        val key = call.argument<String>("key")
        val value = call.argument<String>("value")
        try {
            val appInfo = packageManager.getApplicationInfo(
                packageName,
                PackageManager.GET_META_DATA
            )
            val metaData = appInfo.metaData ?: Bundle()
            metaData.putString(key, value)
            appInfo.metaData = metaData

            result.success("Metadata set successfully")
        } catch (e: Exception) {
            result.error("ERROR", "Failed to set metadata", null)
        }
    }

    private fun getMetadata(call: MethodCall, result: MethodChannel.Result) {
        val key = call.argument<String>("key")
        try {
            val appInfo = packageManager.getApplicationInfo(
                packageName,
                PackageManager.GET_META_DATA
            )
            val metaData = appInfo.metaData ?: Bundle()
            val value = metaData.getString(key)

            result.success(value)
        } catch (e: Exception) {
            result.error("ERROR", "Failed to set metadata", null)
        }

    }
}
