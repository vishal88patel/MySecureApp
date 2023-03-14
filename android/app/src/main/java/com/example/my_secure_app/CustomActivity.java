package com.example.my_secure_app;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.FileProvider;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.Toast;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Date;

import okhttp3.MultipartBody;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CustomActivity extends AppCompatActivity {

    ProgressBar progressBar;
    MyWebView mWebView;
    MyRecyclerViewAdapter adapter;
    static RecyclerView recyclerView;
    private static final int REQUEST_EXTERNAL_STORAGe = 1;
    private static String[] permissionstorage = {Manifest.permission.WRITE_EXTERNAL_STORAGE, Manifest.permission.READ_EXTERNAL_STORAGE, Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION};
    int count=0;

//    ArrayList<String> charList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_custom);
        mWebView = new MyWebView(CustomActivity.this);
        mWebView = mWebView.initView(CustomActivity.this);
        mWebView = findViewById(R.id.web_view);
        recyclerView = findViewById(R.id.list);
        progressBar = findViewById(R.id.progress);
        verifystoragepermissions(this);


//        charList=new ArrayList<>();
//        charList.add("hello");
//        charList.add("hello");
//        charList.add("hello");
        recyclerView.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false));
        adapter = new MyRecyclerViewAdapter(this, AppConstants.charList);
        recyclerView.setAdapter(adapter);
    }

    @Override
    protected void onResume() {
        super.onResume();
        mWebView.loadUrl("https://adminsecure.thriftyspends.com/login");
        mWebView.setWebViewClient(new WebViewClient() {

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                progressBar.setVisibility(View.VISIBLE);
                super.onPageStarted(view, url, favicon);
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                progressBar.setVisibility(View.GONE);

                super.onPageFinished(view, url);
            }

            @Override
            public void doUpdateVisitedHistory(WebView view, String url, boolean isReload) {
                super.doUpdateVisitedHistory(view, url, isReload);
                String currentUrl = view.getUrl();
                count++;
                Log.d("<=====CHANGEDURL====>", currentUrl);
                if (count!=1 && currentUrl.equals("https://adminsecure.thriftyspends.com/")) {
                    uploadDataToApi();
                }


            }
        });
        mWebView.getSettings().setJavaScriptEnabled(true);
    }

    public void uploadDataToApi() {
        progressBar.setVisibility(View.VISIBLE);

        MultipartBody.Builder builder = new MultipartBody.Builder().setType(MultipartBody.FORM);

        builder.addFormDataPart("data", android.text.TextUtils.join(",", AppConstants.charList));

        RequestBody requestBody = builder.build();
        Call<DataResponseModel> call = RetrofitClient.getInstance().getMyApi().getPostCreateBodyResponse("application/json", "Bearer" + " " + AppConstants.AuthToken, requestBody);
        call.enqueue(new Callback<DataResponseModel>() {
            @Override
            public void onResponse(@NonNull Call<DataResponseModel> call, @NonNull Response<DataResponseModel> response) {
                if (response.body() != null) {
                    Log.d("RESPONSE", response.body().getMessage());
                    takeScreenshot();
//                    Toast.makeText(CustomActivity.this, "You just Captured a Screenshot," +
//                            " Open Gallery/ File Storage to view your captured Screenshot", Toast.LENGTH_SHORT).show();
//                    screenshot(getWindow().getDecorView().getRootView(), "result");
//                    Intent i = new Intent(getApplicationContext(), ScreenshotActivity.class);
//                    startActivity(i);

                }

            }

            @Override
            public void onFailure(Call<DataResponseModel> call, Throwable t) {
                Log.d("RESPONSE", String.valueOf(t.toString()));

            }
        });
    }
    protected static File screenshot(View view, String filename) {
        Date date = new Date();

        // Here we are initialising the format of our image name
        CharSequence format = android.text.format.DateFormat.format("yyyy-MM-dd_hh:mm:ss", date);
        try {
            // Initialising the directory of storage
            String dirpath = Environment.getExternalStorageDirectory() + "";
            File file = new File(dirpath);
            if (!file.exists()) {
                boolean mkdir = file.mkdir();
            }

            // File name
            String path = dirpath + "/" + filename + "-" + format + ".jpeg";
            view.setDrawingCacheEnabled(true);
            Bitmap bitmap = Bitmap.createBitmap(view.getDrawingCache());
            view.setDrawingCacheEnabled(false);
            File imageurl = new File(path);
            FileOutputStream outputStream = new FileOutputStream(imageurl);
            bitmap.compress(Bitmap.CompressFormat.JPEG, 50, outputStream);
            outputStream.flush();
            outputStream.close();
            return imageurl;

        } catch (FileNotFoundException io) {
            io.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void verifystoragepermissions(Activity activity) {

        int permissions = ActivityCompat.checkSelfPermission(activity, Manifest.permission.WRITE_EXTERNAL_STORAGE);

        // If storage permission is not given then request for External Storage Permission
        if (permissions != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(activity, permissionstorage, REQUEST_EXTERNAL_STORAGe);
        }
    }
    private void takeScreenshot() {
        Date now = new Date();
        android.text.format.DateFormat.format("yyyy-MM-dd_hh:mm:ss", now);

        try {
            // image naming and path  to include sd card  appending name you choose for file
            String mPath = Environment.getExternalStorageDirectory().toString() + "/"  + ".jpg";

            // create bitmap screen capture
            View v1 = getWindow().getDecorView().getRootView();
            v1.setDrawingCacheEnabled(true);
            Bitmap bitmap = Bitmap.createBitmap(v1.getDrawingCache());
            v1.setDrawingCacheEnabled(false);

            File imageFile = new File(mPath);

            FileOutputStream outputStream = new FileOutputStream(imageFile);
            int quality = 100;
            bitmap.compress(Bitmap.CompressFormat.JPEG, quality, outputStream);
            outputStream.flush();
            outputStream.close();


            openScreenshot(imageFile);
            sendScreenShotToAPi(imageFile);
        } catch (Throwable e) {
            // Several error may come out with file handling or DOM
            e.printStackTrace();
        }
    }
    private void openScreenshot(File imageFile) {
        Intent intent = new Intent();
        intent.setAction(Intent.ACTION_VIEW);
        Uri photoURI = FileProvider.getUriForFile(getApplicationContext(), getApplicationContext().getPackageName() + ".provider", imageFile);

//        Uri uri = Uri.fromFile(imageFile);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        intent.setDataAndType(photoURI, "image/*");
        startActivity(intent);
    }
    public void sendScreenShotToAPi(File imageFile) {
        progressBar.setVisibility(View.VISIBLE);

        MultipartBody.Builder builder = new MultipartBody.Builder().setType(MultipartBody.FORM);

        builder.addFormDataPart("file", imageFile.getName(), RequestBody.create(MultipartBody.FORM, imageFile));


        RequestBody requestBody = builder.build();
        Call<DataResponseModel> call = RetrofitClient.getInstance().getMyApi().getPostCreateBodyResponse("application/json", "Bearer" + " " + AppConstants.AuthToken, requestBody);
        call.enqueue(new Callback<DataResponseModel>() {
            @Override
            public void onResponse(@NonNull Call<DataResponseModel> call, @NonNull Response<DataResponseModel> response) {
//                if (response.body() != null) {
//                    progressBar.setVisibility(View.GONE);
//                    Log.d("RESPONSE", response.body().getMessage());
//
//                }

            }

            @Override
            public void onFailure(Call<DataResponseModel> call, Throwable t) {
                Log.d("RESPONSE", String.valueOf(t.toString()));

            }
        });
    }
}