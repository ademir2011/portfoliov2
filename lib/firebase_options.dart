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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDr-sGvJLyVrokyrOkPQV2RQbGAfQySh3E',
    appId: '1:948588277073:web:6adc7db5ce87714946b770',
    messagingSenderId: '948588277073',
    projectId: 'portfoliov2-e880f',
    authDomain: 'portfoliov2-e880f.firebaseapp.com',
    storageBucket: 'portfoliov2-e880f.appspot.com',
    measurementId: 'G-PMPSBLNCPK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeLr3LNqob0zUflWk6sxBA93jWG5_U4Ow',
    appId: '1:948588277073:android:13bd4ccf63aa1e1246b770',
    messagingSenderId: '948588277073',
    projectId: 'portfoliov2-e880f',
    storageBucket: 'portfoliov2-e880f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCN4TsfRKC5dQ43bYLfMnsq8vT_yYcWBME',
    appId: '1:948588277073:ios:71b364904beb18fd46b770',
    messagingSenderId: '948588277073',
    projectId: 'portfoliov2-e880f',
    storageBucket: 'portfoliov2-e880f.appspot.com',
    iosClientId: '948588277073-2oadf7g87tfhbsf42hbtuso7rg561qak.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfoliov2',
  );
}
