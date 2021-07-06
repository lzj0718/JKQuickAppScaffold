package com.xe.jkapp.ui.home;

import android.annotation.SuppressLint;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.navigation.Navigation;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import com.xe.jkapp.R;
import com.xe.jkapp.databinding.FragmentSecondPageBinding;


/**
 * A simple {@link Fragment} subclass.
 * Use the {@link SecondPageFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class SecondPageFragment extends Fragment {

    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";
    private FragmentSecondPageBinding binding;
    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    public SecondPageFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment SecondPageFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static SecondPageFragment newInstance(String param1, String param2) {
        SecondPageFragment fragment = new SecondPageFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }


    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        binding = FragmentSecondPageBinding.inflate(inflater, container, false);
        View root = binding.getRoot();
        binding.backBtn.setOnClickListener(new Button.OnClickListener(){

            public void onClick(View v) { //使用匿名的Button实例
                Navigation.findNavController(v).navigateUp();
            } }
        ) ;
        binding.goThreePageBtn.setOnClickListener(new Button.OnClickListener(){

            public void onClick(View v) { //使用匿名的Button实例
                Navigation.findNavController(v).navigate(R.id.action_three_page);
            } }
        ) ;
        root.setBackgroundColor(getResources().getColor(R.color.purple_200));
        return  root;
//        return inflater.inflate(R.layout.fragment_second_page, container, false);
    }
}