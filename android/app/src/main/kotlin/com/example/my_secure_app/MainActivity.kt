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
                val token: String? = call.argument("AUTHTOKEN")
                val bankId: String? = call.argument("BANK_ID")
                val bankUrl: String? = call.argument("BANK_URL")
                val bankScript: String? = call.argument("BANK_JS")
                Constants.AuthToken=token
                Constants.bankId=bankId
                Constants.BANK_URL=bankUrl
                Constants.JS_SCRIPT=bankScript
//                gotoFltApp()
                val intent = Intent(this,MyTestingActivityKotlin::class.java)
                startActivity(intent)
            } else {
                result.notImplemented()
            }
            // This method is invoked on the main thread.
            // TODO
        }


    }
    fun gotoFltApp(){
        MethodChannel(
            flutterEngine?.dartExecutor!!.binaryMessenger,
            "METHOD_CHANNEL_FOR_INCOMING_EVENTS"
        ).invokeMethod("GoToSuccess", "success")
    }
}
