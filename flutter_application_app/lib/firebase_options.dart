// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB9p7GnsfbkYALXR-F1SdUaQ3V0Rq3Rcqo',
    appId: '1:1006255797552:web:4d75cfc36bd5fcf05b84f5',
    messagingSenderId: '1006255797552',
    projectId: 'de-fevereiro',
    authDomain: 'de-fevereiro.firebaseapp.com',
    databaseURL: 'https://de-fevereiro-default-rtdb.firebaseio.com',
    storageBucket: 'de-fevereiro.appspot.com',
    measurementId: 'G-FPZ3H6KNER',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCO8M6uPNKEl74m_kxjbmsoUdZUrN6rY7s',
    appId: '1:1006255797552:android:00050e16a85a9f665b84f5',
    messagingSenderId: '1006255797552',
    projectId: 'de-fevereiro',
    databaseURL: 'https://de-fevereiro-default-rtdb.firebaseio.com',
    storageBucket: 'de-fevereiro.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBl4thUtV-w3b4wUPA6WYXpJ_ctIPMQOg0',
    appId: '1:1006255797552:ios:23d464bca37ce3f55b84f5',
    messagingSenderId: '1006255797552',
    projectId: 'de-fevereiro',
    databaseURL: 'https://de-fevereiro-default-rtdb.firebaseio.com',
    storageBucket: 'de-fevereiro.appspot.com',
    iosClientId: '1006255797552-c6t17sj435r1jfb1nvngtsd7u4q55ncu.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplicationApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBl4thUtV-w3b4wUPA6WYXpJ_ctIPMQOg0',
    appId: '1:1006255797552:ios:23d464bca37ce3f55b84f5',
    messagingSenderId: '1006255797552',
    projectId: 'de-fevereiro',
    databaseURL: 'https://de-fevereiro-default-rtdb.firebaseio.com',
    storageBucket: 'de-fevereiro.appspot.com',
    iosClientId: '1006255797552-c6t17sj435r1jfb1nvngtsd7u4q55ncu.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplicationApp',
  );
}