// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCSD7w4TdYoMcm4yLVH9Ce0me_Epa_-khk',
    appId: '1:933125318955:web:70c394fc2ad41f0d7b7d6e',
    messagingSenderId: '933125318955',
    projectId: 'ecommerce-1bf31',
    authDomain: 'ecommerce-1bf31.firebaseapp.com',
    storageBucket: 'ecommerce-1bf31.appspot.com',
    measurementId: 'G-EYKF5ZY5L4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBp8089WXxoMXTMmTrOvUmqaGjzfUCE0HU',
    appId: '1:933125318955:android:869b12629eeb99e37b7d6e',
    messagingSenderId: '933125318955',
    projectId: 'ecommerce-1bf31',
    storageBucket: 'ecommerce-1bf31.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtUJ_TVSwZLhpNbyuFCmB7lOVxqlYEdts',
    appId: '1:933125318955:ios:33d46828607685df7b7d6e',
    messagingSenderId: '933125318955',
    projectId: 'ecommerce-1bf31',
    storageBucket: 'ecommerce-1bf31.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtUJ_TVSwZLhpNbyuFCmB7lOVxqlYEdts',
    appId: '1:933125318955:ios:33d46828607685df7b7d6e',
    messagingSenderId: '933125318955',
    projectId: 'ecommerce-1bf31',
    storageBucket: 'ecommerce-1bf31.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCSD7w4TdYoMcm4yLVH9Ce0me_Epa_-khk',
    appId: '1:933125318955:web:22cec11f1ca05ed57b7d6e',
    messagingSenderId: '933125318955',
    projectId: 'ecommerce-1bf31',
    authDomain: 'ecommerce-1bf31.firebaseapp.com',
    storageBucket: 'ecommerce-1bf31.appspot.com',
    measurementId: 'G-FKLND2J6WN',
  );
}
