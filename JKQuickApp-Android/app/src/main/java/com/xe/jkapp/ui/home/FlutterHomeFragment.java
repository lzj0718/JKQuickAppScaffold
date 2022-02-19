package com.xe.jkapp.ui.home;

import androidx.lifecycle.ViewModelProvider;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.xe.jkapp.R;

import io.flutter.embedding.android.FlutterFragment;

public class FlutterHomeFragment extends Fragment {

    private FlutterHomeViewModel mViewModel;

    public static FlutterHomeFragment newInstance() {
        return new FlutterHomeFragment();
    }

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.flutter_home_fragment, container, false);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        mViewModel = new ViewModelProvider(this).get(FlutterHomeViewModel.class);
        // TODO: Use the ViewModel

        FlutterFragment fragment = FlutterFragment.createDefault();
        getParentFragmentManager().beginTransaction().add(R.id.fragment_container, fragment).commit();
    }

}