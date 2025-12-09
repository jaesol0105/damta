package com.damta.damta

import android.app.Application
import androidx.multidex.MultiDexApplication

class MyApplication : MultiDexApplication() {
    override fun onCreate() {
        super.onCreate()
    }
}