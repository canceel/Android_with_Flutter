package com.shenme.example.view;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.shenme.example.R;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    Activity mActivity;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mActivity = this;

        findViewById(R.id.index).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(mActivity, FlutterPageActivity.class);
                intent.putExtra(FlutterPageActivity.ROUTE_PATH, "index");
                startActivity(intent);
            }
        });
        findViewById(R.id.product_detail).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(mActivity, FlutterPageActivity.class);
                intent.putExtra(FlutterPageActivity.ROUTE_PATH, "product_detail");
                startActivity(intent);
            }
        });
    }

//    private static final String CHANNEL = "demo.plugin";
//    private void aa(){
//        // 自定义插件
//        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
//            @Override
//            public void onMethodCall(MethodCall call, MethodChannel.Result result) {
//                if (call.method.equals("interaction")) {
//                    Intent intent = new Intent(mActivity, MainActivity.class);
//                    MainActivity.this.startActivity(intent);
//                    result.success("success");
//                } else {
//                    result.notImplemented();
//                }
//            }
//        });
//    }
}
