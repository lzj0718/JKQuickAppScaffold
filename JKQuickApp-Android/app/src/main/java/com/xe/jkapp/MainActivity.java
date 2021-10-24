package com.xe.jkapp;

import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.app.ActionBar;
import android.content.ContentUris;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.navigation.NavController;
import androidx.navigation.NavDestination;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;

import com.xe.jkapp.databinding.ActivityMainBinding;

import org.jetbrains.annotations.NotNull;

public class MainActivity extends AppCompatActivity {

    private ActivityMainBinding binding;

    /**
     * BottomNav显示控制
     */
    private boolean isShowBottomNav = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        System.out.println("调用第三方本地aar库："+JKCacheManager.version);
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        // Passing each menu ID as a set of Ids because each
        // menu should be considered as top level destinations.
        AppBarConfiguration appBarConfiguration = new AppBarConfiguration.Builder(
                R.id.navigation_home, R.id.navigation_dashboard, R.id.navigation_notifications)
                .build();
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_activity_main);
        //设置顶部导航条
        NavigationUI.setupActionBarWithNavController(this, navController, appBarConfiguration);
        //设置绑定底部菜单BottomNavigation -  Navigation ；fragment id 需要与menu item id 一一对应
        NavigationUI.setupWithNavController(binding.navView, navController);

        //控制顶部bottom隐藏
        navController.addOnDestinationChangedListener(new NavController.OnDestinationChangedListener() {

            @Override
            public void onDestinationChanged(@NonNull NavController controller, @NonNull NavDestination destination,
                                             @Nullable Bundle arguments) {
                if (destination.getId() == R.id.navigation_home ||
                        destination.getId() == R.id.navigation_dashboard ||
                        destination.getId() == R.id.navigation_notifications) {
                    showBottomView();
                }else {
                    hideBottomNav();
                }
            }
        });

    }

    private void showBottomView() {
        if (!isShowBottomNav) {
            binding.navView.setVisibility(View.VISIBLE);
            ObjectAnimator.ofFloat(binding.navView, "translationY", binding.navView.getHeight(), 0).setDuration(250).start();
            isShowBottomNav = true;
        }
    }

    private void hideBottomNav() {
        if (isShowBottomNav) {
            ObjectAnimator.ofFloat(binding.navView, "translationY", 0, binding.navView.getHeight()).setDuration(250).start();
            isShowBottomNav = false;
        }
    }


    @Override
    public boolean onSupportNavigateUp(){
        return Navigation.findNavController(this, R.id.nav_host_fragment_activity_main).navigateUp();
    }

}