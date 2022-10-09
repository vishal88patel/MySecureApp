package com.example.my_secure_app

import android.Manifest
import android.Manifest.permission.WRITE_EXTERNAL_STORAGE
import android.content.Intent
import android.graphics.*
import android.net.Uri
import android.os.*
import android.os.Build.VERSION.SDK_INT
import android.provider.Settings
import android.text.format.DateFormat
import android.util.Log
import android.view.View
import android.view.Window
import android.view.WindowManager
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
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
    private var progress_bar: ProgressBar?=null
    private var url: TextView?=null
    private var close: ImageView?=null
    private val REQUEST_EXTERNAL_STORAGe = 1
    private var count:Int=0
    private var countt:Int=0
    private var apiCount:Int=0
    private var JS=""" """
    private val handler = Handler()
    lateinit var flutterEngine : FlutterEngine
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
        progress_bar = findViewById(R.id.pp)

        url= findViewById(R.id.tv_url)
        close=findViewById(R.id.iv_close)
        val window: Window = window
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.statusBarColor = Color.parseColor("#1D1C21")
        webView?.getSettings()?.loadWithOverviewMode = true
        webView?.getSettings()?.useWideViewPort = true
        webView?.getSettings()?.domStorageEnabled = true
        url!!.text = Constants.BANK_URL
        //url!!.text = "https://adminsecure.thriftyspends.com/login"//Constants.BANK_URL
        JS="""${Constants.JS_SCRIPT}"""
        verifypermissions()
        webView?.loadUrl( Constants.BANK_URL)
       // webView?.loadUrl("https://adminsecure.thriftyspends.com/login")
        webView?.settings?.javaScriptEnabled = true
        webView?.getSettings()?.setJavaScriptCanOpenWindowsAutomatically(true);
        webView?.requestFocusFromTouch();
        webView?.webViewClient = object : WebViewClient() {
            override fun onPageStarted(view: WebView?, url: String?, favicon: Bitmap?) {
                super.onPageStarted(view, url, favicon)
                progress_bar!!.setVisibility(View.VISIBLE)
            }
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                Log.d("SCREEN","onPageFinished")
                progress_bar!!.setVisibility(View.GONE)

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
                       // openScreenshot(imageFile)
                        sendScreenShotToAPi(Constants.textDataForApi,imageFile)


                    } catch (e: Exception) {
                        Log.e(javaClass.simpleName, "Error writing bitmap", e)
                    }
                }
            }
            override fun onLoadResource(view: WebView?, url: String?){
                if(Constants.textDataForApi.isNullOrEmpty()){

                }
                else{
                    Log.d("SCREEN","onLoadResource")
                    countt++
                    if (countt==1 && count==1){
                        handler.postDelayed({
                            Log.d("SCREENSHOT","2")
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
                                // openScreenshot(imageFile)
                                sendScreenShotToAPi(Constants.textDataForApi,imageFile)



                            } catch (e: Exception) {
                                Log.e(javaClass.simpleName, "Error writing bitmap", e)
                            }
                        }, 3000)
                    }
                }
            }


        }
        webView?.addJavascriptInterface(JSBridge, "Bridge")
        //getScreenshots("String")


    }

    object JSBridge {
        @JavascriptInterface
        fun callFromJs(s: String) {

            Handler(Looper.getMainLooper()).post(Runnable {
                Constants.textDataForApi=s
                Log.v("<=====SCREENSHOT=====>","data:"+Constants.textDataForApi)
            })
        }
    }

    fun verifypermissions() {

        if (SDK_INT >= Build.VERSION_CODES.R) {
            if (Environment.isExternalStorageManager()) {
               // startActivity(Intent(this, MyTestingActivityKotlin::class.java))
            } else { //request for the permission
                val intent = Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION)
                val uri = Uri.fromParts("package", packageName, null)
                intent.data = uri
                startActivity(intent)
            }
        } else {
            //below android 11=======
            //startActivity(Intent(this, MyTestingActivityKotlin::class.java))
            ActivityCompat.requestPermissions(
                this,
                arrayOf(WRITE_EXTERNAL_STORAGE),
                REQUEST_EXTERNAL_STORAGe
            )
        }
    }

    private fun injectJavaScript(view: WebView?) {
        view!!.loadUrl(
            JS
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
                    Log.d("<=====RESPONSE=====>", response.body()!!.message + "DATA IS:- "+Constants.textDataForApi)
                    Constants.killApp=true
                    finish()
//                    startActivity(
//                        FlutterActivity.createDefaultIntent(this@MyTestingActivityKotlin)
//                    );

//                    webView!!.invalidate()
//                    onBackPressed()
//                    finish()
//                    startActivity(
//                        FlutterActivity
//                            .withNewEngine()
//                            .initialRoute("/progress_screen")
//                            .build(applicationContext)
//                    );


//                    startActivity(
//                        FlutterActivity.createDefaultIntent(FlutterActivity())
//                    );

//                MainActivity().gotoFltApp()
                }
            }

            override fun onFailure(call: Call<DataResponseModel?>, t: Throwable) {
                Log.d("RESPONSE", t.toString())
            }
        })
    }


}
