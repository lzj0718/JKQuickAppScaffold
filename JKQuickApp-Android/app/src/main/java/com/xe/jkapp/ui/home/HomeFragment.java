package com.xe.jkapp.ui.home;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProvider;
import androidx.navigation.Navigation;

import com.xe.jkapp.R;
import com.xe.jkapp.databinding.FragmentHomeBinding;
import com.xe.jkapp.ui.flutter.JKFlutterActivity;

public class HomeFragment extends Fragment {

    private HomeViewModel homeViewModel;
    private FragmentHomeBinding binding;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        homeViewModel =
                new ViewModelProvider(this).get(HomeViewModel.class);

        binding = FragmentHomeBinding.inflate(inflater, container, false);
        View root = binding.getRoot();

        final TextView textView = binding.textHome;
        homeViewModel.getText().observe(getViewLifecycleOwner(), new Observer<String>() {
            @Override
            public void onChanged(@Nullable String s) {
                textView.setText(s);
            }
        });
        binding.goSecondBtn.setOnClickListener(new Button.OnClickListener() {

                                                   public void onClick(View v) { //使用匿名的Button实例
                                                       Bundle paramBundle = new Bundle();
                                                       paramBundle.putString("param1", "测试param1");
                                                       paramBundle.putString("param2", "测试param2");
                                                       Navigation.findNavController(v).navigate(R.id.action_second_page, paramBundle);
//                Navigation.findNavController(v).navigate(R.id.action_second_page);
                                                   }
                                               }
        );

        binding.goFlutterHomePage.setOnClickListener(new Button.OnClickListener() {

                                                         public void onClick(View v) { //使用匿名的Button实例
//                                                             startActivity(new Intent(getActivity(),JKFlutterActivity.class));
                                                             Navigation.findNavController(v).navigate(R.id.action_flutter_home_page);
                                                         }
                                                     }
        );
        return root;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}