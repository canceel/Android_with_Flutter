package com.shenme.example.view;

import android.os.Bundle;
import android.text.TextUtils;
import android.widget.Toast;

import com.shenme.example.R;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

/**
 * author:       Shenme
 * date:         2018/12/14
 * description:
 */
public class FlutterPageActivity extends AppCompatActivity {

    public final static String ROUTE_PATH = "route_path";
    String routePath;
    MyFlutterFragment fragment;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_flutter);

        routePath = getIntent().getStringExtra(ROUTE_PATH);
        if (TextUtils.isEmpty(routePath)) {
            Toast.makeText(this, "路径无效", Toast.LENGTH_SHORT).show();
            finish();
            return;
        }

        Bundle bundle = new Bundle();
        bundle.putString(ROUTE_PATH, routePath);
        fragment = new MyFlutterFragment();
        fragment.setArguments(bundle);
        getSupportFragmentManager().beginTransaction()
                .replace(R.id.flutter, fragment, routePath).commitNow();
    }
}
