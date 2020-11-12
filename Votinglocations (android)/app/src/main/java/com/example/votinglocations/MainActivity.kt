package com.example.votinglocations

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.PersistableBundle
import android.view.View
import android.widget.RadioButton
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
    fun pollsNow(view:View)
    {
        var party = ""
        var voting = ""

        if (radioGroup.checkedRadioButtonId == -1) {
            val fillingSnackbar = Snackbar.make(
                root_layout,
                "Please select a party. These answers are for your eyes only.",
                Snackbar.LENGTH_SHORT
            ).show()
        }
        else
        {
            party = findViewById<RadioButton>(radioGroup.checkedRadioButtonId).text.toString()
            if(party == "Independant")
            {
                party = "an " + party
            }
            else
            {
                party = "a " + party
            }

            if(checkBox1.isChecked)
            {
                voting +=" "+checkBox1.text
            }
            if(checkBox2.isChecked)
            {
                voting +=" "+checkBox2.text
            }
            if(checkBox3.isChecked)
            {
                voting +=" "+checkBox3.text
            }

            var loc = "at the " + spinner.selectedItem

            if(switch1.isChecked)
            {
                loc="by mail"
            }

            if(voting.isEmpty())
            {
                voting=" none of the issues listed."
            }
            else
            {
                voting = " the" + voting
            }

            pollingPicker.text="You are voting for $party $loc and voting on$voting"
        }


    }

    override fun onSaveInstanceState(outState: Bundle, outPersistentState: PersistableBundle) {
        super.onSaveInstanceState(outState, outPersistentState)

        outState.putBoolean("switch1",switch1.isChecked)
        outState.putCharSequence("radiobutton",findViewById<RadioButton>(radioGroup.checkedRadioButtonId).text.toString())
        outState.putBoolean("check1",checkBox1.isChecked)
        outState.putBoolean("check2",checkBox2.isChecked)
        outState.putBoolean("check3",checkBox3.isChecked)
        outState.putInt("spinner", spinner.selectedItem as Int)
        outState.putString("finalText", pollingPicker.text as String?)
    }
}