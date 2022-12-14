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
    apiKey: 'AIzaSyC-4GziKul62e4vpJEJ-VKJiU_G-_mdUOQ',
    appId: '1:535084049450:web:7244ba59c94f2a532e0f53',
    messagingSenderId: '535084049450',
    projectId: 'calendario-school',
    authDomain: 'calendario-school.firebaseapp.com',
    storageBucket: 'calendario-school.appspot.com',
    measurementId: 'G-00W5HMZ5E3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmGXALuFQCvrHN5t0z4spz-eUn7H8W-Yc',
    appId: '1:535084049450:android:3049c54608e4023f2e0f53',
    messagingSenderId: '535084049450',
    projectId: 'calendario-school',
    storageBucket: 'calendario-school.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2R0BnX0KfqxXhra8VXrnqEBAkXTNyYFU',
    appId: '1:535084049450:ios:4bb3bd1b4c6409862e0f53',
    messagingSenderId: '535084049450',
    projectId: 'calendario-school',
    storageBucket: 'calendario-school.appspot.com',
    iosClientId: '535084049450-7kcb3pqsd77njhp0t498mev7i4qh5d6p.apps.googleusercontent.com',
    iosBundleId: 'com.example.calendarioEscolar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2R0BnX0KfqxXhra8VXrnqEBAkXTNyYFU',
    appId: '1:535084049450:ios:4bb3bd1b4c6409862e0f53',
    messagingSenderId: '535084049450',
    projectId: 'calendario-school',
    storageBucket: 'calendario-school.appspot.com',
    iosClientId: '535084049450-7kcb3pqsd77njhp0t498mev7i4qh5d6p.apps.googleusercontent.com',
    iosBundleId: 'com.example.calendarioEscolar',
  );
}
