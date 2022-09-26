package com.example.my_secure_app

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "GET_DETAIL_CHANNEL"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "goToWeb") {
                val intent = Intent(this,CustomActivity::class.java)
                startActivity(intent)
            } else {
                result.notImplemented()
            }
            // This method is invoked on the main thread.
            // TODO
        }

    }
}
