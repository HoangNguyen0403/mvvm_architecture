package com.vmo.c3FlutterTemp

import androidx.annotation.NonNull
import android.os.Bundle
import com.vmo.c3FlutterTemp.BuildConfig.FLAVOR
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "flavor"
        ).setMethodCallHandler { call, result ->
            if (call.method == "getFlavor") {
                println("Flavor : $FLAVOR")
                result.success(FLAVOR)
            }
        }
    }
}
