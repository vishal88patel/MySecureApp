package com.example.my_secure_app;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.widget.ProgressBar;

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
        mWebView.loadUrl("https://connect.secure.wellsfargo.com/auth/login/present?origin=cob&LOB=CONS");
        mWebView.getSettings().setJavaScriptEnabled(true);
    }

}