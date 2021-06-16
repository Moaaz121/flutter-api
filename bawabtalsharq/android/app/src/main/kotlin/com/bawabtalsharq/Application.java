package com.bawabtalsharq;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService;

public class Application extends FlutterApplication implements PluginRegistry.PluginRegistrantCallback {
    @Override
    public void onCreate() {
        super.onCreate();
        FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this);
    }

    @Override
    public void registerWith(PluginRegistry registry) {
        io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingPlugin.registerWith(
                registry.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"));

        com.tekartik.sqflite.SqflitePlugin.registerWith(
                registry.registrarFor("com.tekartik.sqflite.SqflitePlugin"));
    }

}
