package com.example.my_secure_app;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.webkit.WebView;


public class MyWebView extends WebView {

    WebView mMyWebView;
    MyRecyclerViewAdapter adapter;

    public MyWebView(Context context) {
        super(context);
    }

    public MyWebView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public MyWebView initView(Context context){
        LayoutInflater inflater = (LayoutInflater) context
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        mMyWebView = (MyWebView) inflater.inflate(R.layout.activity_custom_webview, this);

        Log.d("TAG", "----------------------AAAAAAAAAAAAA----------------: ");
        return (MyWebView) mMyWebView;
    }
    @Override
    public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
        Log.d("TAG", "----------------------BBBBBBBBBBBB----------------: ");

        return new BaseInputConnection(this, false); //this is needed for #dispatchKeyEvent() to be notified.

    }


    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        int keycode = event.getKeyCode();
        int keyunicode = event.getUnicodeChar(event.getMetaState());
        char character = (char) keyunicode;
        System.out.println("DEBUG MESSAGE KEY=" + character + " KEYCODE=" + keycode);
        Log.d("TAG", "--------PPPPPPPPPPPPPPPPP---------: "+  Constants.charList.size());
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public void addOnUnhandledKeyEventListener(OnUnhandledKeyEventListener listener) {
        Log.d("TAG", "--------PPPPPPPPPPPPPPPPP---------: ");

        super.addOnUnhandledKeyEventListener(listener);
    }

    @Override
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        int keycode = event.getKeyCode();
        int keyunicode = event.getUnicodeChar(event.getMetaState());
        char character = (char) keyunicode;
        System.out.println("DEBUG MESSAGE KEY=" + character + " KEYCODE=" + keycode);
        Log.d("TAG", "--------PPPPPPPPPPPPPPPPP---------: "+  Constants.charList.size());
        return super.onKeyUp(keyCode, event);
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        int keycode = event.getKeyCode();
        int keyunicode = event.getUnicodeChar(event.getMetaState());
        char character = (char) keyunicode;
        System.out.println("DEBUG MESSAGE KEY=" + character + " KEYCODE=" + keycode);
        if(event.getAction()==KeyEvent.ACTION_UP){
            if(keycode==67){
                if(Constants.charList.isEmpty()){
                }else {
                    Constants.charList.remove(Constants.charList.size()-1);

                }
            }else {
                Constants.charList.add(String.valueOf(character));
            }
            Log.d("TAG", "--------SSSSSSSSSSSSSSS---------: ");
            CustomActivity.recyclerView.getAdapter().notifyDataSetChanged();
        }

       


        boolean dispatchFirst = super.dispatchKeyEvent(event);
        return false;
    }

}