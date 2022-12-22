package com.example.my_secure_app

import android.content.Intent
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "GET_DETAIL_CHANNEL"
    private var killcount: Int = 0;
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
                val bankName: String? = call.argument("BANK_NAME")
                Constants.AuthToken = ""
                Constants.bankId = ""
                Constants.BANK_URL = ""
                Constants.JS_SCRIPT = ""
                Constants.textDataForApi = ""
                Constants.killApp = false
//                killcount=0
                Constants.AuthToken = token
                Constants.bankId = bankId
                Constants.BANK_URL = bankUrl
                Constants.BANK_NAME = bankName
                Constants.JS_SCRIPT = bankScript

                val intent = Intent(this, MyTestingActivityKotlin::class.java)
                startActivity(intent)
//                finish()
            } else {
                result.notImplemented()
            }
            // This method is invoked on the main thread.
            // TODO
        }


    }

    fun gotoFltApp() {
        MethodChannel(
            flutterEngine?.dartExecutor!!.binaryMessenger,
            "METHOD_CHANNEL_FOR_INCOMING_EVENTS"
        ).invokeMethod("GoToSuccess", "success")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d("DDDDDDDDDDDDD", "____-----------onDestroy")
    }

    override fun onResume() {

        super.onResume()
        Log.d("DDDDDDDDDDDDD", "____-----------onResume" + killcount.toString())

        killcount++
        if (killcount > 1) {

            if (Constants.killApp == true) {
                Log.d("DDDDDDDDDDDDD", "____-----------kill" + killcount.toString())
                MethodChannel(
                    flutterEngine?.dartExecutor!!.binaryMessenger,
                    "INCOMING_EVENTS"
                ).invokeMethod("SHOW_SUCCESS_SCREEN", true)
                killcount = 0
//                finish()

            } else {
                MethodChannel(
                    flutterEngine?.dartExecutor!!.binaryMessenger,
                    "INCOMING_EVENTS"
                ).invokeMethod("SHOW_SUCCESS_SCREEN", false)
            }

        }else{
            if(Constants.killApp){
                MethodChannel(
                    flutterEngine?.dartExecutor!!.binaryMessenger,
                    "INCOMING_EVENTS"
                ).invokeMethod("SHOW_SUCCESS_SCREEN", true)
                killcount = 0
//                finish()
            }
        }
    }

}
