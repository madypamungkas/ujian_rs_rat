package net.simetris.ujian_rs_rat;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void onClickLogout(View view) {
        Intent intent = new Intent( MainActivity.this, SplashScreenActivity.class);
        startActivity(intent);

    }
}