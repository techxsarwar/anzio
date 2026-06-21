package com.parallelogram.anzio

import com.ryanheise.audioservice.AudioServiceFragmentActivity;
import com.parallelogram.anzio.services.AppLogoService

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: AudioServiceFragmentActivity() {
  private val CHANNEL = "default_platform_channel"

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      when (call.method) {
        "AppLogoService.set" -> {
          val aliasName = call.argument<String?>("androidActivityAliasName")
          AppLogoService.set(this, aliasName, result)
        }
        else -> {
          result.notImplemented()
        }
      }
    }

    super.configureFlutterEngine(flutterEngine)
  }
}
