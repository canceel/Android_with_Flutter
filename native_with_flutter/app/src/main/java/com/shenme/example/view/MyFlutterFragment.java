package com.shenme.example.view;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import io.flutter.facade.Flutter;

/**
 * author:       Shenme
 * date:         2018/12/15
 * description:
 */
public class MyFlutterFragment extends Fragment {

    String routh;

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        routh=this.getArguments().getString(FlutterPageActivity.ROUTE_PATH);
        return Flutter.createView(requireActivity(),getLifecycle(),routh);
    }

}
