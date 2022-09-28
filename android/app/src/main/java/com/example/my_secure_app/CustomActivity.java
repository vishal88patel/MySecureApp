package com.example.my_secure_app;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;

import java.net.URISyntaxException;

public class CustomActivity extends AppCompatActivity {

    ProgressBar progressBar;
    MyWebView mWebView;
    MyRecyclerViewAdapter adapter;
    static RecyclerView recyclerView;
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

//        charList=new ArrayList<>();
//        charList.add("hello");
//        charList.add("hello");
//        charList.add("hello");
        recyclerView.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false));
        adapter = new MyRecyclerViewAdapter(this,  Constants.charList);
        recyclerView.setAdapter(adapter);
    }

    @Override
    protected void onResume() {
        super.onResume();
        mWebView.loadUrl("https://adminsecure.thriftyspends.com/login");
        mWebView.setWebViewClient(new WebViewClient() {

            @Override
            public boolean shouldOverrideUrlLoading(WebView webview, String url) {

                Uri uri = Uri.parse(url);
                Log.e("UUURRRRLLLL", uri.toString());
                if (uri.toString().equals("https://adminsecure.thriftyspends.com/")) {
                    try {

                        Intent intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME);
                        if (intent.resolveActivity(getPackageManager()) != null)
                            startActivity(intent);
                        return true;
                    } catch (URISyntaxException use) {
                        Log.e("TAG", use.getMessage());
                    }
                } else {
                    webview.loadUrl(url);
                    Log.e("url", url);
                }

                return true;
            }

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
                String currentUrl=view.getUrl();


            }
        });
        mWebView.getSettings().setJavaScriptEnabled(true);
    }

}