package com.hoangnh.flutter_temp

import android.os.Bundle
import com.hoangnh.flutter_temp.BuildConfig.FLAVOR
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine?.dartExecutor, "flavor").setMethodCallHandler { _, result -> result.success(FLAVOR) }
    }
}
