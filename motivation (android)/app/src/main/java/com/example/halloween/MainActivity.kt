package com.example.halloween

import android.media.Image
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.Editable
import android.view.View
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun Motivate(view: View)
    {
        val motivateText = findViewById<TextView>(R.id.textMessage)
        val name = findViewById<EditText>(R.id.editName).text
        val activity = findViewById<EditText>(R.id.editActivityName).text
        motivateText.text = "$name, you got this! Go do "+activity

        val imageMotivation = findViewById<ImageView>(R.id.imageView).setImageResource(R.drawable.motivation)
    }
}

