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
    apiKey: 'AIzaSyARQwRSj7i_LZ6vOt8g6rRURSpjdE0TlDY',
    appId: '1:433011867059:web:9450fe70603f00cc371fc6',
    messagingSenderId: '433011867059',
    projectId: 'dbu-888e3',
    authDomain: 'dbu-888e3.firebaseapp.com',
    storageBucket: 'dbu-888e3.appspot.com',
    measurementId: 'G-4VDE6V6KL2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDa9ODINfD8Cs6inbc7h2HPG4UEz43wGgw',
    appId: '1:433011867059:android:42187e4dd36dbc08371fc6',
    messagingSenderId: '433011867059',
    projectId: 'dbu-888e3',
    storageBucket: 'dbu-888e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhrXEuhCIENcQNKR14SDnTkLjtcSB0Xns',
    appId: '1:433011867059:ios:0e31893551f921e8371fc6',
    messagingSenderId: '433011867059',
    projectId: 'dbu-888e3',
    storageBucket: 'dbu-888e3.appspot.com',
    iosBundleId: 'com.dbu.dbu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhrXEuhCIENcQNKR14SDnTkLjtcSB0Xns',
    appId: '1:433011867059:ios:617414f90207234d371fc6',
    messagingSenderId: '433011867059',
    projectId: 'dbu-888e3',
    storageBucket: 'dbu-888e3.appspot.com',
    iosBundleId: 'com.dbu.dbu.RunnerTests',
  );
}
