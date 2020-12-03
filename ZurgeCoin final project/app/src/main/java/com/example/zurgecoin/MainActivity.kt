package com.example.zurgecoin

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Bundle
import android.util.DisplayMetrics
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import java.util.*
import kotlin.random.Random


//https://www.youtube.com/watch?v=qChiiARAcsI: credit for accelerometer usage

class MainActivity : AppCompatActivity(), SensorEventListener {

    lateinit var sensorManager : SensorManager
    var gravz=FloatArray(2)
    var maxMins=IntArray(4)
    var pushed: Int= 0
    var inPlay: Boolean=false
    var coinincrement: Int=0
    var level: Int=1
    var trueCoin= Array<String>(16) {""}
    var trueWorm= Array<String>(20) {""}
    var endTry: Boolean=false

    val coins= arrayOf(
        arrayOf("coin37", "coin38", "coin39", "coin40"),
        arrayOf("coin33", "coin34", "coin35", "coin36"),
        arrayOf("conin29", "coin30", "coin31", "coin32"),
        arrayOf("coin1", "coin26", "coin27", "coin28")
    )

    val wormholes= arrayOf(
        arrayOf("wormhole18", "wormhole19", "wormhole20", "wormhole21", "wormhole22"),
        arrayOf("wormhole13", "wormhole14", "wormhole15", "wormhole16", "wormhole17"),
        arrayOf("wormhole8", "wormhole9", "wormhole10", "wormhole11", "wormhole12"),
        arrayOf("wormhole7", "wormhole4", "wormhole5", "wormhole6", "wormhole1")
    )


    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null && inPlay==true) {

            gravz[0]=event.values[0]
            gravz[1]=event.values[1]
            var Acceleration = floatArrayOf(
                (-gravz[0] * .66666).toFloat(),
                (gravz[1] * .66666).toFloat()
            )

                spaceShip.setX(spaceShip.x + Acceleration[0])
                spaceShip.setY(spaceShip.y + Acceleration[1])

            var centerX:Float= spaceShip.x+spaceShip.width/2
            var centerY:Float= spaceShip.y+spaceShip.height/2
            checkCollision(centerX, centerY)
        }
    }
    fun endGame(){
        coinCounter.text="Oh no! You got sucked into a black hole! Would you like to try again?"
        startButton.text="try again"
        inPlay=false
        endTry=true
    }

    fun startStop(view: View)
    {
        if(pushed==0 || pushed%2==0)
        {
            startButton.text="Pause"
            inPlay=true
        }
        else if(pushed%2!=0 && endTry==false)
        {
            startButton.text="Resume"
            inPlay=false
        }
        else{
            endTry=false
            wormhole18.visibility = View.INVISIBLE
            wormhole19.visibility = View.INVISIBLE
            wormhole20.visibility = View.INVISIBLE
            wormhole21.visibility = View.INVISIBLE
            wormhole22.visibility = View.INVISIBLE
            wormhole13.visibility = View.INVISIBLE
            wormhole14.visibility = View.INVISIBLE
            wormhole15.visibility = View.INVISIBLE
            wormhole16.visibility = View.INVISIBLE
            wormhole17.visibility = View.INVISIBLE
            wormhole8.visibility = View.INVISIBLE
            wormhole9.visibility = View.INVISIBLE
            wormhole10.visibility = View.INVISIBLE
            wormhole11.visibility = View.INVISIBLE
            wormhole12.visibility = View.INVISIBLE
            wormhole7.visibility = View.INVISIBLE
            wormhole4.visibility = View.INVISIBLE
            wormhole5.visibility = View.INVISIBLE
            wormhole6.visibility = View.INVISIBLE
            wormhole1.visibility = View.INVISIBLE
            coin1.visibility = View.INVISIBLE
            coin26.visibility = View.INVISIBLE
            coin27.visibility = View.INVISIBLE
            coin28.visibility = View.INVISIBLE
            coin29.visibility = View.INVISIBLE
            coin30.visibility = View.INVISIBLE
            coin31.visibility = View.INVISIBLE
            coin32.visibility = View.INVISIBLE
            coin33.visibility = View.INVISIBLE
            coin34.visibility = View.INVISIBLE
            coin35.visibility = View.INVISIBLE
            coin36.visibility = View.INVISIBLE
            coin37.visibility = View.INVISIBLE
            coin38.visibility = View.INVISIBLE
            coin39.visibility = View.INVISIBLE
            coin40.visibility = View.INVISIBLE
            inPlay=true
            coinCounter.text="Coin 0"
            coinincrement=0
            createCoinsAndSuch()
        }
        pushed++
    }


    fun distanceForm(
        coinNot: Boolean,
        coin: String,
        xOrigin: Float,
        yOrigin: Float,
        xNew: Float,
        yNew: Float
    ){
        var x=Math.pow(xNew.toDouble() - xOrigin.toDouble(), 2.toDouble())
        var y=Math.pow(yNew.toDouble() - yOrigin.toDouble(), 2.toDouble())
        if(Math.pow(x + y, .5)<(coin1.width/2)+(spaceShip.width/2)-40)
        {
            if(coinNot==true) {
                coinincrement++
                when (coin) {
                    "coin1" -> coin1.visibility = View.INVISIBLE
                    "coin26" -> coin26.visibility = View.INVISIBLE
                    "coin27" -> coin27.visibility = View.INVISIBLE
                    "coin28" -> coin28.visibility = View.INVISIBLE
                    "coin29" -> coin29.visibility = View.INVISIBLE
                    "coin30" -> coin30.visibility = View.INVISIBLE
                    "coin31" -> coin31.visibility = View.INVISIBLE
                    "coin32" -> coin32.visibility = View.INVISIBLE
                    "coin33" -> coin33.visibility = View.INVISIBLE
                    "coin34" -> coin34.visibility = View.INVISIBLE
                    "coin35" -> coin35.visibility = View.INVISIBLE
                    "coin36" -> coin36.visibility = View.INVISIBLE
                    "coin37" -> coin37.visibility = View.INVISIBLE
                    "coin38" -> coin38.visibility = View.INVISIBLE
                    "coin39" -> coin39.visibility = View.INVISIBLE
                    "coin40" -> coin40.visibility = View.INVISIBLE
                }
                trueCoin[trueCoin.indexOf(coin)] = ""
                coinCounter.text = "${coinincrement}"
            }
            else{
               endGame()
            }
        }
    }

    fun checkCollision(xCenter: Float, yCenter: Float){

        for(n in 0..trueCoin.size-1){
            when (trueCoin[n]) {
                "coin1" -> distanceForm(
                    true,
                    "coin1",
                    xCenter,
                    yCenter,
                    coin1.x + coin1.width / 2,
                    coin1.y + coin1.height / 2
                )
                "coin26" -> distanceForm(
                    true,
                    "coin26",
                    xCenter,
                    yCenter,
                    coin26.x + coin26.width / 2,
                    coin26.y + coin26.height / 2
                )
                "coin27" -> distanceForm(
                    true,
                    "coin27",
                    xCenter,
                    yCenter,
                    coin27.x + coin27.width / 2,
                    coin27.y + coin27.height / 2
                )
                "coin28" -> distanceForm(
                    true,
                    "coin28",
                    xCenter,
                    yCenter,
                    coin28.x + coin28.width / 2,
                    coin28.y + coin28.height / 2
                )
                "coin29" -> distanceForm(
                    true,
                    "coin29",
                    xCenter,
                    yCenter,
                    coin29.x + coin29.width / 2,
                    coin29.y + coin29.height / 2
                )
                "coin30" -> distanceForm(
                    true,
                    "coin30",
                    xCenter,
                    yCenter,
                    coin30.x + coin30.width / 2,
                    coin30.y + coin30.height / 2
                )
                "coin31" -> distanceForm(
                    true,
                    "coin31",
                    xCenter,
                    yCenter,
                    coin31.x + coin31.width / 2,
                    coin31.y + coin31.height / 2
                )
                "coin32" -> distanceForm(
                    true,
                    "coin32",
                    xCenter,
                    yCenter,
                    coin32.x + coin32.width / 2,
                    coin32.y + coin32.height / 2
                )
                "coin33" -> distanceForm(
                    true,
                    "coin33",
                    xCenter,
                    yCenter,
                    coin33.x + coin33.width / 2,
                    coin33.y + coin33.height / 2
                )
                "coin34" -> distanceForm(
                    true,
                    "coin34",
                    xCenter,
                    yCenter,
                    coin34.x + coin34.width / 2,
                    coin34.y + coin34.height / 2
                )
                "coin35" -> distanceForm(
                    true,
                    "coin35",
                    xCenter,
                    yCenter,
                    coin35.x + coin35.width / 2,
                    coin35.y + coin35.height / 2
                )
                "coin36" -> distanceForm(
                    true,
                    "coin36",
                    xCenter,
                    yCenter,
                    coin36.x + coin36.width / 2,
                    coin36.y + coin36.height / 2
                )
                "coin37" -> distanceForm(
                    true,
                    "coin37",
                    xCenter,
                    yCenter,
                    coin37.x + coin37.width / 2,
                    coin37.y + coin37.height / 2
                )
                "coin38" -> distanceForm(
                    true,
                    "coin38",
                    xCenter,
                    yCenter,
                    coin38.x + coin38.width / 2,
                    coin38.y + coin38.height / 2
                )
                "coin39" -> distanceForm(
                    true,
                    "coin39",
                    xCenter,
                    yCenter,
                    coin39.x + coin39.width / 2,
                    coin39.y + coin39.height / 2
                )
                "coin40" -> distanceForm(
                    true,
                    "coin40",
                    xCenter,
                    yCenter,
                    coin40.x + coin40.width / 2,
                    coin40.y + coin40.height / 2
                )
            }
        }
        for(n in 0..trueWorm.size-1)
        {
            when(trueWorm[n]) {
                "wormhole18" -> distanceForm(
                    false,
                    "wormhole18",
                    xCenter,
                    yCenter,
                    wormhole18.x + wormhole18.width / 2,
                    wormhole18.y + wormhole18.height / 2
                )
                "wormhole19" -> distanceForm(
                    false,
                    "wormhole19",
                    xCenter,
                    yCenter,
                    wormhole19.x + wormhole19.width / 2,
                    wormhole19.y + wormhole19.height / 2
                )
                "wormhole20" -> distanceForm(
                    false,
                    "wormhole20",
                    xCenter,
                    yCenter,
                    wormhole19.x + wormhole19.width / 2,
                    wormhole19.y + wormhole19.height / 2
                )
                "wormhole21" -> distanceForm(
                    false,
                    "wormhole21",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole22" -> distanceForm(
                    false,
                    "wormhole22",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole13" -> distanceForm(
                    false,
                    "wormhole13",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole14" -> distanceForm(
                    false,
                    "wormhole14",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole15" -> distanceForm(
                    false,
                    "wormhole15",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole16" -> distanceForm(
                    false,
                    "wormhole16",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole17" -> distanceForm(
                    false,
                    "wormhole17",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole8" -> distanceForm(
                    false,
                    "wormhole8",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole9" -> distanceForm(
                    false,
                    "wormhole9",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole10" -> distanceForm(
                    false,
                    "wormhole10",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole11" -> distanceForm(
                    false,
                    "wormhole11",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole12" -> distanceForm(
                    false,
                    "wormhole12",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole7" -> distanceForm(
                    false,
                    "wormhole7",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole4" -> distanceForm(
                    false,
                    "wormhole4",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole5" -> distanceForm(
                    false,
                    "wormhole5",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole6" -> distanceForm(
                    false,
                    "wormhole6",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
                "wormhole1" -> distanceForm(
                    false,
                    "wormhole1",
                    xCenter,
                    yCenter,
                    wormhole21.x + wormhole21.width / 2,
                    wormhole21.y + wormhole21.height / 2
                )
            }
        }
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val displayMetrics = DisplayMetrics()

        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        sensorManager.registerListener(
            this,
            sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER),
            SensorManager.SENSOR_DELAY_FASTEST
        )

        createCoinsAndSuch()
    }

    fun createCoinsAndSuch(){
        var limit: Int=0
        when(level)
        {
            1 -> limit = 4
            2 -> limit = 5
            3 -> limit = 6
            4 -> limit = 7
            5 -> limit = 8
        }
        var counter: Int=0
        while(counter<6) {
            for (n in 0..3) {
                for (j in 0..3) {
                    if (Random.nextBoolean() && counter < 8) {
                        var yes = coins[n][j]
                        when (yes) {
                            "coin1" -> coin1.visibility = View.VISIBLE
                            "coin26" -> coin26.visibility = View.VISIBLE
                            "coin27" -> coin27.visibility = View.VISIBLE
                            "coin28" -> coin28.visibility = View.VISIBLE
                            "coin29" -> coin29.visibility = View.VISIBLE
                            "coin30" -> coin30.visibility = View.VISIBLE
                            "coin31" -> coin31.visibility = View.VISIBLE
                            "coin32" -> coin32.visibility = View.VISIBLE
                            "coin33" -> coin33.visibility = View.VISIBLE
                            "coin34" -> coin34.visibility = View.VISIBLE
                            "coin35" -> coin35.visibility = View.VISIBLE
                            "coin36" -> coin36.visibility = View.VISIBLE
                            "coin37" -> coin37.visibility = View.VISIBLE
                            "coin38" -> coin38.visibility = View.VISIBLE
                            "coin39" -> coin39.visibility = View.VISIBLE
                            "coin40" -> coin40.visibility = View.VISIBLE
                        }
                        trueCoin[counter++]=yes
                    } else {
                        break;
                    }
                }
            }
        }

        counter=0
        while(counter<limit-2) {
            for (n in 0..3) {
                for (j in 0..4) {
                    if (Random.nextBoolean() && counter < limit) {
                        var yes = wormholes[n][j]
                        println(yes)
                        when (yes) {
                            "wormhole18" -> wormhole18.visibility = View.VISIBLE
                            "wormhole19" -> wormhole19.visibility = View.VISIBLE
                            "wormhole20" -> wormhole20.visibility = View.VISIBLE
                            "wormhole21" -> wormhole21.visibility = View.VISIBLE
                            "wormhole22" -> wormhole22.visibility = View.VISIBLE
                            "wormhole13" -> wormhole13.visibility = View.VISIBLE
                            "wormhole14" -> wormhole14.visibility = View.VISIBLE
                            "wormhole15" -> wormhole15.visibility = View.VISIBLE
                            "wormhole16" -> wormhole16.visibility = View.VISIBLE
                            "wormhole17" -> wormhole17.visibility = View.VISIBLE
                            "wormhole8" -> wormhole8.visibility = View.VISIBLE
                            "wormhole9" -> wormhole9.visibility = View.VISIBLE
                            "wormhole10" -> wormhole10.visibility = View.VISIBLE
                            "wormhole11" -> wormhole11.visibility = View.VISIBLE
                            "wormhole12" -> wormhole12.visibility = View.VISIBLE
                            "wormhole7" -> wormhole7.visibility = View.VISIBLE
                            "wormhole4" -> wormhole4.visibility = View.VISIBLE
                            "wormhole5" -> wormhole5.visibility = View.VISIBLE
                            "wormhole6" -> wormhole6.visibility = View.VISIBLE
                            "wormhole1" -> wormhole1.visibility = View.VISIBLE
                        }
                        trueWorm[counter++]=yes
                    } else {
                        break;
                    }
                }
            }
        }
    }

    override fun onResume() {
        super.onResume()
        // Register this class as a listener for the accelerometer sensor
        sensorManager.registerListener(
            this, sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER),
            SensorManager.SENSOR_DELAY_FASTEST
        )
    }

    override fun onStop() {
        // Unregister the listener
        sensorManager.unregisterListener(this)
        super.onStop()
    }


}

